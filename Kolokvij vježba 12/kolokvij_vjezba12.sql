DROP database IF EXISTS kolokvij_vjezba12;
CREATE database kolokvij_vjezba12;
use kolokvij_vjezba12;

CREATE TABLE zena (
sifra int not null primary key auto_increment,
eura decimal(16,6) not null,
indiferentno bit,
novcica decimal(15,5)
);

create table decko (
sifra int not null primary key auto_increment,
hlace varchar (46),
asocijalno bit,
stilfrizura varchar(43) not null,
indiferentno bit not null,
ogrlica int,
zena int not null
);

create table zarucnica (
sifra int not null primary key auto_increment,
hlace varchar(48) not null,
kratkamajica varchar(46) not null,
jmbag char(11),
nasnica int
);

create table zarucnica_sestra (
sifra int not null primary key auto_increment,
zarucnica int not null,
sestra int not null
);

create table sestra(
sifra int not null primary key auto_increment,
lipa decimal (15,9),
ogrlica int,
kratkamajica varchar(43) not null
);

create table svekrva (
sifra int not null primary key auto_increment,
maraka decimal (14,7),
kuna decimal (15,8),
vesta varchar(44),
asocijalno bit not null,
ekstrovertno bit,
zarucnica int
);

create table djevojka(
sifra int not null primary key auto_increment,
modelanocala varchar(34) not null,
vesta varchar(40) not null,
kratkamajica varchar(39) not null,
suknja varchar (36) not null,
bojaociju varchar(32) not null,
prstena int not null,
svekrva int not null
);

create table prijatelj(
sifra int not null primary key auto_increment,
lipa decimal (16,10),
asocijalno bit,
stilfrizura varchar(37),
kuna decimal (14,6),
modelnaocala varchar(38),
djevojka int
);

alter table decko add foreign key (zena) references zena(sifra);
alter table zarucnica_sestra add foreign key (sestra) references sestra(sifra);
alter table zarucnica_sestra add foreign key (zarucnica) references zarucnica(sifra);
alter table svekrva add foreign key (zarucnica) references zarucnica(sifra);
alter table djevojka add foreign key (svekrva) references svekrva(sifra);
alter table prijatelj add foreign key (djevojka) references djevojka(sifra);

#U tablice djevojka, svekrva i zarucnica_sestra unesite po 3 retka.

insert into zarucnica (hlace,kratkamajica) values 
('Plave kratke','Crna'),
('Roze duge','Zelena'),
('Sive duge','Crvena');

insert into sestra (kratkamajica) values 
('Plava'),
('Siva'),
('Crna');

insert into zarucnica_sestra (sestra,zarucnica) values (1,1),(2,2),(3,3);

insert into svekrva (asocijalno) values 
(1),(0),(1);

insert into djevojka (modelanocala,vesta,kratkamajica,suknja,bojaociju,prstena,svekrva) values 
('Dioptrijske','Plava','Crvena','Crvena','Plave',1,1),
('Sunčane','Crna','Zelena','Plava','Smeđe',0,2),
('Sunčane','Zelena','Crna','Crvena','Plave',2,3);

#U tablici decko postavite svim zapisima kolonu asocijalno na vrijednost false.

update decko set asocijalno = 0;

#U tablici prijatelj obrišite sve zapise čija je vrijednost kolone asocijalno false. 

delete from prijatelj where asocijalno = 0;

#Izlistajte vesta iz tablice svekrva uz uvjet da vrijednost kolone kuna 
#nije 8,13,20,28 ili 35.

select vesta from svekrva where kuna not in (8,13,20,28,35);

#Prikažite kratkamajica iz tablice sestra, kuna iz tablice prijatelj te 
#vesta iz tablice djevojka uz uvjet da su vrijednosti kolone kuna iz 
#tablice svekrva veće od 87 te da su vrijednosti kolone kratkamajica iz 
#tablice zarucnica sadrže niz znakova ba. Podatke posložite po vesta iz 
#tablice djevojka silazno. 

select a.kratkamajica, f.kuna, e.vesta 
from sestra a 
inner join zarucnica_sestra b on b.sestra =a.sifra 
inner join zarucnica c on c.sifra = b.zarucnica 
inner join svekrva d on d.zarucnica = c.sifra 
inner join djevojka e on e.svekrva =d.sifra 
inner join prijatelj f on f.djevojka = e.sifra 
where d.kuna >87 and c.kratkamajica like '%ba%' order by e.vesta desc;