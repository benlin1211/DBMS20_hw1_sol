import csv

with open('matches.csv', 'r') as fr, open('new_matches.csv', 'w', newline='') as fw:
    rows = csv.reader(fr)
    writer = csv.writer(fw)
    writer.writerow(['match_id', 'duration', 'version'])
    for row in rows:
        writer.writerow(row)

with open('participants.csv', 'r') as fr, open('new_participants.csv', 'w', newline='') as fw:
    rows = csv.reader(fr)
    writer = csv.writer(fw)
    writer.writerow(['player_id', 'match_id', 'player', 'champion_id', 'ss1', 'ss2',\
                     'position'])
    for row in rows:
        writer.writerow(row)

with open('teambans.csv', 'r') as fr, open('new_teambans.csv', 'w', newline='') as fw:
    rows = csv.reader(fr)
    writer = csv.writer(fw)
    writer.writerow(['match_id', 'team', 'champion_id', 'banturn'])
    for row in rows:
        writer.writerow(row)

with open('stats.csv', 'r') as fr, open('new_stats.csv', 'w', newline='') as fw:
    rows = csv.reader(fr)
    writer = csv.writer(fw)
    writer.writerow(['player_id', 'win', 'item1', 'item2', 'item3', 'item4',\
                     'item5', 'item6', 'kills', 'deaths', 'assists', 'longesttimespentliving',\
                     'doublekills', 'triplekills', 'quadrakills', 'pentakills',\
                     'legendarykills', 'goldearned', 'firstblood'])
    for row in rows:
        writer.writerow(row)