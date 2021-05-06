drop database if exists edunovapp23;
create database frizerskiapp23;
use frizerskiapp23;

create table salon(
sifra int not null primary key auto_increment,
naziv varchar(50) not null,
adresa varchar (50),
);

create table djelatnica (
sifra int not null primary key auto_increment,
ime varchar(50),
prezime varchar(50),
oib char(11),
email varchar(100)
);

create table usluga (
sifra int not null primary key auto_increment,
naziv varchar(100),
cijena decimal(18,2),
trajanje int
);

create table korisnik(
sifra int not null primary key auto_increment,
ime varchar(50),
prezime varchar (50),
);