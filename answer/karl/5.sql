-- 每場遊戲都是兩隊伍互相競賽。請查出隊伍平均最長存活時間 (longesttimespentliving) 超過20分鐘 (包含20分鐘) 的隊伍中，贏的隊伍和輸的隊伍筆數各有多少隊（注意longesttimespentliving只單指該玩家最長存活時間）

select grp_stat.win, count(grp_stat.match_id)
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

-------------------------------------------------

select team.win, count(team.win)
from
(
    select p.match_id, s.win, floor(player/6) as teamgroup, avg(s.longesttimespentliving) as avgtime
    from participant as p, stat as s
    where p.player_id = s.player_id
    group by p.match_id, teamgroup
) as team
where team.avgtime >= 1200
group by team.win;