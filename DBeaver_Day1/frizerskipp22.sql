drop database if exists frizerskiapp23;
drop database if exists frizerski;
create database frizerskiapp23;
use frizerskiapp23;
create table salon(
sifra int not null primary key auto_increment,
naziv varchar(50) not null,
adresa varchar (50),
djelatnica int
);
create table djelatnica (
sifra int not null primary key auto_increment,
osoba int,
iban varchar(32)
);
create table usluga (
sifra int not null primary key auto_increment,
naziv varchar(100) not null,
cijena decimal(18,2),
trajanje int
);
create table korisnik(
sifra int not null primary key auto_increment,
osoba int
);
create table osoba(
sifra int not null primary key auto_increment,
ime varchar(50),
prezime varchar(50),
oib char(11),
email varchar(100)
);
create table posjet(
korisnik int,
usluga int,
djelatnica int
);
alter table salon add foreign key (djelatnica) references djelatnica(sifra);
alter table korisnik add foreign key (osoba) references osoba(sifra);
alter table djelatnica add foreign key (osoba) references osoba(sifra);
alter table posjet add foreign key (usluga) references usluga(sifra);
alter table posjet add foreign key (korisnik) references korisnik(sifra);
alter table posjet add foreign key (djelatnica) references djelatnica(sifra);