-- default cards
insert into card (name, type, life, speed, attack_range, cooldown, damage, created_at)
	values ('Caveman', 'char', 100, 1, 20, 6, 100, current_date);

insert into card (name, type, life, speed, attack_range, cooldown, damage, created_at)
	values ('Dino', 'char', 300, 0.8, 40, 10, 200, current_date);

insert into card (name, type, life, speed, attack_range, cooldown, damage, created_at)
	values ('Thunder', 'spell', null, null, 20, 5, 70, current_date);

-- default deck
insert into deck_card (deck_id, card_id, created_at) values (1, 2, current_date);
insert into deck_card (deck_id, card_id, created_at) values (1, 3, current_date);
insert into deck_card (deck_id, card_id, created_at) values (1, 4, current_date);
