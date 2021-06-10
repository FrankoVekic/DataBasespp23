# Kreirajte tablice (16) i veze između tablica.
DROP database IF EXISTS kolokvij_vjezba9;
CREATE database kolokvij_vjezba9;
use kolokvij_vjezba9;

create TABLE punac_prijateljica (
sifra int NOT NULL PRIMARY KEY auto_increment,
punac int NOT NULL,
prijateljica int NOT null
);

CREATE TABLE prijateljica (
sifra int NOT NULL PRIMARY KEY auto_increment,
treciputa datetime,
novcica decimal (16,7),
kuna decimal (14,10) NOT NULL,
drugiputa datetime,
haljina varchar(45),
kratkamajica varchar(49)
);

create table cura (
sifra int NOT NULL PRIMARY KEY auto_increment,
vesta varchar (49) not null,
ekstroventno bit,
carape varchar(37),
suknja varchar(37) not null,
punac int not null
);

create table punac (
sifra int NOT NULL PRIMARY KEY auto_increment,
narukvica int not null,
modelnaocala varchar (30),
kuna decimal (12,8),
bojaociju varchar(33),
suknja varchar(45)
);

create table zarucnik (
sifra int NOT NULL PRIMARY KEY auto_increment,
gustoca decimal (17,6),
haljina varchar(40),
kratkamajica varchar(48) not null,
nausnica int not null,
brat int not null
);

create table brat (
sifra int NOT NULL PRIMARY KEY auto_increment,
novcica decimal (18,9) not null,
ekstroventno bit,
vesta varchar(32) not null,
cura int
);

create table snasa(
sifra int NOT NULL PRIMARY KEY auto_increment,
prstena int,
drugiputa datetime not null,
haljina varchar(38) not null,
ostavljena int
);

create table ostavljena (
sifra int NOT NULL PRIMARY KEY auto_increment,
modelnaocala varchar(34) not null,
suknja varchar(32),
eura decimal(18,7) not null,
lipa decimal (15,7) not null,
treciputa datetime not null,
drugiputa datetime not null
);

alter table snasa add foreign key (ostavljena ) references ostavljena (sifra);
alter table zarucnik add foreign key (brat) references brat(sifra);
alter table brat add foreign key (cura) references cura(sifra);
alter table cura add foreign key (punac) references punac(sifra);
alter table punac_prijateljica add foreign key (prijateljica) references prijateljica(sifra);
alter table punac_prijateljica add foreign key (punac) references punac(sifra);

#U tablice brat, cura i punac_prijateljica unesite po 3 retka.


insert into punac (narukvica) values 
(1),(2),(0);

insert into prijateljica (kuna) values 
(10.99),(13.50),(25.99);

insert into punac_prijateljica (punac,prijateljica) values (1,1),(2,2),(3,3);

insert into cura (vesta,suknja,punac) values 
('Plava','Crvena',2),
('Zelena','Bijela',1),
('Crvena','Crna',3);

insert into brat (novcica,vesta) values 
(10.99,'Crvena'),
(11.50,'Zelena'),
(123.123,'Crna');

#U tablici snasa postavite svim zapisima kolonu drugiputa na vrijednost 24. travnja 2020.

update snasa set drugiputa ='2020-04-24';

# U tablici zarucnik obrišite sve zapise čija je vrijednost kolone haljina jednako AB. 

delete from zarucnik where haljina ='AB';

#Izlistajte carape iz tablice cura uz uvjet da vrijednost kolone ekstroventno nepoznate.

select carape from cura where ekstroventno is null;

# Prikažite kuna iz tablice prijateljica, nausnica iz tablice zarucnik te 
#ekstroventno iz tablice brat uz uvjet da su vrijednosti kolone 
#ekstroventno iz tablice cura poznate te da su vrijednosti kolone 
#modelnaocala iz tablice punac sadrže niz znakova ba. Podatke 
#posložite po ekstroventno iz tablice brat silazno. 

select a.kuna, f.nausnica, e.ekstroventno 
from prijateljica a 
inner join punac_prijateljica b on a.sifra =b.prijateljica 
inner join punac c on c.sifra = b.punac 
inner join cura d on d.punac =c.sifra 
inner join brat e on e.cura = d.sifra 
inner join zarucnik f on f.brat = e.sifra 
where d.ekstroventno is not null and c.modelnaocala like '%ba%' order by e.ekstroventno desc;