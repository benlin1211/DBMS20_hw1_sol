-- 每場遊戲都是兩隊伍互相競賽。請查出隊伍平均最長存活時間 (longesttimespentliving) 超過20分鐘 (包含20分鐘) 的隊伍中，贏的隊伍和輸的隊伍筆數各有多少隊（注意longesttimespentliving只單指該玩家最長存活時間）

select if(grp_stat.win=1, 'win', 'lose') as win_lose, count(grp_stat.match_id) as cnt
from
(
    select par.match_id, stat.win, avg(stat.longesttimespentliving) as avg_living
    from (
            select player_id, match_id
            from participant
        ) as par,
        (
            select player_id, win, longesttimespentliving
            from stat
        ) as stat
    where par.player_id = stat.player_id
    group by par.match_id, stat.win
) as grp_stat
where grp_stat.avg_living >= 1200
group by grp_stat.win;