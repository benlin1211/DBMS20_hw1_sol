-- 每場遊戲都是兩隊伍互相競賽。請查出隊伍平均最長存活時間 (longesttimespentliving) 超過20分鐘 (包含20分鐘) 的隊伍中，贏的隊伍和輸的隊伍筆數各有多少隊（注意longesttimespentliving只單指該玩家最長存活時間）（輸贏請用字串來輸出，如下方範例）

SELECT if(team.win=1, 'win', 'lose') as win_loss, COUNT(team.win) as cnt
FROM
(
    SELECT p.match_id, s.win, floor(player / 6) as teamgroup, AVG(s.longesttimespentliving) as avgtime
    FROM participant as p, stat as s
    WHERE p.player_id = s.player_id
    GROUP BY p.match_id, teamgroup
) as team
WHERE team.avgtime >= 1200
GROUP BY team.win;