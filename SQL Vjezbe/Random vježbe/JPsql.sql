#baza mjesta

select * from mjesto where naziv like '%osijek%';

select * from mjesto where zupanija = 14;

select * from mjesto where postanskibroj like '31%';


select * from mjesto where naziv like '%ac%';

insert into mjesto (postanskibroj,zupanija,naziv) 
values (31332,14,'Programovci');

select * from mjesto where naziv like '%prog%';

##### baza knjiznica
# odaberite sve autore za koje ne znamo datum rođenja

show tables;
select * from autor;
select * from autor where datumrodenja is null;
# Unesite sebe kao autora
select * from autor where sifra = 17903;
insert into autor (sifra,ime,prezime,datumrodenja) values (17903,'Franko','Vekić','1997-7-22');

# odaberite autore koji su rođeni na Vaš datum rođenja
select * from autor where datumrodenja like '%7-22%';

# uključujući i godinu
select * from autor where datumrodenja = '1997-7-22';

# odaberite autore koji se zovu kao Vi
select * from autor where ime = 'Franko';

# odaberite sve izdavače koji su 
# društva s ograničenom odgovornošću

select * from izdavac;
select * from izdavac where naziv like '%d.o.o%';


##### baza world

show tables;

# odaberite sve zemlje iz Europe

select * from country where Continent = 'Europe';

# unesite mjesto Donji Miholjac

select * from city;
select code from country where name ='Croatia';
insert into city (name,CountryCode,District,Population) values ('Donji Miholjac','HRV','Osijek-Baranja',9491);

# Promjenite Donji Miholjac u Špičkovinu
select * from city where name like 'Donji%';
update city set name ='Spickovina' where id = 4080;

# Obrišite mjesto Špičkovina

delete from city where id = 4080;
