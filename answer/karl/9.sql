-- 某知名實況主曾言：你李星 (Lee Sin) 我提摩 (Teemo)。請列出在各個版本 (version) 中（小數點前二位相同即為同一版本，反之則不同），當李星 (Lee Sin) 與提摩 (Teemo) 在同一隊時，勝場、敗場與勝率（勝場／敗場）分別為何

select substring_index(match_info.version, '.', 2) as version, sum(par_champ_stat_cnt.win) as win_cnt,
    count(*)-sum(par_champ_stat_cnt.win) as lose_cnt, (sum(par_champ_stat_cnt.win)/count(*)) as win_ratio
from match_info,
(
    select match_id, win, count(win) as cnt
    from
    (
        select distinct par_champ.match_id, par_champ.champion_name, stat_shrink.win
        from 
        (
            select par.player_id, par.match_id, champ.champion_name
            from participant as par, champ
            where par.champion_id = champ.champion_id
            and 
            (   
                champ.champion_name = 'Lee Sin'
                or champ.champion_name = 'Teemo'
            )
        ) as par_champ, 
        (
            select player_id, win
            from stat
        ) as stat_shrink
        where stat_shrink.player_id = par_champ.player_id
    ) as par_champ_stat
    group by par_champ_stat.match_id, par_champ_stat.win
) as par_champ_stat_cnt
where par_champ_stat_cnt.cnt > 1
and par_champ_stat_cnt.match_id = match_info.match_id
group by substring_index(match_info.version, '.', 2)
order by substring_index(match_info.version, '.', 2) asc;
