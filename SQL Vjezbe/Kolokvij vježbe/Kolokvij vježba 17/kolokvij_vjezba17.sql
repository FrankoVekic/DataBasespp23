DROP database IF EXISTS kolokvij_vjezba17;
create database kolokvij_vjezba17;
use kolokvij_vjezba17;

create table becar (
sifra int not null primary key auto_increment,
narukvica int,
asocijalno bit not null,
vesta varchar(48),
kuna decimal(13,10),
kratkamajica varchar(30) not null
);

create table brat (
sifra int not null primary key auto_increment,
asocijalno bit not null,
dukserica varchar(35),
novcica decimal(15,6) not null,
introvertno bit not null
);

create table brat_becar (
sifra int not null primary key auto_increment,
brat int not null,
becar int not null
);

create table ostavljen (
sifra int not null primary key auto_increment,
bojaociju varchar(45),
bojakose varchar(33),
novcica decimal (16,7) not null,
brat int not null
);

create table cura (
sifra int not null primary key auto_increment,
ogrlica int,
kuna decimal (16,8),
indiferentno bit,
jmbag char(11),
maraka decimal (12,7) not null,
ostavljen int not null
);

create table prijateljica (
sifra int not null primary key auto_increment,
lipa decimal (12,9),
haljina varchar(37),
maraka decimal (13,8)not null,
modelnaocala varchar(41) not null,
cura int
);

create table punica (
sifra int not null primary key auto_increment,
indiferentno bit,
narukvica int,
gustoca decimal(18,10) not null,
prijatelj int
);

create table prijatelj (
sifra int not null primary key auto_increment,
maraka decimal (13,6),
narukvica int,
nausnica int,
lipa decimal(15,10),
carape varchar(33) not null,
stilfrizura varchar(35)
);

alter table brat_becar add foreign key (brat) references brat(sifra);
alter table brat_becar add foreign key (becar) references becar(sifra);
alter table ostavljen add foreign key (brat) references brat(sifra);
alter table cura add foreign key (ostavljen) references ostavljen(sifra);
alter table prijateljica add foreign key (cura) references cura(sifra);
alter table punica add foreign key (prijatelj) references prijatelj(sifra);

#U tablice cura, ostavljen i brat_becar unesite po 3 retka.

insert into brat (asocijalno,novcica,introvertno) values 
(0,123.123,1), 
(1,10.99,1),
(1,10.12,0);

insert into becar (asocijalno,kratkamajica) values 
(1,'Plava'),
(0,'Crvena'),
(1,'Zelena');

insert into brat_becar (brat,becar) values (1,1),(2,2),(3,3);

insert into ostavljen (novcica,brat) values (100.99,2),(10.99,1),(123.123,3);

insert into cura (maraka,ostavljen) values (123.123,1),(123.123,2),(123.123,3);

#U tablici punica postavite svim zapisima kolonu narukvica na vrijednost 11.

update punica set narukvica = 11;

#U tablici prijateljica obrišite sve zapise čija je vrijednost kolone 
#haljina različito od AB. 

delete from prijateljica where haljina like 'AB';

#Izlistajte novcica iz tablice ostavljen uz uvjet da vrijednost kolone 
#bojakose sadrže slova ana.


select novcica from ostavljen where bojakose like '%ana%';

#Prikažite vesta iz tablice becar, modelnaocala iz tablice prijateljica 
#te kuna iz tablice cura uz uvjet da su vrijednosti kolone bojakose iz 
#tablice ostavljen počinju slovom a te da su vrijednosti kolone 
#dukserica iz tablice brat sadrže niz znakova ba. Podatke posložite po 
#kuna iz tablice cura silazno. 

select a.vesta, f.modelnaocala, e.kuna 
from becar a 
inner join brat_becar b on b.becar = a.sifra 
inner join brat c on c.sifra = b.brat 
inner join ostavljen d on d.brat = c.sifra 
inner join cura e on e.ostavljen = d.sifra 
inner join prijateljica f on f.cura = e.sifra 
where d.bojakose like 'a%' and c.dukserica like '%ba%' order by e.kuna desc;


#Prikažite kolone dukserica i novcica iz tablice brat čiji se primarni 
#ključ ne nalaze u tablici brat_becar. 

select a.dukserica, a.novcica 
from brat a 
left join brat_becar b on b.brat = a.sifra 
where a.sifra not in 
(select distinct sifra from brat_becar);