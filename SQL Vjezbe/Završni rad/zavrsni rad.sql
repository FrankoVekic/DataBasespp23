drop database if exists game_shop;
create database game_shop;
use game_shop;

create table proizvod(
sifra int not null primary key auto_increment,
naziv varchar(300),
cijena decimal(18,4),
opis varchar(300)
);

create table kupac (
sifra int not null primary key auto_increment,
ime varchar(300),
prezime varchar(300),
email varchar(200),
broj_mobitela varchar(11)
);

create table narudzbe (
sifra int not null primary key auto_increment,
kupac int,
proizvod int,
datum_narudzbe datetime,
stanje_narudzbe varchar(100),
kolicina int
);

create table igre (
sifra int not null primary key auto_increment,
naziv varchar(300),
verzija varchar(200),
potrebna_memorija int,
maksimalno_igraca int,
konzola int
);

create table konzola (
sifra int not null primary key auto_increment,
naziv varchar(250),
opis varchar(300)
);

create table skladiste (
sifra int not null primary key auto_increment,
kolicina int 
);

create table dodaci (
sifra int not null primary key auto_increment,
naziv varchar(300),
opis varchar(300)
);

alter table narudzbe add foreign key (kupac) references kupac (sifra);
alter table narudzbe add foreign key (proizvod) references proizvod (sifra);
alter table konzola add foreign key (sifra) references proizvod(sifra);
alter table igre add foreign key (sifra) references proizvod(sifra);
alter table igre add foreign key (konzola) references konzola(sifra);
alter table skladiste add foreign key (sifra) references proizvod(sifra);
alter table dodaci add foreign key (sifra) references proizvod(sifra);