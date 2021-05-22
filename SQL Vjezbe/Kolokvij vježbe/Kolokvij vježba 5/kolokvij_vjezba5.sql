#Kreirajte tablice i veze između tablica.
DROP database IF EXISTS kolokvij_vjezba5;
CREATE database kolokvij_vjezba5;
use kolokvij_vjezba5;

create table mladic (
sifra int not null primary key auto_increment,
kratkamajica varchar(48) not null,
haljina varchar(30) not null,
asocijalno bit,
zarucnik int
);

create table zarucnik (
sifra int not null primary key auto_increment,
jmbag char(11),
lipa decimal (12,8),
indiferentno bit not null
);

create table svekar(
sifra int not null primary key auto_increment,
bojakose varchar(33),
majica varchar(31),
carape varchar(31) not null,
haljina varchar(43),
narukvica int,
eura decimal(14,5) not null
);

create table svekar_cura (
sifra int not null primary key auto_increment,
svekar int not null,
cura int not null
);

create table cura (
sifra int not null primary key auto_increment,
carape varchar(41) not null,
maraka decimal (17,10) not null,
asocijalno bit,
vesta varchar(47) not null
);

create table punac (
sifra int not null primary key auto_increment,
dukserica varchar(33),
prviputa datetime not null,
majica varchar(36),
svekar int not null
);

create table punica (
sifra int not null primary key auto_increment,
hlace varchar(43) not null,
nausnica int not null,
ogrlica int not null,
vesta varchar(49) not null,
modelnaocala varchar(31) not null,
treciputa datetime not null,
punac int not null
);

create table ostavljena (
sifra int not null primary key auto_increment,
majica varchar(33),
ogrlica int not null,
carape varchar(44),
stillfrizura varchar(42),
punica int not null
);

alter table mladic add foreign key (zarucnik) references zarucnik (sifra);
alter table ostavljena add foreign key (punica) references punica(sifra);
alter table punica add foreign key (punac) references punac(sifra);
alter table punac add foreign key (svekar) references svekar(sifra);
alter table svekar_cura add foreign key (svekar) references svekar(sifra);
alter table svekar_cura add foreign key (cura) references cura(sifra);

#U tablice punica, punac i svekar_cura unesite po 3 retka.

insert into svekar (carape,eura) values 
('Plave duge',500),
('Crne kratke',15.50),
('Bijele kratke',10.99);

insert into cura (carape,maraka,vesta) values 
('Plave kratke',15.99,'Plavo-bijela'),
('Bijele kratke',20.02,'Crveno-crna'),
('Crne duge',10.99,'Siva');

insert into svekar_cura (cura,svekar) values 
(1,2),(2,3),(3,1);

insert into punac (prviputa,svekar) values 
('2020-07-22',2),
('2020-11-03',1),
('2021-02-12',2);

insert into punica (hlace,nausnica,ogrlica,vesta,modelnaocala,treciputa,punac) values 
('Plave duge',2,2,'Crno-crvena','Sunčane','2021-01-25',2),
('Crne duge',1,2,'Bijelo-crna','Dioptrijske','2020-05-05',1),
('Sive duge',4,1,'Siva','Dioptrijske','2020-10-11',3);

#U tablici mladic postavite svim zapisima kolonu haljina na 
#vrijednost Osijek.

update mladic set haljina = 'Osijek';

#U tablici ostavljena obrišite sve zapise čija je vrijednost kolone 
#ogrlica jednako 17.

delete from ostavljena where ogrlica=17;

#Izlistajte majica iz tablice punac uz uvjet da vrijednost kolone 
#prviputa nepoznate.

select majica from punac where prviputa is null;

# Prikažite asocijalno iz tablice cura, stilfrizura iz tablice ostavljena te 
#nausnica iz tablice punica uz uvjet da su vrijednosti kolone prviputa iz 
#tablice punac poznate te da su vrijednosti kolone majica iz tablice 
#svekar sadrže niz znakova ba. Podatke posložite po nausnica iz tablice 
#punica silazno.

select a.asocijalno, f.stillfrizura, e.nausnica 
from cura a 
inner join svekar_cura b on a.sifra =b.cura 
inner join svekar c on b.svekar = c.sifra 
inner join punac d on c.sifra =d.svekar 
inner join punica e on d.sifra = e.punac 
inner join ostavljena f on e.sifra = f.punica 
where d.prviputa is not null and c.majica like '%ba%' order by e.nausnica desc;