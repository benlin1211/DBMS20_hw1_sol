load data local infile './champs.csv'
into table champ
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
ignore 1 lines;

load data local infile './matches.csv'
into table match_info
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
ignore 1 lines;

load data local infile './participants.csv'
into table participant
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
ignore 1 lines;

load data local infile './stats.csv'
into table stat
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
ignore 1 lines;

load data local infile './teambans.csv'
into table teamban
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
ignore 1 lines;
