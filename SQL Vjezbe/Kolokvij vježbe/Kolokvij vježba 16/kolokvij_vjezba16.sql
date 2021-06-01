#Kreirajte tablice i veze između tablica.
DROP database IF EXISTS kolokvij_vjezba16;
create database kolokvij_vjezba16;
use kolokvij_vjezba16;

create table punac_zarucnik (
sifra int not null primary key auto_increment,
punac int not null,
zarucnik int not null
);

create table zarucnik(
sifra int not null primary key auto_increment,
novcica decimal(13,9) not null,
bojakose varchar(41) not null,
kuna decimal(16,8) not null,
prstena int not null,
kratkamajica varchar(44) not null,
nausnica int not null);

create table punac (
sifra int not null primary key auto_increment,
kratkamajica varchar(45),
bojakose varchar(41),
novcica decimal(16,8),
treciputa datetime not null
);

create table brat (
sifra int not null primary key auto_increment,
vesta varchar(44) not null,
dukserica varchar(34),
prstena int,
majica varchar(36) not null,
punac int not null
);

create table mladic (
sifra int not null primary key auto_increment,
haljina varchar(30),
lipa decimal(12,8),
kratkamajica varchar(33),
kuna decimal(12,10),
treciputa datetime not null,
brat int not null
);

create table svekrva (
sifra int not null primary key auto_increment,
jmbag char(11),
ogrlica int,
bojakose varchar(40) not null,
drugiputa datetime not null,
mladic int not null
);

create table zena (
sifra int not null primary key auto_increment,
gustoca decimal(12,8),
lipa decimal(16,6),
ogrlica int,
carape varchar(32),
nausnica int not null,
modelnaocala varchar(46) not null,
prijatelj int
);

create table prijatelj(
sifra int not null primary key auto_increment,
treciputa datetime,
majica varchar(49),
asocijalno bit not null,
hlace varchar(42)
);

alter table zena add foreign key (prijatelj) references prijatelj(sifra);
alter table svekrva add foreign key (mladic) references mladic(sifra);
alter table mladic add foreign key (brat) references brat(sifra);
alter table brat add foreign key (punac) references punac(sifra);
alter table punac_zarucnik add foreign key (zarucnik) references zarucnik(sifra);
alter table punac_zarucnik add foreign key (punac) references punac(sifra);

# U tablice mladic, brat i punac_zarucnik unesite po 3 retka.

insert into punac (treciputa) values 
('2021-02-12'),
('2021-01-10'),
('2020-05-10');

insert into zarucnik 
(novcica,bojakose,kuna,prstena,kratkamajica,nausnica) values 
(123.99,'Plava',100.12,1,'Zelena',1),
(200.23,'Crna',500.95,2,'Roza',0),
(300.30,'Zelena',250.50,0,'Zelena',1);

insert into punac_zarucnik (punac,zarucnik) values 
(1,2),(2,3),(3,1);

insert into brat (vesta,majica,punac) values 
('Plava','Crvena',1),
('Crna','Crna',2),
('Zelena','Crvena',3);

insert into mladic (treciputa,brat) values 
('2021-10-10',1),
('2021-11-11',2),
('2021-12-12',3);

#U tablici zena postavite svim zapisima kolonu lipa na vrijednost 13,77.

update zena set lipa = 13.77;

#U tablici svekrva obrišite sve zapise čija je vrijednost kolone ogrlica različito od 18.

delete from svekrva where ogrlica <> 18;

# Izlistajte prstena iz tablice brat uz uvjet da vrijednost kolone dukserica sadrže slova ana.

select prstena from brat where dukserica like '%ana%';

#Prikažite kuna iz tablice zarucnik, drugiputa iz tablice svekrva te 
#lipa iz tablice mladic uz uvjet da su vrijednosti kolone dukserica iz 
#tablice brat počinju slovom a te da su vrijednosti kolone bojakose iz 
#tablice punac sadrže niz znakova ba. Podatke posložite po lipa iz 
#tablice mladic silazno.

select a.kuna, f.drugiputa, e.lipa 
from zarucnik a 
inner join punac_zarucnik b on b.zarucnik = a.sifra 
inner join punac c on c.sifra = b.punac 
inner join brat d on d.punac = c.sifra 
inner join mladic e on e.brat = d.sifra 
inner join svekrva f on f.mladic = e.sifra 
where d.dukserica like 'a%' and c.bojakose like '%ba%' order by e.lipa desc;

#Prikažite kolone bojakose i novcica iz tablice punac čiji se primarni 
#ključ ne nalaze u tablici punac_zarucnik.

select a.bojakose, a.novcica 
from punac a 
left join punac_zarucnik b on b.punac = a.sifra 
where a.sifra not in (select distinct sifra from punac_zarucnik );