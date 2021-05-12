drop database if exists salon;
create database salon;
use salon;

create table salon(
sifra int not null primary key auto_increment,
naziv varchar(50) not null,
adresa varchar(50),
djelatnica int
);

create table osoba(
sifra int not null primary key auto_increment,
ime varchar(50) not null,
prezime varchar(50) not null
);

create table djelatnica(
sifra int not null primary key auto_increment,
osoba int not null,
oib varchar(11),
iban varchar(32)
);

create table korisnik(
sifra int not null primary key auto_increment,
osoba int
);

create table usluga(
sifra int not null primary key auto_increment,
naziv varchar(50) not null,
cijena decimal (18,2),
trajanje datetime
);

create table posjet(
korisnik int,
djelatnica int,
usluga int
);

alter table salon add foreign key (djelatnica) references djelatnica(sifra);
alter table djelatnica add foreign key (osoba) references osoba(sifra);
alter table korisnik add foreign key (osoba) references osoba(sifra);
alter table posjet add foreign key (korisnik) references korisnik(sifra);
alter table posjet add foreign key (djelatnica) references djelatnica(sifra);
alter table posjet add foreign key (usluga) references usluga(sifra);