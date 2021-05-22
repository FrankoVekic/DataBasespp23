DROP database IF EXISTS kolokvij_vjezba4;
CREATE database kolokvij_vjezba4;
use kolokvij_vjezba4;

CREATE TABLE punac (
sifra int NOT NULL PRIMARY KEY auto_increment,
treciputa datetime,
majica varchar (46),
jmbag char(11) not null,
novcica decimal (18,7) not null,
maraka decimal (12,6) not null,
ostavljen int not null
);

create table ostavljen (
sifra int not null primary key auto_increment,
modelnaocala varchar(43),
introvertno bit,
kuna decimal (14,10)
);

create table snasa (
sifra int not null primary key auto_increment,
introvertno bit,
treciputa datetime,
haljina varchar(44) not null,
zena int not null
);

create table becar (
sifra int not null primary key auto_increment,
novcica decimal(14,8),
kratkamajica varchar(48) not null,
bojaociju varchar(36) not null,
snasa int not null
);

create table prijatelj (
sifra int not null primary key auto_increment,
eura decimal (16,9),
prstena int not null,
gustoca decimal (16,5),
jmbag char(11) not null,
suknja varchar(47) not null,
becar int not null
);

create table zena (
sifra int not null primary key auto_increment,
suknja varchar(39) not null,
lipa decimal (18,7),
prstena int not null
);

create table mladic (
sifra int not null primary key auto_increment,
kuna decimal (15,9),
lipa decimal (18,5),
nausnica int,
stilfrizura varchar(49),
vesta varchar(34) not null
);

create table zena_mladic (
sifra int not null primary key auto_increment,
zena int not null,
mladic int not null
);

alter table becar add foreign key (snasa) references snasa(sifra);
alter table prijatelj add foreign key (becar) references becar(sifra);
alter table snasa add foreign key (zena) references zena(sifra);
alter table zena_mladic add foreign key (zena) references zena(sifra);
alter table zena_mladic add foreign key (mladic) references mladic(sifra);
alter table punac add foreign key (ostavljen) references ostavljen(sifra);

#U tablice becar, snasa i zena_mladic unesite po 3 retka

insert into zena (suknja,prstena) values 
('Plava',2),
('Crvena',2),
('Zelena',1);

insert into snasa (haljina,zena) values 
('Crna',2),
('Plava',3),
('Roza',1);

insert into becar (kratkamajica,bojaociju,snasa) values 
('Crna','Plava',2),
('Siva','Smeđa',1),
('Smeđa','Plava',3);

insert into mladic (vesta) values 
('Crvena'),
('Siva'),
('Plava');

insert into zena_mladic (zena,mladic) values 
(1,2),
(3,1),
(2,3);

#U tablici punac postavite svim zapisima kolonu majica na 
#vrijednost Osijek.

update punac set majica ='Osijek';

#U tablici prijatelj obrišite sve zapise čija je vrijednost kolone 
#prstena veće od 17. 

delete from prijatelj where prstena>17;

#. Izlistajte haljina iz tablice snasa uz uvjet da vrijednost kolone 
#treciputa nepoznate.

select haljina from snasa where treciputa is null;

#Prikažite nausnica iz tablice mladic, jmbag iz tablice prijatelj te 
#kratkamajica iz tablice becar uz uvjet da su vrijednosti kolone 
#treciputa iz tablice snasa poznate te da su vrijednosti kolone lipa iz 
#tablice zena različite od 29. Podatke posložite po kratkamajica iz 
#tablice becar silazno.

select a.nausnica, f.jmbag, e.kratkamajica 
from mladic a
inner join zena_mladic b on a.sifra = b.mladic 
inner join zena c on b.zena =c.sifra 
inner join snasa d on c.sifra=d.zena 
inner join becar e on e.snasa =d.sifra 
inner join prijatelj f on e.sifra =f.becar 
where d.treciputa is not null and c.lipa not like 29 order by e.kratkamajica desc;