create table champ(
    champion_name varchar(15) not null,
    champion_id int,
    primary key (champion_id)
);

create table match_info(
    match_id int,
    duration int,
    version varchar(15),
    primary key (match_id)
);

create table participant(
    player_id int,
    match_id int not null,
    player tinyint,
    champion_id int not null,
    ss1 varchar(15),
    ss2 varchar(15),
    position varchar(13) not null,
    primary key (player_id),
    foreign key (match_id) references match_info(match_id)
);

create table teamban(
    match_id int, 
    team char(1) not null, 
    champion_id int not null, 
    banturn tinyint,
    primary key (match_id, banturn)
);

create table stat(
    player_id int, 
    win boolean, 
    item1 smallint, 
    item2 smallint, 
    item3 smallint, 
    item4 smallint,
    item5 smallint, 
    item6 smallint, 
    kills tinyint, 
    deaths tinyint, 
    assists tinyint, 
    longesttimespentliving smallint,
    doublekills tinyint, 
    triplekills tinyint, 
    quadrakills tinyint, 
    pentakills tinyint,
    legendarykills tinyint, 
    goldearned mediumint, 
    firstblood boolean,
    primary key (player_id)
);