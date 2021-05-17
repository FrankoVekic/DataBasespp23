drop database if exists postolar;
create database postolar;
use postolar;

create table postolar (
sifra int not null primary key auto_increment,
osoba int not null,
datum_rodenja date,
oib varchar(11),
iban varchar(32)
);

create table osoba(
sifra int not null primary key auto_increment,
ime varchar (50) not null,
prezime varchar(50) not null
);

create table korisnik(
sifra int not null primary key auto_increment,
osoba int not null
);

create table segrt(
sifra int not null primary key auto_increment,
osoba int,
datum_rodenja date,
oib varchar(11)
);

create table popravak(
sifra int not null primary key auto_increment,
opis_posla text,
pocetak_popravka datetime,
kraj_popravka datetime,
postolar int not null,
segrt int
);

create table obuca (
sifra int not null primary key auto_increment,
vrsta_obuce varchar(50),
velicina int,
korisnik int not null
);

create table obuca_popravak(
obuca int not null,
popravak int not null
);

alter table postolar add foreign key (osoba) references osoba(sifra);
alter table segrt add foreign key (osoba) references osoba(sifra);
alter table korisnik add foreign key (osoba) references osoba(sifra);
alter table popravak add foreign key (postolar) references postolar(sifra);
alter table obuca add foreign key (korisnik) references korisnik(sifra);
alter table popravak add foreign key (segrt) references segrt(sifra);
alter table obuca_popravak add foreign key (popravak) references popravak(sifra);
alter table obuca_popravak add foreign key (obuca) references obuca(sifra);