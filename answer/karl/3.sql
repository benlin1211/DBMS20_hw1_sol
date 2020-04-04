-- 找出玩家在打JUNGLE位置時，前3名最常用的角色名稱與其資料筆數，並根據筆數由大到小排序（提示：order by, limit）

select champ.champion_name, count(*) as cnt
from participant as par, champ
where par.position = 'JUNGLE'
and par.champion_id = champ.champion_id
group by champ.champion_id
order by cnt desc
limit 3;