drop database if exists kolokvij_vjezba7;
create database kolokvij_vjezba7;
use kolokvij_vjezba7;

create table punica (
sifra int not null primary key auto_increment,
majica varchar(40),
eura decimal(12,6) not null,
prstena int,
cura int not null
);

create table cura (
sifra int not null primary key auto_increment,
lipa decimal (12,9) not null,
introvertno bit,
modelnaocala varchar(40),
narukvica int,
treciputa datetime,
kuna decimal (14,9)
);

create table sestra(
sifra int not null primary key auto_increment,
bojakose varchar(34) not null,
hlace varchar(36) not null,
lipa decimal (15,6),
stilfrizura varchar(40) not null,
maraka decimal (12,8) not null,
prijateljica int
);

create table prijateljica (
sifra int not null primary key auto_increment,
haljina varchar(45),
gustoca decimal (15,10) not null,
ogrlica int,
novcica decimal (12,5),
ostavljen int
);

create table ostavljen (
sifra int not null primary key auto_increment,
lipa decimal (14,6),
introvertno bit not null,
kratkamajica varchar(38) not null,
prstena int not null,
zarucnik int
);

create table zarucnik (
sifra int not null primary key auto_increment,
vesta varchar(34),
asocijalno bit not null,
modelnaocala varchar(43),
narukvica int not null,
novcica decimal (15,5) not null
);

create table zarucnik_mladic (
sifra int not null primary key auto_increment,
zarucnik int not null,
mladic int not null
);

create table mladic (
sifra int not null primary key auto_increment,
prstena int,
lipa decimal (14,5) not null,
narukvica int not null,
drugiputa datetime not null
);

alter table zarucnik_mladic add foreign key (mladic) references mladic (sifra);
alter table zarucnik_mladic add foreign key (zarucnik) references zarucnik(sifra);
alter table ostavljen add foreign key (zarucnik) references zarucnik (sifra);
alter table prijateljica add foreign key (ostavljen) references ostavljen(sifra);
alter table sestra add foreign key (prijateljica) references prijateljica (sifra);
alter table punica add foreign key (cura) references cura(sifra);

#. U tablice prijateljica, ostavljen i zarucnik_mladic unesite po 3 retka.

insert into zarucnik (asocijalno,narukvica,novcica) values 
(0,1,50.99),
(1,2,10.50),
(1,0,123.123);

insert into mladic (lipa,narukvica,drugiputa) values 
(0.99,5,'2021-01-20'),
(0.50,2,'2020-08-12'),
(1.10,1,'2020-07-21');

insert into zarucnik_mladic (zarucnik,mladic) values 
(3,1),(2,2),(1,3);

insert into ostavljen (introvertno,kratkamajica,prstena) values 
(0,'Plava',0),
(1,'Crvena',2),
(0,'Zelena',3);

insert into prijateljica (gustoca) values 
(123.123),
(321.321),
(100.123);

#U tablici punica postavite svim zapisima kolonu eura na vrijednost 15,77.

update punica set eura = 15.77;

# U tablici sestra obrišite sve zapise čija je vrijednost kolone hlace manje od AB. 

delete from sestra where hlace <'AB';

# Izlistajte kratkamajica iz tablice ostavljen uz uvjet da vrijednost kolone introvertno nepoznate.

select kratkamajica from ostavljen where introvertno is null;

#Prikažite narukvica iz tablice mladic, stilfrizura iz tablice sestra te 
#gustoca iz tablice prijateljica uz uvjet da su vrijednosti kolone 
#introvertno iz tablice ostavljen poznate te da su vrijednosti kolone 
#asocijalno iz tablice zarucnik poznate. Podatke posložite po gustoca iz 
#tablice prijateljica silazno.

select a.narukvica, f.stilfrizura, e.gustoca 
from mladic a 
inner join zarucnik_mladic b on a.sifra =b.mladic 
inner join zarucnik c on b.zarucnik = c.sifra 
inner join ostavljen d on d.zarucnik = c.sifra 
inner join prijateljica e on d.sifra = e.ostavljen 
inner join sestra f on e.sifra = f.prijateljica 
where d.introvertno is not null and c.asocijalno is not null order by e.gustoca desc;