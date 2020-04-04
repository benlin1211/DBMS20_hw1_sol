-- 列出五個位置 (TOP/MID/JUNGLE/DUO_CARRY/DUO_SUPPORT) 中，且總擊殺參與率 (總KDA = (總Kill + 總Assist) / 總Death) 最高的英雄與對應的總KDA值（不考慮總Death為0的英雄）（提示：group by, sum）（請依照位置字典順序輸出，如下方範例）

SELECT info.position as position, c.champion_name as champion_name, info.kda as kda
FROM
(
    SELECT p.position, p.champion_id, SUM(s.deaths) as total_death, (SUM(s.kills) + SUM(s.assists)) / SUM(s.deaths) as kda
    FROM stat as s, participant as p
    WHERE s.player_id = p.player_id
    AND p.position != 'NONE'
    AND p.position != 'BOT'
    AND p.position != 'DUO'
    AND p.position != 'SOLO'
    GROUP BY p.champion_id, p.position
    ORDER BY kda DESC
) as info, champ as c
WHERE c.champion_id = info.champion_id
AND info.total_death != 0
GROUP BY info.position
ORDER BY info.position