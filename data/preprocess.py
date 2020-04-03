###################################################################################
#### Please put all data into the same folder of this file
###################################################################################
import csv

champs = dict()
## process champs.csv
with open('source_data/champs.csv', 'r') as fr, open('champs.csv', 'w', newline='') as fw:
    rows = csv.reader(fr)
    writer = csv.writer(fw)

    writer.writerow(['champion_name', 'champion_id'])
    next(rows)
    length = 0
    for row in rows:
        champs[int(row[1])] = row[0]
        writer.writerow(row)
        length += 1
    
    print(f'new_champs.csv records number: {length}')

## process matches.csv
with open('source_data/matches.csv', 'r') as fr, open('matches.csv', 'w', newline='') as fw:
    rows = csv.reader(fr)
    writer = csv.writer(fw)

    writer.writerow(['match_id', 'duration', 'version'])
    next(rows)
    length = 0
    for row in rows:
        writer.writerow([row[0], row[5], row[7]])
        length += 1
    
    print(f'new_matches.csv records number: {length}')

## process participants.csv 
with open('source_data/participants.csv', 'r') as fr, open('participants.csv', 'w', newline='') as fw:
    rows = csv.reader(fr)
    writer = csv.writer(fw)

    spells_mapping = {
        21: 'Barrier',
        7:  'Heal',
        6:  'Haste',
        1:  'Boost',
        14: 'Ignite',
        13: 'Mana',
        11: 'Smite',
        3:  'Exhaust',
        4:  'Flash',
        32: 'Snowball',
        31: 'PoroThrow',
        30: 'PoroRecall',
        12: 'Teleport',
        2: "Others",
        10: "Others"
    }

    writer.writerow(['player_id', 'match_id', 'player', 'champion_id', 'ss1', 'ss2',\
                     'position'])
    next(rows)
    length = 0
    for row in rows:
        ss1 = spells_mapping[int(row[4])]
        ss2 = spells_mapping[int(row[5])]

        if row[7] == 'BOT':
            position = row[6]
        else:
            position = row[7]
        
        writer.writerow([row[0], row[1], row[2], row[3], ss1, ss2, position])
        length += 1
    
    print(f'new_participants.csv records number: {length}')

## process teambans.csv
with open('source_data/teambans.csv', 'r') as fr, open('teambans.csv', 'w', newline='') as fw:
    rows = csv.reader(fr)
    writer = csv.writer(fw)

    writer.writerow(['match_id', 'team', 'champion_id', 'banturn'])
    next(rows)
    length = 0
    for row in rows:
        if row[1] == "100":
            team = "B"
        elif row[1] == "200":
            team = "R"
        else:
            print(f"ERROR! teambans team_id values: {row[1]}")
        writer.writerow([row[0], team, row[2], row[3]])
        length += 1

    print(f'new_teambans.csv records number: {length}')


## process stats1.csv and stats2.csv
with open('stats.csv', 'w', newline='') as fw:
    writer = csv.writer(fw)
    writer.writerow(['player_id', 'win', 'item1', 'item2', 'item3', 'item4',\
                     'item5', 'item6', 'kills', 'deaths', 'assists', 'longesttimespentliving',\
                     'doublekills', 'triplekills', 'quadrakills', 'pentakills',\
                     'legendarykills', 'goldearned', 'firstblood'])
    length = 0

    with open('source_data/stats1.csv', 'r') as fr:
        rows = csv.reader(fr)
        next(rows)
        for row in rows:
            data = list()
            data.extend(row[0:8])
            data.extend(row[9:12])
            data.extend(row[15:21])
            data.append(row[41])
            data.append(row[55])
            writer.writerow(data)

            length += 1
    
    with open('source_data/stats2.csv', 'r') as fr:
        rows = csv.reader(fr)
        next(rows)
        for row in rows:
            data = list()
            data.extend(row[0:8])
            data.extend(row[9:12])
            data.extend(row[15:21])
            data.append(row[41])
            data.append(row[55])
            writer.writerow(data)

            length += 1
    
    print(f'new_stats.csv records number: {length}')