-- 找出玩家在打Jungle位置時，前3名最常用的角色名稱與其資料筆數，並根據筆數由大到小排序（提示：order by, limit）

select c.champion_name, count(*) as cnt
from champ as c, participant as p
where p.position = 'JUNGLE'
and c.champion_id = p.champion_id
group by p.champion_id
order by cnt desc
limit 3;