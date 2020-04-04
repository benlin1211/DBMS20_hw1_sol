-- 列出五個位置 (TOP/MID/JUNGLE/DUO_CARRY/DUO_SUPPORT) 中，且總擊殺參與率 (總KDA = (總Kill + 總Assist) / 總Death) 最高的英雄與對應的總KDA值（提示：group by, sum）

select final.position, final.champion_name, max(final.sum_kda)
from
(
    select grp.position, grp.champion_name, (grp.sum_kills+grp.sum_assists)/grp.sum_deaths as sum_kda
    from
    (
        select par_champ.position, par_champ.champion_name, sum(sub_stat.kills) as sum_kills,
            sum(sub_stat.deaths) as sum_deaths, sum(sub_stat.assists) as sum_assists
        from 
        (
            select par.player_id, champ.champion_name, par.position
            from participant as par, champ
            where champ.champion_id = par.champion_id and
            (   par.position = 'TOP' or par.position = 'MID' or par.position = 'JUNGLE'
                or par.position = 'DUO_CARRY' or par.position = 'DUO_SUPPORT'
            )
        ) as par_champ,
        (
            select player_id, kills, deaths, assists
            from stat
        ) as sub_stat
        where par_champ.player_id = sub_stat.player_id
        group by par_champ.position, par_champ.champion_name
    ) as grp
    group by grp.position, grp.champion_name
    order by sum_kda desc
) as final
group by final.position;
