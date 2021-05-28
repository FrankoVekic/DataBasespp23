drop database if exists kolokvij_vjezba15;
create database kolokvij_vjezba15;
use kolokvij_vjezba15;

create table decko (
sifra int not null primary key auto_increment,
vesta varchar(37) not null,
bojakose varchar(45),
gustoca decimal(18,7),
prijatelj int not null
);

create table prijatelj(
sifra int not null primary key auto_increment,
majica varchar(41) not null,
vesta varchar(30),
narukvica int not null,
zarucnica int
);

create table zarucnica (
sifra int not null primary key auto_increment,
prviputa datetime not null,
bojaociju varchar(31) not null,
modelnaocala varchar(40),
zarucnik int
);

create table zarucnik (
sifra int not null primary key auto_increment,
kratkamajica varchar(30) not null,
jmbag char(11) not null,
dukserica varchar(45) not null,
indiferentno bit,
treciputa datetime not null
);

create table zarucnik_ostavljena (
sifra int not null primary key auto_increment,
zarucnik int not null,
ostavljena int not null
);

create table ostavljena (
sifra int not null primary key auto_increment,
gustoca decimal (16,7),
stilfrizura varchar(31) not null,
ogrlica int,
maraka decimal (15,10)
);

create table brat (
sifra int not null primary key auto_increment,
bojakose varchar(49) not null,
majica varchar(36),
maraka decimal (17,9),
vesta varchar(30) not null
);

create table prijateljica(
sifra int not null primary key auto_increment,
kratkamajica varchar(30) not null,
bojakose varchar(45),
asocijalno bit not null,
treciputa datetime not null,
jmbag char(11) not null,
vesta varchar(42) not null,
brat int
);

alter table prijateljica add foreign key (brat) references brat(sifra);
alter table zarucnik_ostavljena add foreign key (ostavljena) references ostavljena(sifra);
alter table zarucnik_ostavljena add foreign key (zarucnik) references zarucnik (sifra);
alter table zarucnica add foreign key (zarucnik) references zarucnik(sifra);
alter table prijatelj add foreign key (zarucnica) references zarucnica(sifra);
alter table decko add foreign key (prijatelj) references prijatelj(sifra);

#U tablice prijatelj, zarucnica i zarucnik_ostavljena unesite po 3 retka.

insert into zarucnik (kratkamajica,jmbag,dukserica,treciputa) values 
('Zelena',12345671231,'Crna','2021-05-28'),
('Plava',02356612316,'Crvena','2020-11-20'),
('Žuta',58699102316,'Plava','2021-01-15');

insert into ostavljena (stilfrizura) values 
('Kratka'),
('Duga'),
('Kratka');

insert into zarucnik_ostavljena (zarucnik,ostavljena) values 
(3,1),(2,2),(1,3);

insert into zarucnica (prviputa,bojaociju) values 
('2020-07-18','Plava'),
('2021-02-02','Smeđa'),
('2021-01-01','Plava');

insert into prijatelj (majica,narukvica) values 
('Plava',1),
('Smeđa',0),
('Zelena',3);

#U tablici prijateljica postavite svim zapisima kolonu bojakose na vrijednost Osijek. 

update prijateljica set bojakose ='Osijek';

#U tablici decko obrišite sve zapise čija je vrijednost kolone bojakose jednako AB. 

delete from decko where bojakose ='AB';

#Izlistajte modelnaocala iz tablice zarucnica uz uvjet da vrijednost 
#kolone bojaociju sadrže slova ana.

select modelnaocala from zarucnica where bojaociju like '%ana%';

#Prikažite ogrlica iz tablice ostavljena, prijatelj iz tablice decko te 
#vesta iz tablice prijatelj uz uvjet da su vrijednosti kolone bojaociju iz 
#tablice zarucnica počinju slovom a te da su vrijednosti kolone jmbag 
#iz tablice zarucnik poznate. Podatke posložite po vesta iz tablice 
#prijatelj silazno. 

select a.ogrlica, f.prijatelj, f.vesta 
from ostavljena a 
inner join zarucnik_ostavljena b on b.ostavljena =a.sifra 
inner join zarucnik c on c.sifra = b.zarucnik 
inner join zarucnica d on d.zarucnik =c.sifra 
inner join prijatelj e on e.zarucnica =d.sifra 
inner join decko f on f.prijatelj =e.sifra 
where d.bojaociju like 'a%' and c.jmbag is not null order by e.vesta desc;

#Prikažite kolone jmbag i dukserica iz tablice zarucnik čiji se 
#primarni ključ ne nalaze u tablici zarucnik_ostavljena.

select jmbag, dukserica 
from zarucnik
where sifra not in 
(select distinct sifra from zarucnik_ostavljena);