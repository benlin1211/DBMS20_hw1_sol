-- 在LOL中，有時會刻意選擇前/後期英雄確保遊戲時間進行到前/後面能有很大的勝率。列出當比賽遊戲時間在40~50分鐘 (duration) (皆包含邊界時間) 時五個位置 (TOP/MID/JUNGLE/DUO_CARRY/DUO_SUPPORT) 分別出現最多次的英雄（提示：between）

SELECT info.position, c.champion_name
FROM
(
    SELECT p.champion_id, p.position, COUNT(*) as appear
    FROM participant as p, match_info as m
    WHERE p.position != 'NONE'
    AND p.position != 'DUO'
    AND p.position != 'BOT'
    AND p.position != 'SOLO'
    AND m.duration BETWEEN 2400 AND 3000
    AND m.match_id = p.match_id
    GROUP BY p.champion_id, p.position
    ORDER BY appear DESC
) as info, champ as c
WHERE c.champion_id = info.champion_id
GROUP BY info.position;