-- delete teamban
delete from teamban
where match_id in
(
    select distinct grp.match_id
    from
    (
        select par.match_id, stat.win, count(stat.win) as cnt
        from participant as par, stat
        where par.player_id = stat.player_id
        group by par.match_id, stat.win
    ) as grp
    where grp.cnt != 5
);

-- delete stat
delete from stat
where player_id in 
(
    select player_id
    from participant par
    where par.match_id in
    (
        select distinct grp.match_id
        from
        (
            select par.match_id, stat.win, count(stat.win) as cnt
            from participant as par, stat
            where par.player_id = stat.player_id
            group by par.match_id, stat.win
        ) as grp
        where grp.cnt != 5
    )
);

-- delete participant
delete from participant
where player_id not in
(
    select player_id
    from stat
);

-- delete match_info
delete from match_info
where match_id not in
(
    select distinct match_id
    from participant
);