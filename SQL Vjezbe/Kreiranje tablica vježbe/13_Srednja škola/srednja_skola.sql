drop database if exists srednja_skola;
create database srednja_skola;
use srednja_skola;

create table skola (
sifra int not null primary key auto_increment,
naziv varchar(50) NOT null,
adresa varchar(50) NOT null
);

create table razred (
sifra int not null primary key auto_increment,
naziv varchar(4) not null,
razred int(8) not null,
skola int not null
);

create table ucenik(
sifra int not null primary key auto_increment,
osoba int not null,
razred int not null
);

create table osoba (
sifra int not null primary key auto_increment,
ime varchar(50) not null,
prezime varchar(50) not null,
datum_rodenja date,
oib varchar(11) not null
);

create table profesor(
sifra int not null primary key auto_increment,
osoba int not null,
iban varchar(32) not null
);

create table predavanje(
profesor int not null,
razred int not null,
pocetak datetime,
kraj datetime
);

alter table ucenik add foreign key (osoba) references osoba(sifra);
alter table profesor add foreign key (osoba) references osoba(sifra);
alter table razred add foreign key (skola) references skola(sifra);
alter table ucenik add foreign key (razred) references razred(sifra);
alter table predavanje add foreign key (profesor) references profesor(sifra);
alter table predavanje add foreign key (razred) references razred(sifra);
