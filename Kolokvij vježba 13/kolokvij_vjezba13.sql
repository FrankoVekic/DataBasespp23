#Kreirajte tablice i veze između tablica.
drop database if exists kolokvij_vjezba13;
create database  kolokvij_vjezba13;
use kolokvij_vjezba13;

create table ostavljen (
sifra int not null primary key auto_increment,
kratkamajica varchar(34),
drugiputa datetime,
asocijalno bit not null,
stilfrizura varchar(40),
svekrva int not null
);

create table mladic (
sifra int not null primary key auto_increment,
drugiputa datetime not null,
carape varchar(48) not null,
ogrlica int,
kratkamajica varchar(42) not null,
introvertno bit not null,
asocijalno bit not null,
ostavljen int not null
);

create table cura (
sifra int not null primary key auto_increment,
ogrlica int,
hlace varchar(42),
vesta varchar(31) not null,
majica varchar(50),
mladic int 
);

create table svekrva (
sifra int not null primary key auto_increment,
hlace varchar(35),
ogrlica int,
ekstrovertno bit not null,
narukvica int
);

create table svekrva_svekar(
sifra int not null primary key auto_increment,
svekrva int not null,
svekar int not null
);

create table svekar (
sifra int not null primary key auto_increment,
suknja varchar(40),
stilfrizura varchar(34) not null,
gustoca decimal (15,10) not null,
carape varchar(35) not null
);

create table neprijatelj (
sifra int not null primary key auto_increment,
bojakose varchar(32),
novcica decimal (12,6) not null,
prviputa datetime,
indiferentno bit not null,
suknja varchar(44),
jmbag char(11),
muskarac int not null
);

create table muskarac (
sifra int not null primary key auto_increment,
dukserica varchar(34),
gustoca decimal (13,10),
haljina varchar(42) not null,
majica varchar(39),
suknja varchar(50) not null,
kuna decimal (17,9) not null
);

alter table neprijatelj add foreign key (muskarac) references muskarac(sifra);
alter table svekrva_svekar add foreign key (svekar) references svekar(sifra);
alter table svekrva_svekar add foreign key (svekrva) references svekrva(sifra);
alter table ostavljen add foreign key (svekrva) references svekrva(sifra);
alter table mladic add foreign key (ostavljen) references ostavljen (sifra);
alter table cura add foreign key (mladic) references mladic(sifra);

#U tablice mladic, ostavljen i svekrva_svekar unesite po 3 retka.

insert into svekrva (ekstrovertno) values (1),(0),(0);

insert into svekar (stilfrizura,gustoca,carape) values 
('Duga ravna',1525.23,'Zelene'),
('Kratka',2000.99,'Crne'),
('Kratka',1212.213,'Plave');

insert into svekrva_svekar (svekrva,svekar) values (1,1),(2,2),(3,3);

insert into ostavljen (asocijalno,svekrva) values 
(0,1),(1,2),(0,3);

insert into mladic (drugiputa,carape,kratkamajica,introvertno,asocijalno,ostavljen) values 
('2021-02-22','Crne','Plava',0,1,2),
('2021-03-01','Plave','Zelena',1,0,1),
('2020-10-12','Roze','Crvena',1,0,3);

#U tablici neprijatelj postavite svim zapisima kolonu novcica na vrijednost 13,77. 

update neprijatelj set novcica = 13.77;

#U tablici cura obrišite sve zapise čija je vrijednost kolone hlace različito od AB. 

delete from cura where hlace !='AB';

#. Izlistajte asocijalno iz tablice ostavljen uz uvjet da vrijednost kolone drugiputa nepoznate.

select asocijalno from ostavljen where drugiputa is null;

# Prikažite gustoca iz tablice svekar, majica iz tablice cura te carape 
#iz tablice mladic uz uvjet da su vrijednosti kolone drugiputa iz tablice 
#ostavljen poznate te da su vrijednosti kolone ogrlica iz tablice svekrva 
#jednake broju 193. Podatke posložite po carape iz tablice mladic 
#silazno. 

select a.gustoca, f.majica, e.carape 
from svekar a 
inner join svekrva_svekar b on a.sifra =b.svekar 
inner join svekrva c on c.sifra = b.svekrva 
inner join ostavljen d on d.svekrva = c.sifra 
inner join mladic e on e.ostavljen = d.sifra 
inner join cura f on f.mladic = c.sifra 
where d.drugiputa is not null and c.ogrlica = 193 order by e.carape desc;

# Prikažite kolone ogrlica i ekstroventno iz tablice svekrva čiji se 
#primarni ključ ne nalaze u tablici svekrva_svekar.

select  a.ogrlica, a.ekstrovertno 
from svekrva a 
left join svekrva_svekar b on b.svekrva = a.sifra 
where b.svekrva is null;