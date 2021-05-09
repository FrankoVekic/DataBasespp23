drop database if exists postolar;
create database postolar;
use postolar;

create table postolar_firma (
sifra int not null primary key auto_increment,
naziv varchar(50) not null,
adresa varchar(50) not null,
postolar int,
segrt int

);

create table postolar (
sifra int not null primary key auto_increment,
osoba int,
posao int,
datum_rodenja date,
oib varchar(11)
);

create table osoba(
sifra int not null primary key auto_increment,
ime varchar (50) not null,
prezime varchar(50) not null
);

create table korisnik(
sifra int not null primary key auto_increment,
osoba int,
obuca int
);


create table segrt(
sifra int not null primary key auto_increment,
osoba int,
posao int,
datum_rodenja date,
oib varchar(11)
);

create table posao(
sifra int not null primary key auto_increment,
opis_posla varchar(1000),
vrijeme_posla datetime,
obuca int
);

create table obuca (
sifra int not null primary key auto_increment,
vrsta_obuce varchar(50),
velicina int
);
alter table postolar_firma add foreign key (postolar) references postolar(sifra);
alter table postolar_firma  add foreign key (segrt) references segrt(sifra);
alter table postolar add foreign key (osoba) references osoba(sifra);
alter table postolar add foreign key (posao) references posao(sifra);
alter table segrt  add foreign key (osoba) references osoba(sifra);
alter table segrt add foreign key (posao) references posao(sifra);
alter table korisnik add foreign key (osoba) references osoba(sifra);
alter table korisnik add foreign key (obuca) references obuca(sifra);
alter table posao add foreign key (obuca) references obuca(sifra);
