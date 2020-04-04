-- 列出遊戲時間前5高的場次id，並顯示其遊戲時間多久（請將遊戲時間換成“時:分:秒”的字串格式）（例：00:34:07）

select match_id, sec_to_time(duration) as time
from match_info 
order by time desc 
limit 5;