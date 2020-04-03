-- 資料中，遊戲總共經歷了幾次不同的版本 (version)（只要版本號前兩位相同即為同一版）(例：“7.9.186.1051”與“7.9.186.8155”為同一版，但與“7.8.184.113”為不同版)（提示：distinct）

select count(distinct substring_index(version, '.', 2))
from match_info;