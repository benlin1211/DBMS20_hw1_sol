-- 在LOL角色中，有些角色會比較容易打贏或打輸特定角色。列出當上路 (TOP) 對手為雷尼克頓 (Renekton) 時，上路 (TOP) 角色勝率（參考第九題定義）最高的前五隻英雄，並列出上路 (TOP) 雙方的總擊殺參與率 (總KDA，參考第七題定義) 與平均經濟 (goldearned)。這邊我們只在乎與雷尼克頓 (Renekton) 對峙的資料大於100筆的英雄

SELECT *
FROM
(
    SELECT c.champion_name as self_champ_name, SUM(s.win) / COUNT(*) as win_ratio, (SUM(s.kills) + SUM(s.assists)) / SUM(s.deaths) as self_kda, AVG(s.goldearned) as self_avg_gold, COUNT(*) as game
    FROM participant as p, stat as s, champ as c
    WHERE p.player_id = s.player_id
    AND p.position = 'TOP'
    AND p.champion_id = c.champion_id
    AND p.match_id IN (
                        SELECT p.match_id
                        FROM participant as p, stat as s, champ as c
                        WHERE p.player_id = s.player_id
                        AND p.position = 'TOP'
                        AND p.champion_id = c.champion_id
                        AND c.champion_name = 'Renekton'
                      )
    GROUP BY c.champion_name
    ORDER BY win_ratio DESC
) as self_info
WHERE self_info.game >= 100
LIMIT 5
