-- 在LOL角色中，有些角色會比較容易打贏或打輸特定角色。列出當上路 (TOP) 對手為雷尼克頓 (Renekton) 時，上路 (TOP) 角色勝率（參考第九題定義）最高的前五隻英雄，並列出上路 (TOP) 雙方的總擊殺參與率 (總KDA，參考第七題定義) 與平均經濟 (goldearned)。這邊我們只在乎與雷尼克頓 (Renekton) 對峙的資料大於100筆的英雄

SELECT *
FROM
(
    SELECT self_champ_name, SUM(self_win) / COUNT(*) as win_ratio, (SUM(self_kills)+SUM(self_assists)) / SUM(self_deaths) as self_kda, AVG(self_gold) as self_avg_gold, enemy_champ_name, (SUM(enemy_kills)+SUM(enemy_assists)) / SUM(enemy_deaths) as enemy_kda, AVG(enemy_gold) as enemy_avg_gold, COUNT(*) as game
    FROM
    (
        SELECT infoA.champion_name as self_champ_name, infoA.win as self_win, infoA.kills as self_kills, infoA.assists as self_assists, infoA.deaths as self_deaths, infoA.goldearned as self_gold, infoB.champion_name as enemy_champ_name, infoB.win as enemy_win, infoB.kills as enemy_kills, infoB.assists as enemy_assists, infoB.deaths as enemy_deaths, infoB.goldearned as enemy_gold
        FROM
        (
            SELECT p.match_id, p.player, c.champion_name, s.win, s.kills, s.assists, s.deaths, s.goldearned
            FROM participant as p, stat as s, champ as c
            WHERE p.player_id = s.player_id
            AND p.position = 'TOP'
            AND p.champion_id = c.champion_id
            AND c.champion_name != 'Renekton'
        ) as infoA
        INNER JOIN 
        (
            SELECT p.match_id, p.player, c.champion_name, s.win, s.kills, s.assists, s.deaths, s.goldearned
            FROM participant as p, stat as s, champ as c
            WHERE p.player_id = s.player_id
            AND p.position = 'TOP'
            AND p.champion_id = c.champion_id
            AND c.champion_name = 'Renekton'
        ) as infoB
        ON infoA.match_id = infoB.match_id
        AND infoA.win != infoB.win
    ) as combine
    GROUP BY combine.self_champ_name, combine.enemy_champ_name
) as final
WHERE game >= 100
ORDER BY win_ratio DESC
LIMIT 5;