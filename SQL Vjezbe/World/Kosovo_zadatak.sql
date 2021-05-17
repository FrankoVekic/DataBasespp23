# U državi Kosovo unijeti mjesto Priština donja
insert into country (code,name,Continent,Region,SurfaceArea,Population ,LocalName,GovernmentForm,Code2) 
values ('KOS','Kosovo','Europe','Regija',2000,120000,'Kosovo','Nesto','KS');

#Obrisati Prištinu
select * from city where name like '%ština';
delete from city where id =1795;

insert into city (Name,CountryCode,District,Population) 
values ('Priština donja','KOS','Kosovo',150000);

#Promjenite naziv grada Priština donja u Priština
select * from city where name ='Priština donja';
update city set name='Priština' where id=4080;

#Obriši Kosovo
#Prvo treba obrisati grad
delete from city where id =4080;

#Obrisati Kosovo
delete from country where name='Kosovo';