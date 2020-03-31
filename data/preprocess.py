###################################################################################
#### Please put all data into the same folder of this file
###################################################################################
import csv

## process champs.csv
with open('champs.csv', 'r') as fr, open('new_champs.csv', 'w') as fw:
    rows = csv.reader(fr)
    writer = csv.writer(fw)

    writer.writerow(['name', 'champion_id'])
    next(rows)
    length = 0
    for row in rows:
        writer.writerow(row)
        length += 1
    
    print(f'new_champs.csv records number: {length}')

## process matches.csv
with open('matches.csv', 'r') as fr, open('new_matches.csv', 'w') as fw:
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
with open('participants.csv', 'r') as fr, open('new_participants.csv', 'w') as fw:
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
        2:  'QQQQQQQQQQ',    ##### NOTICE! THIS LINE IS TEMPORARY MAPPING
        10: 'WWWWWWWWWW'     ##### NOTICE! THIS LINE IS TEMPORARY MAPPING
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
        # elif row[6] == 'DUO_SUPPORT' or row[6] == 'DUO_CARRY':
            # print(f"ERROR! BOT and DUO mismatch! at line {length+2}")
            # print(f'{row[6]}, {row[7]}')
            # exit(1)
        else:
            position = row[7]
        
        writer.writerow([row[0], row[1], row[2], row[3], ss1, ss2, position])
        length += 1
    
    print(f'new_participants.csv records number: {length}')


## process teambans.csv
with open('teambans.csv', 'r') as fr, open('new_teambans.csv', 'w') as fw:
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
with open('new_stats.csv', 'w') as fw:
    writer = csv.writer(fw)
    writer.writerow(['player_id', 'win', 'item1', 'item2', 'item3', 'item4',\
                     'item5', 'item6', 'kills', 'deaths', 'assists', 'longesttimespentliving',\
                     'doublekills', 'triplekills', 'quadrakills', 'pentakills',\
                     'legendarykills', 'goldearned', 'firstblood'])
    length = 0

    with open('stats1.csv', 'r') as fr:
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
    
    with open('stats2.csv', 'r') as fr:
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