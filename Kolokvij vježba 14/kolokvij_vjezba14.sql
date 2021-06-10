drop database if exists kolokvij_vjezba14;
create database kolokvij_vjezba14;
use kolokvij_vjezba14;

create table ostavljena (
sifra int not null primary key auto_increment,
kuna decimal (17,7),
hlace varchar(45),
suknja varchar(36),
dukserica varchar(36),
kratkamajica varchar(47) not null,
gustoca decimal (12,10) not null,
ostavljen int
);

create table ostavljen (
sifra int not null primary key auto_increment,
majica varchar(39),
drugiputa datetime not null,
asocijalno bit not null,
brat int not null
);

create table brat(
sifra int not null primary key auto_increment,
eura decimal (15,10) not null,
gustoca decimal (14,5) not null,
kuna decimal (15,6),
haljina varchar(38) not null,
bojakose varchar(39),
prstena int,
neprijatelj int not null
);

create table neprijatelj (
sifra int not null primary key auto_increment,
prstena int not null,
gustoca decimal (17,7) not null,
bojakose varchar(48) not null,
ogrlica int not null,
stilfrizura varchar(47)not null
);

create table neprijatelj_muskarac (
sifra int not null primary key auto_increment,
neprijatelj int not null,
muskarac int not null
);

create table muskarac (
sifra int not null primary key auto_increment,
carape varchar(36),
ogrlica int not null,
vesta varchar (44) not null,
ekstroentno bit
);

create table mladic (
sifra int not null primary key auto_increment,
drugiputa datetime not null,
narukvica int,
bojaociju varchar(49) not null,
modelnaocala varchar(41)
);

create table prijatelj (
sifra int not null primary key auto_increment,
stilfrizura varchar(39) not null,
kratkamajica varchar(32),
treciputa datetime,
modelnaocala varchar(32) not null,
prviputa datetime,
mladic int not null
);

alter table prijatelj add foreign key (mladic) references mladic (sifra);
alter table neprijatelj_muskarac add foreign key (neprijatelj) references neprijatelj(sifra);
alter table neprijatelj_muskarac add foreign key (muskarac) references muskarac(sifra);
alter table brat add foreign key (neprijatelj) references neprijatelj(sifra);
alter table ostavljen add foreign key (brat) references brat(sifra);
alter table ostavljena add foreign key (ostavljen) references ostavljen(sifra);

#U tablice ostavljen, brat i neprijatelj_muskarac unesite po 3 retka.

insert into neprijatelj (prstena,gustoca,bojakose,ogrlica,stilfrizura) values 
(1,123.123,'Crvena',2,'Rokerica'),
(0,10.99,'Smeđa',0,'Kratka frizura'),
(1,11.23,'Plava',1,'Duga kosa');

insert into muskarac (ogrlica,vesta) values 
(1,'Plava'),
(0,'Zelena'),
(0,'Crna');

insert into neprijatelj_muskarac (neprijatelj,muskarac) values 
(1,3),(2,1),(3,2);

insert into brat (eura,gustoca,haljina,neprijatelj) values 
(500.99,100.20,'Plava',1),
(1000.10,250.30,'Crna',3),
(2000.20,123.1,'Zelena',2);

insert into ostavljen (drugiputa,asocijalno,brat) values 
('2021-02-20',0,3),
('2020-10-10',1,2),
('2021-01-15',0,1);

#U tablici prijatelj postavite svim zapisima kolonu kratkamajica na 
#vrijednost Osijek.

update prijatelj set kratkamajica = 'Osijek';

#U tablici ostavljena obrišite sve zapise čija je vrijednost kolone 
#hlace veće od AB. 

delete from ostavljena where hlace>'AB';

# Izlistajte kuna iz tablice brat uz uvjet da vrijednost kolone gustoca 
#nije 6,10,16,25 ili 36.

select kuna from brat where gustoca not in (6,10,16,25,36);

#Prikažite vesta iz tablice muskarac, dukserica iz tablice ostavljena 
#te drugiputa iz tablice ostavljen uz uvjet da su vrijednosti kolone 
#gustoca iz tablice brat veće od 100 te da su vrijednosti kolone 
#gustoca iz tablice neprijatelj različite od 22. Podatke posložite po 
#drugiputa iz tablice ostavljen silazno. 

select a.vesta, f.dukserica, e.drugiputa
from muskarac a 
inner join neprijatelj_muskarac b on a.sifra = b.muskarac 
inner join neprijatelj c on c.sifra = b.neprijatelj 
inner join brat d on d.neprijatelj = c.sifra 
inner join ostavljen e on e.brat = d.sifra 
inner join ostavljena f on f.ostavljen = e.sifra 
where d.gustoca >100 and c.gustoca not like 22 order by e.drugiputa desc;