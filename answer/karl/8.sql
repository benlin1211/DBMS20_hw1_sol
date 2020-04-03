-- 列出在7.7版本中，沒有被禁用過的英雄名稱（提示：not in），請依照英雄名稱字典順序由小到大排序

select champ.champion_name
from champ
where champ.champion_id not in
(
    select distinct teamban.champion_id
    from teamban
    where teamban.match_id in 
    (
        select match_id
        from match_info
        where version like '7.7.%'
    )
)
order by champ.champion_name asc;
