#Kreirajte tablice i veze između tablica. 
DROP database IF EXISTS kolokvij_vjezba11;
CREATE database kolokvij_vjezba11;
use kolokvij_vjezba11;

CREATE TABLE djevojka (
sifra int NOT NULL PRIMARY KEY auto_increment,
kratkamajica varchar(45) NOT NULL,
prstena int,
ekstrovertno bit NOT NULL,
majica varchar(42) NOT NULL,
introvertno bit NOT NULL,
svekrva int
);

CREATE TABLE punica (
sifra int NOT NULL PRIMARY KEY auto_increment,
carape varchar(33) NOT NULL,
drugiputa datetime,
majica varchar(40) NOT NULL,
haljina varchar(30) NOT NULL,
bojakose varchar(37) NOT NULL,
djevojka int NOT null
);

CREATE TABLE svekrva (
sifra int NOT NULL PRIMARY KEY auto_increment,
narukvica int NOT NULL,
carape varchar(39) NOT NULL,
haljina varchar(31),
punac int NOT NULL
);

CREATE TABLE punac (
sifra int NOT NULL PRIMARY KEY auto_increment,
jmbag char(11),
kuna decimal (16,5) NOT NULL,
vesta varchar(45) NOT null
);

CREATE TABLE punac_mladic (
sifra int NOT NULL PRIMARY KEY auto_increment,
punac int NOT NULL,
mladic int NOT null
);

CREATE TABLE mladic (
sifra int NOT NULL PRIMARY KEY auto_increment,
ogrlica int NOT NULL,
stilfrizura varchar(35),
drugiputa datetime NOT NULL,
hlace varchar(41) NOT null
);

CREATE TABLE muskarac (
maraka decimal (16,5),
novcica decimal (13,10),
nausnica int,
narukvica int NOT NULL,
gustoca decimal (12,6),
neprijatelj int NOT null
);

CREATE TABLE neprijatelj (
sifra int NOT NULL PRIMARY KEY auto_increment,
narukvica int NOT NULL,
novcica decimal (12,8) NOT NULL,
bojakose varchar(39) NOT NULL,
gustoca decimal (14,10),
introvertno bit NOT NULL,
asocijalno bit
);

alter table muskarac add foreign key (neprijatelj) references neprijatelj(sifra);
alter table svekrva add foreign key (punac) references punac (sifra);
alter table punac_mladic add foreign key (punac) references punac(sifra);
alter table punac_mladic add foreign key (mladic) references mladic(sifra);
alter table punica add foreign key (djevojka) references djevojka(sifra);
alter table djevojka add foreign key (svekrva) references svekrva(sifra);

#U tablice djevojka, svekrva i punac_mladic unesite po 3 retka.

insert into mladic (ogrlica,drugiputa,hlace) values 
(1,'2021-02-22','Zelene'),
(2,'2020-06-10','Plave'),
(0,'2021-01-01','Crne');

insert into punac (kuna,vesta) values 
(100.99,'Plava'),
(200.99,'Crna'),
(300.12,'Zelena');

insert into punac_mladic (punac,mladic) values (1,2),(2,3),(3,1);

insert into svekrva (narukvica,carape,punac) values 
(0,'Plave kratke',2),
(1,'Crvene duge',1),
(2,'Crne kratke',3);

insert into djevojka (kratkamajica,ekstrovertno,majica,introvertno) values 
('Plava',0,'Zelena',1),
('Crna',1,'Crvena',0),
('Žuta',0,'Plava',1);

#U tablici muskarac postavite svim zapisima kolonu novcica na vrijednost 15,70. 

update muskarac set novcica = 15.70;

#U tablici punica obrišite sve zapise čija je vrijednost kolone drugiputa 8. travnja 2019. 

delete from punica where drugiputa = '2019-04-08';

#4. Izlistajte haljina iz tablice svekrva uz uvjet da vrijednost kolone carape sadrže slova ana. 

select haljina from svekrva where carape like '%ana%';

#. Prikažite drugiputa iz tablice mladic, haljina iz tablice punica te 
#prstena iz tablice djevojka uz uvjet da su vrijednosti kolone carape iz 
#tablice svekrva počinju slovom a te da su vrijednosti kolone kuna iz 
#tablice punac različite od 21. Podatke posložite po prstena iz tablice 
#djevojka silazno.

select a.drugiputa, f.haljina, e.prstena 
from mladic a 
inner join punac_mladic b on b.mladic =a.sifra 
inner join punac c on c.sifra =b.punac 
inner join svekrva d on d.punac =c.sifra 
inner join djevojka e on e.svekrva =d.sifra 
inner join punica f on f.djevojka = e.sifra 
where d.carape like 'a%' and c.kuna not like 21 order by e.prstena desc;