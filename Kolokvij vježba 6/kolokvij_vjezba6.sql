DROP database IF EXISTS kolokvij_vjezba6;
CREATE database kolokvij_vjezba6;
use kolokvij_vjezba6;

create table decko (
sifra int not null primary key auto_increment,
prviputa datetime,
modelnaocala varchar(41),
nausnica int,
zena int not null
);

create table zena(
sifra int not null primary key auto_increment,
novcica decimal(14,8) not null,
narukvica int not null,
dukserica varchar(40) not null,
haljina varchar(30),
hlace varchar(32),
brat int not null
);

create table brat (
sifra int not null primary key auto_increment,
nausnica int not null,
treciputa datetime not null,
narukvica int not null,
hlace varchar(31),
prijatelj int
);

create table prijatelj(
sifra int not null primary key auto_increment,
haljina varchar(35),
prstena int not null,
introvertno bit,
stillfrizura varchar(36) not null
);

create table prijatelj_ostavljena (
sifra int not null primary key auto_increment,
prijatelj int not null,
ostavljena int not null
);

create table ostavljena (
sifra int not null primary key auto_increment,
prviputa datetime not null,
kratkamajica varchar(39) not null,
drugiputa datetime,
maraka decimal (14,10)
);

create table svekrva (
sifra int not null primary key auto_increment,
hlace varchar (48) not null,
suknja varchar(42) not null,
ogrlica int not null,
treciputa datetime not null,
dukserica varchar(32) not null,
narukvica int not null,
punac int not null
);

create table punac (
sifra int not null primary key auto_increment,
ekstroventno bit not null,
suknja varchar(30) not null,
majica varchar(44) not null,
prviputa datetime not null
);

alter table svekrva add foreign key (punac) references punac(sifra);
alter table prijatelj_ostavljena add foreign key (prijatelj) references prijatelj(sifra);
alter table prijatelj_ostavljena add foreign key (ostavljena) references ostavljena (sifra);
alter table brat add foreign key (prijatelj) references prijatelj (sifra);
alter table decko add foreign key (zena) references zena(sifra);
alter table zena add foreign key (brat) references brat(sifra);

# U tablice zena, brat i prijatelj_ostavljena unesite po 3 retka. 

insert into prijatelj (prstena,stillfrizura) values 
(1,'Biberica'),
(0,'Rokerica'),
(0,'Čelav');

insert into ostavljena (prviputa,kratkamajica) values 
('2019-09-20','Plavo-crvena'),
('2020-01-10','Sivo-bijela'),
('2021-02-02','Crvena');

insert into prijatelj_ostavljena (prijatelj,ostavljena) values 
(1,2),(2,3),(3,1);

insert into brat (nausnica,treciputa,narukvica) values 
(2,'2021-05-22',2),
(1,'2020-12-25',1),
(0,'2020-11-06',0);

insert into zena (novcica,narukvica,dukserica,brat) values 
(123.22,2,'Plava',3),
(232.99,1,'Crvena',1),
(100,0,'Zelena',2);

#U tablici svekrva postavite svim zapisima kolonu suknja na 
#vrijednost Osijek.

update svekrva set suknja='Osijek';

#U tablici decko obrišite sve zapise čija je vrijednost kolone 
#modelnaocala manje od AB.

delete from decko where modelnaocala <'AB';

#Izlistajte narukvica iz tablice brat uz uvjet da vrijednost kolone 
#treciputa nepoznate. 

select narukvica from brat where treciputa is null;

#Prikažite drugiputa iz tablice ostavljena, zena iz tablice decko te 
#narukvica iz tablice zena uz uvjet da su vrijednosti kolone treciputa iz 
#tablice brat poznate te da su vrijednosti kolone prstena iz tablice 
#prijatelj jednake broju 219. Podatke posložite po narukvica iz tablice 
#zena silazno. 

select a.drugiputa, f.zena, e.narukvica 
from ostavljena a 
inner join prijatelj_ostavljena b on a.sifra = b.ostavljena 
inner join prijatelj c on b.prijatelj =c.sifra 
inner join brat d on d.prijatelj = c.sifra 
inner join zena e on d.sifra = e.brat 
inner join decko f on e.sifra =f.zena 
where d.treciputa is not null and c.prstena =219 order by e.narukvica desc;