#Kreirajte tablice i veze između tablica
drop database if exists kolokvij_vjezba1;
create database kolokvij_vjezba1;
use kolokvij_vjezba1;

create table cura (
sifra int not null primary key auto_increment,
novcica decimal (16,5) not null,
gustoca decimal (18,6) not null,
lipa decimal (13,10),
ogrlica int not null,
bojakose varchar(38),
suknja varchar(36),
punac int
);

create table punac (
sifra int not null primary key auto_increment,
ogrlica int,
gustoca decimal (14,9),
hlace varchar(41) not null
);

create table sestra (
sifra int not null primary key auto_increment,
intervertno bit,
haljina varchar(31) not null,
maraka decimal (16,6),
hlace varchar(46) not null,
narukvica int not null
);

create table zena (
sifra int not null primary key auto_increment,
treciputa datetime,
hlace varchar(46),
kratkamajica varchar(31) not null,
jmbag char(11) not null,
bojaociju varchar(39) not null,
haljina varchar(44),
sestra int not null
);

create table muskarac (
sifra int not null primary key auto_increment,
bojaociju varchar (50) not null,
hlace varchar(30),
modelnaocala varchar(43),
maraka decimal(14,5) not null,
zena int not null
);

create table sestra_svekar (
sifra int not null primary key auto_increment,
sestra int not null,
svekar int not null
);

create table svekar (
sifra int not null primary key auto_increment,
bojaociju varchar(40) not null,
prstena int,
dukserica varchar(41),
lipa decimal(13,8),
eura decimal (12,7),
majica varchar(35)
);

create table mladic (
sifra int not null primary key auto_increment,
suknja varchar(50) not null,
kuna decimal (16,8) not null,
drugiputa datetime,
asocijalno bit,
ekstroventno bit not null,
dukserica varchar(48) not null,
muskarac int
);

alter table cura add foreign key (punac) references punac(sifra);
alter table mladic add foreign key (muskarac) references muskarac(sifra);
alter table muskarac add foreign key (zena) references zena(sifra);
alter table sestra_svekar add foreign key (sestra) references sestra(sifra);
alter table sestra_svekar add foreign key (svekar) references svekar(sifra);
alter table zena add foreign key (sestra) references sestra(sifra);

#U tablice muskarac, zena i sestra_svekar unesite po 3 retka
insert into sestra (haljina,hlace,narukvica) values 
('Crvena','Sive',3),
('Roza','Plave',1),
('Plava','Crne',1);

insert into zena (kratkamajica,jmbag,bojaociju,sestra) values
('Crvena',23571235711,'Smeđa',1),
('Plava',57123571231,'Smeđa',1),
('Siva',12357123576,'Plava',2);

insert into muskarac (bojaociju,maraka,zena) values 
('Plava',18200.50,2),
('Smeđa',1000.00,1),
('Siva',12345.123,3);

insert into svekar (bojaociju) values 
('Siva'),
('Plava'),
('Smeđa');

insert into sestra_svekar (sestra,svekar) values 
(1,1),
(2,2),
(2,3);

insert into cura (novcica,gustoca,ogrlica) values 
(1100.50,200,1),
(2000,300,2),
(3000.79,150,1);
#U tablici cura postavite svim zapisima kolonu gustoca na vrijednost 15,77
update cura set gustoca=15.77;
#U tablici mladic obrišite sve zapise čija je vrijednost kolone kuna veće od 15,78.
delete from mladic where kuna>15.78;
#Izlistajte kratkamajica iz tablice zena uz uvjet da vrijednost kolone hlace sadrže slova ana
select kratkamajica, hlace as 'Ana' from zena;

#Prikažite dukserica iz tablice svekar, asocijalno iz tablice mladic truncate
#hlace iz tablice muskarac uz uvjet da su vrijednosti kolone hlace iz tablice
#zena počinju slovom a te da su vrijednosti kolone haljina iz tablice sestra
#sadrže niz znakova ba. Podatke posložite po hlace iz tablice muskarac silazno 
select a.dukserica, f.asocijalno, e.hlace 
from svekar a 
inner join sestra_svekar b on a.sifra=b.svekar 
inner join sestra c on b.sestra=c.sifra 
inner join zena d on c.sifra=d.sestra 
inner join muskarac e on d.sifra=e.zena 
inner join mladic f on e.sifra=f.muskarac 
where d.hlace like 'a%' and c.haljina like '%ba%' order by e.hlace desc;