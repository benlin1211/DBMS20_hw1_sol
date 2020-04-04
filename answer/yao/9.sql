-- 某知名實況主曾言：你李星 (Lee Sin) 我提摩 (Teemo)。請列出在各個版本 (version) 中（小數點前二位相同即為同一版本，反之則不同），當李星 (Lee Sin) 與提摩 (Teemo) 在同一隊時，勝場、敗場與勝率（勝場／(勝場+敗場) ）分別為何，請依照 version “字典順序” 輸出，例：4.1, 4.10, 4.2, 4.3

SELECT substring_index(m.version, '.', 2) as version, SUM(candidate_group.win) as win_cnt, COUNT(*) - SUM(candidate_group.win) as lose_cnt
FROM
(
    SELECT *, COUNT(*) as cnt
    FROM
    (
        SELECT p.match_id, c.champion_name, s.win, floor(player / 6) as teamgroup
        FROM participant as p, stat as s, champ as c
        WHERE p.player_id = s.player_id
        AND p.champion_id = c.champion_id
        AND (c.champion_name = 'Teemo'
        OR c.champion_name = 'Lee Sin')
    ) as info
    GROUP BY info.match_id, info.teamgroup
) as candidate_group, match_info as m
WHERE candidate_group.cnt = 2
AND candidate_group.match_id = m.match_id
GROUP BY version;