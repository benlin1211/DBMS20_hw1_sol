-- 資料中，遊戲總共經歷了幾次不同的版本 (version)（這裡只要版本號不一樣，就算是新的版本）（提示：distinct）

select count(distinct substring_index(version, '.', 2))
from match_info;