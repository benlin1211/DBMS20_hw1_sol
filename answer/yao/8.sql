-- 列出在7.7版本中，沒有被禁用過的英雄名稱（提示：not in），請依照英雄名稱字典順序由小到大排序

SELECT c.champion_name
FROM champ as c
WHERE c.champion_id NOT IN (
    						SELECT DISTINCT champion_id
    						FROM teamban, match_info
    						WHERE match_info.version LIKE '7.7%'
    						AND teamban.match_id = match_info.match_id
    						)
ORDER BY c.champion_name ASC;