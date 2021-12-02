
# Kreirati funkciju zadatak1 koja osigurava kako cjelobrojni tipovi podataka moraju biti između 980 i 5098 

drop function if exists exercise1;
delimiter $$
create function exercise1(num int) returns varchar(250)
	begin
		if (num between 950 and 5098) then
			return num;
		else
			return 'Num is not between 950 and 5098'; 
		end if;
	end
$$
delimiter ;

select exercise1(20); 	#returns message
select exercise1(5000); #returns number inserted