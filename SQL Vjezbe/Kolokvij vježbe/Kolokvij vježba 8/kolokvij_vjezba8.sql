drop database if exists kolokvij_vjezba8;
create database kolokvij_vjezba8;
use kolokvij_vjezba8;

create table prijateljica(
sifra int not null primary key auto_increment,
vesta varchar(50),
nausnica int not null,
introvertno bit not null
);

create table cura (
sifra int not null primary key auto_increment,
nausnica int not null,
indiferentno bit,
ogrlica int not null,
gustoca decimal(12,6),
drugiputa datetime,
vesta varchar(33),
prijateljica int
);

create table brat (
sifra int not null primary key auto_increment,
introvertno bit,
novcica decimal (14,7) not null,
treciputa datetime,
neprijatelj int
);

create table neprijatelj (
sifra int not null primary key auto_increment,
kratkamajica varchar(44),
introvertno bit,
indiferentno bit,
ogrlica int not null,
becar int not null
);

create table becar (
sifra int not null primary key auto_increment,
eura decimal (15,10) not null,
treciputa datetime,
prviputa datetime,
muskarac int not null
);

create table muskarac (
sifra int not null primary key auto_increment,
haljina varchar (47),
drugiputa datetime not null,
treciputa datetime
);

create table muskarac_decko (
sifra int not null primary key auto_increment,
muskarac int not null,
decko int not null
);

create table decko (
sifra int not null primary key auto_increment,
kuna decimal (12,10),
lipa decimal (17,10),
bojakose varchar(44),
treciputa datetime not null,
ogrlica int not null,
ekstroventno bit not null
);

alter table muskarac_decko add foreign key (decko) references decko(sifra);
alter table muskarac_decko add foreign key (muskarac) references muskarac (sifra);
alter table becar add foreign key (muskarac) references muskarac (sifra);
alter table neprijatelj add foreign key (becar) references becar(sifra);
alter table brat add foreign key (neprijatelj) references neprijatelj(sifra);
alter table cura add foreign key (prijateljica) references prijateljica(sifra);

# U tablice neprijatelj, becar i muskarac_decko unesite po 3 retka.

insert into muskarac (drugiputa) values 
('2020-02-12'),
('2021-01-25'),
('2021-03-02');

insert into decko (treciputa,ogrlica,ekstroventno) values 
('2020-05-05',2,0),
('2021-10-10',0,0),
('2021-02-13',1,1);

insert into muskarac_decko (muskarac,decko) values 
(1,2),(2,3),(3,1);

insert into becar (eura,muskarac) values 
(700.50,3),
(1500.99,2),
(1000.33,1);

insert into neprijatelj (ogrlica,becar) values 
(1,2),
(0,3),
(0,1);

#. U tablici cura postavite svim zapisima kolonu indiferentno na vrijednost false.

update cura set indiferentno = 0;

#U tablici brat obrišite sve zapise čija je vrijednost kolone novcica različito od 12,75.

delete from brat where novcica not like 12.75;

#Izlistajte prviputa iz tablice becar uz uvjet da vrijednost kolone treciputa nepoznate.

select prviputa from becar where treciputa is null;

#. Prikažite bojakose iz tablice decko, neprijatelj iz tablice brat te 
#introvertno iz tablice neprijatelj uz uvjet da su vrijednosti kolone 
#treciputa iz tablice becar poznate te da su vrijednosti kolone 
#drugiputa iz tablice muskarac poznate. Podatke posložite po 
#introvertno iz tablice neprijatelj silazno.

select a.bojakose, f.neprijatelj, e.introvertno 
from decko a 
inner join muskarac_decko b on b.decko =a.sifra 
inner join muskarac c on c.sifra = b.muskarac 
inner join becar d on d.muskarac = c.sifra 
inner join neprijatelj e on e.becar = d.sifra 
inner join brat f on f.neprijatelj = e.sifra 
where d.treciputa is not null and c.drugiputa is not null order by e.introvertno desc;