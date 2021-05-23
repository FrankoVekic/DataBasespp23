#Kreirajte tablice (16) i veze između tablica.
drop database if exists kolokvij_vjezba10;
create database kolokvij_vjezba10;
use kolokvij_vjezba10;

create table zarucnica (
sifra int not null primary key auto_increment,
treciputa datetime,
prviputa datetime,
suknja varchar(32) not null,
eura decimal (16,10)
);

create table sestra (
sifra int not null primary key auto_increment,
suknja varchar(46) not null,
bojaociju varchar(49),
indiferentno bit,
dukserica varchar(32) not null,
drugiputa datetime,
prviputa datetime not null,
zarucnica int
);

create table svekrva (
sifra int not null primary key auto_increment,
eura decimal (17,9),
carape varchar(43),
kuna decimal (13,9),
majica varchar(30),
introvertno bit not null,
punac int
);

create table punac (
sifra int not null primary key auto_increment,
lipa decimal (15,9),
eura decimal (15,10) not null,
stilfrizura varchar(37)
);

create table punac_neprijatelj(
sifra int not null primary key auto_increment,
punac int not null,
neprijatelj int not null
);

create table neprijatelj(
sifra int not null primary key auto_increment,
gustoca decimal (15,10) not null,
dukserica varchar(32) not null,
maraka decimal (15,7),
stilfrizura varchar(49) not null
);

create table zena (
sifra int not null primary key auto_increment,
bojaociju varchar(49) not null,
maraka decimal (13,9) not null,
majica varchar(45),
indiferentno bit,
prviputa datetime,
mladic int
);

create table mladic(
sifra int not null primary key auto_increment,
hlace varchar(48) not null,
lipa decimal (18,6),
stilfrizura varchar(35) not null,
prstena int,
maraka decimal (12,6) not null,
svekrva int
);

alter table zena add foreign key (mladic) references mladic(sifra);
alter table mladic add foreign key (svekrva) references svekrva(sifra);
alter table sestra add foreign key (zarucnica) references zarucnica(sifra);
alter table punac_neprijatelj add foreign key (punac) references punac(sifra);
alter table punac_neprijatelj add foreign key (neprijatelj) references neprijatelj(sifra);
alter table svekrva add foreign key (punac) references punac(sifra);

#. U tablice mladic, svekrva i punac_neprijatelj unesite po 3 retka. 

insert into punac (eura) values 
(100.99),(200.10),(150.10);

insert into neprijatelj (gustoca,dukserica,stilfrizura) values 
(10.10,'Crvena','Čelav'),
(20.10,'Plava','Duga kosa'),
(123.213,'Crna','Čelav');

insert into punac_neprijatelj (punac,neprijatelj) values (1,1),(2,2),(3,3);

insert into svekrva (introvertno) values 
(0),(0),(1);

insert into mladic (hlace,stilfrizura,maraka) values 
('Plave','Čelav',100.99),
('Sive','Duga kosa',200.99),
('Crne','Irokeza',1000.99);

#U tablici sestra postavite svim zapisima kolonu bojaociju na vrijednost Osijek.

update sestra set bojaociju ='Osijek';

#U tablici zena obrišite sve zapise čija je vrijednost kolone maraka različito od 14,81.

delete from zena where maraka not like 14.81;

#Izlistajte kuna iz tablice svekrva uz uvjet da vrijednost kolone carape sadrže slova ana.

select kuna from svekrva where carape like '%ana%';

#Prikažite maraka iz tablice neprijatelj, indiferentno iz tablice zena 
#te lipa iz tablice mladic uz uvjet da su vrijednosti kolone carape iz 
#tablice svekrva počinju slovom a te da su vrijednosti kolone eura iz 
#tablice punac različite od 22. Podatke posložite po lipa iz tablice 
#mladic silazno.

select a.maraka, f.indiferentno, e.lipa 
from neprijatelj a 
inner join punac_neprijatelj b on a.sifra = b.neprijatelj 
inner join punac c on c.sifra = b.punac 
inner join svekrva d on d.punac = c.sifra 
inner join mladic e on e.svekrva = d.sifra 
inner join zena f on f.mladic = e.sifra 
where d.carape like 'a%' and c.eura not like 22 order by e.lipa desc;