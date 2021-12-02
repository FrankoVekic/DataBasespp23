#Kreirajte okidač zadatak3 nakon insert-a u tablicu zarucnica tako da za svaki unos u tablicu zarucnica napravi po dva unosa u tablicu punac

drop trigger if exists exercise3;
delimiter $$
create trigger exercise3 
	before insert on
		zarucnica for each row

	begin 
		declare i int default 1;
		insert into punac (novcica) values (i);
		insert into punac (novcica) values (i);
		
	end$$
delimiter ; 
