drop database if exists kolokvij_vjezba18;
create database kolokvij_vjezba18;
use kolokvij_vjezba18;

create table zarucnica (
sifra int not null primary key auto_increment,
carape varchar(43),
treciputa datetime not null,
eura decimal(16,8),
sestra int 
);

create table sestra(
sifra int not null primary key auto_increment,
eura decimal(14,10),
indiferentno bit,
maraka decimal(13,8),
ogrlica int,
haljina varchar(31) not null,
introvertno bit,
mladic int
);

create table mladic (
sifra int not null primary key auto_increment,
carape varchar(50) not null,
jmbag char(11),
hlace varchar(50) not null,
treciputa datetime,
drugiputa datetime not null,
muskarac int
);

create table muskarac (
sifra int not null primary key auto_increment,
treciputa datetime,
nausnica int not null,
drugiputa datetime not null,
prstena int not null,
modelnaocala varchar(34)
);

create table muskarac_prijatelj (
sifra int not null primary key auto_increment,
muskarac int not null,
prijatelj int not null
);

create table prijatelj (
sifra int not null primary key auto_increment,
novcica decimal(15,9),
ekstrovertno bit not null,
bojakose varchar(30) not null,
haljina varchar(37),
narukvica int
);

create table djevojka(
sifra int not null primary key auto_increment,
bojaociju varchar(43) not null,
treciputa datetime not null,
carape varchar(32) not null
);

create table ostavljena (
sifra int not null primary key auto_increment,
novcica decimal(18,9),
drugiputa datetime not null,
dukserica varchar(35),
kratkamajica varchar(34),
djevojka int not null
);

alter table ostavljena add foreign key (djevojka) references djevojka(sifra);
alter table muskarac_prijatelj add foreign key (muskarac) references muskarac(sifra);
alter table muskarac_prijatelj add foreign key (prijatelj) references prijatelj(sifra);
alter table mladic add foreign key (muskarac) references muskarac(sifra);
alter table sestra add foreign key (mladic) references mladic (sifra);
alter table zarucnica add foreign key (sestra) references sestra(sifra);

#U tablice sestra, mladic i muskarac_prijatelj unesite po 3 retka. 

insert into muskarac (nausnica,drugiputa,prstena) values 
(2,'2020-02-22',1),
(1,'2020-05-05',1),
(2,'2020-07-07',0);

insert into prijatelj (ekstrovertno,bojakose) values 
(1,'Plava'),(0,'Smeđa'),(0,'Plava');

insert into muskarac_prijatelj (muskarac,prijatelj) values (1,3),(2,1),(3,2);

insert into mladic (carape,hlace,drugiputa) values 
('Duge','Plave','2020-01-01'),
('Kratke','Zelene','2020-02-02'),
('Duge','Smeđe','2021-01-01');
 
insert into sestra (haljina) values ('Plava'),('Zelena'),('Roza');

#U tablici ostavljena postavite svim zapisima kolonu drugiputa na 
#vrijednost 7. travnja 2016.

update ostavljena set drugiputa = '2016-04-07';

#U tablici zarucnica obrišite sve zapise čija je vrijednost kolone 
#treciputa 18. travnja 2015.

delete from zarucnica where treciputa = '2015-04-18';

# Izlistajte hlace iz tablice mladic uz uvjet da vrijednost kolone jmbag 
#nepoznate.

select hlace from mladic where jmbag is null;


#Prikažite bojakose iz tablice prijatelj, sestra iz tablice zarucnica te 
#indiferentno iz tablice sestra uz uvjet da su vrijednosti kolone jmbag 
#iz tablice mladic poznate te da su vrijednosti kolone nausnica iz 
#tablice muskarac jednake broju 213. Podatke posložite po 
#indiferentno iz tablice sestra silazno. 

select a.bojakose, f.sestra , e.indiferentno 
from prijatelj a
inner join muskarac_prijatelj b on b.prijatelj = a.sifra 
inner join muskarac c on c.sifra = b.muskarac 
inner join mladic d on d.muskarac = c.sifra 
inner join sestra e on e.mladic = d.sifra 
inner join zarucnica f on f.sestra = e.sifra 
where d.jmbag is not null and c.nausnica = 213 order by e.indiferentno desc;


# Prikažite kolone nausnica i drugiputa iz tablice muskarac čiji se 
#primarni ključ ne nalaze u tablici muskarac_prijatelj.

select a.nausnica, a.drugiputa from muskarac a where a.sifra not in (select distinct sifra from muskarac_prijatelj );