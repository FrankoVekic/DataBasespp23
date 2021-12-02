
#Kreirajte proceduru zadatak2 koja unosi 56872 zapisa u tablicu zarucnica (7). Izvesti proceduru jednom tako da u tablici bude točno 56872 zapisa
drop procedure if exists exercise2;
delimiter $$
create procedure exercise2()
begin
		declare i int default 0;
		while (i <=56871) do
		insert into zarucnica(prstena, modelnaocala, nausnica) values(i,i,i);
		set i = i+1;
	end while;
end;
$$
delimiter ;

call exercise2();

select count(*) from zarucnica; 
