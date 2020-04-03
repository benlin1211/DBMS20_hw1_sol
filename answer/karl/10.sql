-- 在LOL角色中，有些角色會比較容易打贏或打輸特定角色。列出當上路 (TOP) 對手為雷尼克頓 (Renekton) 時，上路 (top) 角色勝率最高的前五隻英雄，並列出上路 (TOP) 雙方的擊殺參與率 (KDA) 與平均經濟 (goldearned)

select p1.match_id, p1.player_id, p1.champion_name, p2.player_id, p2.champion_name
from
(
    select par.player_id, par.match_id, champ.champion_name
    from participant as par, champ
    where player < 6
    and par.position = 'TOP'
    and champ.champion_id = par.champion_id
) as p1,
(
    select par.player_id, par.match_id, champ.champion_name
    from participant as par, champ
    where player > 5
    and par.position = 'TOP'
    and champ.champion_id = par.champion_id
) as p2
where p1.match_id = p2.match_id
and (
    p1.champion_name = 'Renekton'
    or p2.champion_name = 'Renekton'
)
