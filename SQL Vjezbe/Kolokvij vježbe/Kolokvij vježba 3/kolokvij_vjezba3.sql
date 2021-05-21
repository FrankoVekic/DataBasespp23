#Kreirajte tablice i veze između tablica.
DROP database IF EXISTS kolokvij_vjezba3;
CREATE database kolokvij_vjezba3;
use kolokvij_vjezba3;


create table svekar (
sifra int not null primary key auto_increment,
novcica decimal (16,8) not null,
suknja varchar(44) not null,
bojakose varchar(36),
prstena int,
narukvica int not null,
cura int not null
);

create table cura(
sifra int not null primary key auto_increment,
dukserica varchar(49),
maraka decimal(13,7),
drugiputa datetime,
majica varchar(49),
novcica decimal (15,8),
ogrlica int not null
);

create table ostavljena (
sifra int not null primary key auto_increment,
kuna decimal (17,5),
lipa decimal (15,6),
majica varchar(36),
modelnaocala varchar(31) not null,
prijatelj int
);

create table prijatelj (
sifra int not null primary key auto_increment,
kuna decimal (16,10),
haljina varchar(37),
lipa decimal (13,10),
dukserica varchar(31),
indiferentno bit not null
);

create table prijatelj_brat (
sifra int not null primary key auto_increment,
prijatelj int not null,
brat int not null
);

create table brat(
sifra int not null primary key auto_increment,
jmbag char(11),
ogrlica int not null,
ekstroventno bit not null
);

create table snasa(
sifra int not null primary key auto_increment,
introvertno bit,
kuna decimal (15,6) not null,
eura decimal (12,9) not null,
treciputa datetime,
ostavljena int not null
);

create table punica (
sifra int not null primary key auto_increment,
asocijalno bit,
kratkamajica varchar(44),
kuna decimal (13,8) not null,
vesta varchar(32) not null,
snasa int
);

alter table svekar add foreign key (cura) references cura (sifra);
alter table snasa add foreign key (ostavljena) references ostavljena(sifra);
alter table punica add foreign key (snasa) references snasa(sifra);
alter table prijatelj_brat add foreign key (brat) references brat(sifra);
alter table prijatelj_brat add foreign key (prijatelj) references prijatelj(sifra);
alter table ostavljena add foreign key (prijatelj) references prijatelj(sifra);

#U tablice snasa, ostavljena i prijatelj_brat unesite po 3 retka.
insert into ostavljena (modelnaocala) values 
('Sunčane'),
('Dioptrijske'),
('Sunčane');

insert into snasa (kuna,eura,ostavljena) values 
(759.99,100,2),
(1499.99,210.50,1),
(650.70,85.20,3);

insert into prijatelj (indiferentno) values 
(0),(1),(0);

insert into brat (ogrlica,ekstroventno) values 
(2,0),
(1,0),
(3,1);

insert into prijatelj_brat (brat,prijatelj) values 
(1,2),
(2,3),
(3,1);
#U tablici svekar postavite svim zapisima kolonu suknja na 
#vrijednost Osijek.
update svekar set suknja ='Osijek';

#U tablici punica obrišite sve zapise čija je vrijednost kolone 
#kratkamajica jednako AB.
delete from punica where kratkamajica ='AB';

#Izlistajte majica iz tablice ostavljena uz uvjet da vrijednost kolone 
#lipa nije 9,10,20,30 ili 35.
select majica from ostavljena where lipa not in (9,10,20,30,35);

#Prikažite ekstroventno iz tablice brat, vesta iz tablice punica te 
#kuna iz tablice snasa uz uvjet da su vrijednosti kolone lipa iz tablice 
#ostavljena različito od 91 te da su vrijednosti kolone haljina iz tablice 
#prijatelj sadrže niz znakova ba. Podatke posložite po kuna iz tablice 
#snasa silazno.

select a.ekstroventno, f.vesta, e.kuna 
from brat a 
inner join prijatelj_brat b on a.sifra=b.brat 
inner join prijatelj c on b.prijatelj =c.sifra 
inner join ostavljena d on c.sifra = d.prijatelj 
inner join snasa e on d.sifra = e.ostavljena 
inner join punica f on e.sifra=f.snasa 
where d.lipa !=91 and c.haljina like ='%ba%' order by e.kuna desc;