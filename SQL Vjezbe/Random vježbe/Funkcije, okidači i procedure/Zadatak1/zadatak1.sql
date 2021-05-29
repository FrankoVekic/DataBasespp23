drop database if exists FOP_zadatak1;
create database FOP_zadatak1;
use FOP_zadatak1;

create table muskarac (
id int not null primary key auto_increment,
maraka decimal(17,7) not null,
hlace varchar(45)not null,
prstena int not null,
nausnica int,
neprijateljica int not null
);

create table neprijateljica(
id int not null primary key auto_increment,
indiferentno tinyint not null,
modelnaocala varchar(39) not null,
maraka decimal (12,10) not null,
kratkamajica varchar(32) not null,
ogrlica int
);

create table sestra (
id int not null primary key auto_increment,
introvertno tinyint not null,
carape varchar(41),
suknja varchar(40),
narukvica int not null
);

create table punac (
id int not null primary key auto_increment,
modelnaocala varchar(39),
treciputa datetime,
drugiputa datetime,
novcica decimal (14,6) not null,
narukvica int
);

create table zarucnica (
id int not null primary key auto_increment,
stilfrizura varchar(40),
prstena int not null,
gustoca decimal(14,5),
modelnaocala varchar(35) not null,
nausnica int not null
);

alter table muskarac add foreign key (neprijateljica) references neprijateljica(id);

#Kreirati funkciju zadatak1 koja osigurava kako cjelobrojni tipovi podataka moraju biti između 980 i 5098
delimiter $$
create function zadatak1 (broj int) returns int 
begin 
	if (broj > 950 and broj < 5098) then
		return broj;
	else 
		return 0;
	end if;
end
$$
delimiter ;

#Primjeniti funkciju u minimalno jednom upitu u proceduri ili okidaču
select * from zarucnica;

#Kreirajte proceduru zadatak2 koja unosi 56872 zapisa u tablicu zarucnica. Izvesti proceduru jednom 
#tako da u tablici bude točno 56872 zapisa

delimiter $$
create procedure zadatak2()
begin
	
	declare i int default 0;
		while (i <=56871) do
		insert into zarucnica(prstena, modelnaocala, nausnica) values(i,' ', i);
		set i = i+1;
	end while;
end;
$$

delimiter ;
select * from zarucnica;
select * from punac;
select count(*) from zarucnica;
select count(*) from punac;

#Kreirajte okidač zadatak3 nakon insert-a u tablicu zarucnica tako da za svaki unos u tablicu zarucnica 
#napravi po dva unosa u tablicu punac Okidač je u funkciji, tablica punac ima dvostruko više zapisa od 
#tablice zarucnica 

delimiter $$

create trigger unos_zarucnica
	before insert on
		zarucnica for each row

	begin 
		declare i int default 1;
		insert into punac (novcica) values (i);
		insert into punac (novcica) values (i);
		
	end$$
delimiter ; 
