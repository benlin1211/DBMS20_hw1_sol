-- 資料中，遊戲總共經歷了幾次不同的版本 (version)（這裡只要版本號不一樣，就算是新的版本）（提示：distinct）

SELECT c.champion_name
FROM champ as c
WHERE c.champion_id NOT IN (
    						SELECT DISTINCT champion_id
    						FROM teamban, match_info
    						WHERE match_info.version LIKE '7.7%'
    						AND teamban.match_id = match_info.match_id
    						);