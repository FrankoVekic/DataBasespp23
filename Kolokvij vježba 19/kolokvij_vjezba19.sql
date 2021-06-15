drop database if exists kolokvij_vjezba19;
create database kolokvij_vjezba19;
use kolokvij_vjezba19;

create table muskarac (
sifra int not null primary key auto_increment,
drugiputa datetime not null,
gustoca decimal(16,7),
maraka decimal (16,9),
ogrlica int not null,
svekrva int
);

create table svekrva(
sifra int not null primary key auto_increment,
ekstroventno bit,
carape varchar(42),
gustoca decimal(13,10) not null,
stilfrizura varchar(34) not null,
punac int not null
);

create table punac (
sifra int not null primary key auto_increment,
maraka decimal(12,7),
treciputa datetime,
ekstroventno bit,
hlace varchar(32),
punica int not null
);

create table punica (
sifra int not null primary key auto_increment,
stilfrizura varchar(39) not null,
maraka decimal (15,6) not null,
jmbag char(11) not null
);

create table punica_ostavljena (
sifra int not null primary key auto_increment,
punica int not null,
ostavljena int not null
);

create table ostavljena (
sifra int not null primary key auto_increment,
hlace varchar(41),
ekstroventno bit not null,
narukvica int,
eura decimal (17,6) not null,
kratkamajica varchar(46)
);

create table decko (
sifra int not null primary key auto_increment,
modelnaocala varchar(42) not null,
gustoca decimal(16,10) not null,
dukserica varchar(47) not null,
stilfrizura varchar(40),
novcica decimal(14,7) not null
);

create table svekar(
sifra int not null primary key auto_increment,
nausnica int not null,
indiferentno bit not null,
suknja varchar(37) not null,
drugiputa datetime,
kuna decimal(13,6) not null,
decko int 
);

alter table svekar add foreign key (decko) references decko(sifra);
alter table punica_ostavljena add foreign key (punica) references punica(sifra);
alter table punica_ostavljena add foreign key (ostavljena) references ostavljena(sifra);
alter table punac add foreign key (punica) references punica(sifra);
alter table svekrva add foreign key (punac) references punac(sifra);
alter table muskarac add foreign key (svekrva) references svekrva(sifra);

#U tablice svekrva, punac i punica_ostavljena unesite po 3 retka.

insert into punica (stilfrizura,maraka,jmbag) values 
('Rokerica',100.99,12345678912),
('Kratka frizura',20.99,12345678912),
('Čelav',10.99,12345678901);

insert into ostavljena (ekstroventno,eura) values 
(1,120.25),
(0,100.92),
(1,250.99);

insert into punica_ostavljena (punica, ostavljena) values 
(1,3),(3,2),(2,1);

insert into punac (punica) values 
(1),(2),(3);

insert into svekrva (gustoca,stilfrizura,punac) values 
(150.60,'Rokerica',1),
(200.99,'Kratka frizura',2),
(130.90,'Rokerica',3);

#U tablici svekar postavite svim zapisima kolonu indiferentno na 
#vrijednost false.

update svekar set indiferentno = 0;

#. U tablici muskarac obrišite sve zapise čija je vrijednost kolone 
#gustoca jednako 14,92.

delete from muskarac where gustoca = 14.92;

#Izlistajte ekstroventno iz tablice punac uz uvjet da vrijednost 
#kolone treciputa nepoznate.

select ekstroventno from punac where treciputa is null;


#. Prikažite narukvica iz tablice ostavljena, ogrlica iz tablice muskarac 
#te carape iz tablice svekrva uz uvjet da su vrijednosti kolone treciputa 
#iz tablice punac poznate te da su vrijednosti kolone maraka iz tablice 
#punica različite od 21. Podatke posložite po carape iz tablice svekrva 
#silazno. 

select a.narukvica, f.ogrlica, e.carape 
from ostavljena a 
inner join punica_ostavljena b on b.ostavljena = a.sifra 
inner join punica c on c.sifra = b.punica 
inner join punac d on d.punica = c.sifra 
inner join svekrva e on e.punac = d.sifra 
inner join muskarac f on f.svekrva = e.sifra 
where d.treciputa is not null and c.maraka != 21 order by e.carape desc;

# Prikažite kolone maraka i jmbag iz tablice punica čiji se primarni 
#ključ ne nalaze u tablici punica_ostavljena.

select a.maraka, a.jmbag 
from punica a where a.sifra not in (select distinct sifra from punica_ostavljena b);