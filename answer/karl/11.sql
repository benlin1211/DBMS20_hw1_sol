-- 當上路 (top) 玩家帶的召喚師技能 (summoner spell) 為閃現+點燃 (Flash+Ignite) 時，獲勝的機會會比閃現+傳送 (Flash+Teleport) 時來的大嗎？（此題為開放式答案，請利用 SQL 找出的結果來闡述你的觀點)

select count(*)
from participant
where (ss1 = 'Flash' and ss2 = 'Ignite')
or (ss1 = 'Ignite' and ss2 = 'Flash');

select count(*)
from participant
where (ss1 = 'Flash' and ss2 = 'Teleport')
or (ss1 = 'Teleport' and ss2 = 'Flash');