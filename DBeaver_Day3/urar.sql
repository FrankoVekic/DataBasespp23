drop database if exists urar;
create database urar;
use urar;
create table urar_silvija(
sifra int not null primary key auto_increment,
adresa varchar(50),
urar int,
segrt int
);
create table osoba(
sifra int not null primary key auto_increment,
ime varchar (50) not null,
prezime varchar(50) not null
);

create table urar (
sifra int not null primary key auto_increment,
osoba int,
iban varchar(32),
posao int
);

create table segrt (
sifra int not null primary key auto_increment,
osoba int,
iban varchar(32),
posao int
);

create table posao (
sifra int not null primary key auto_increment,
opis_posla varchar(1000),
vrijeme_i_datum datetime,
sat int
);

create table korisnik (
sifra int not null primary key auto_increment,
osoba int,
sat int
);

create table sat (
sifra int not null primary key auto_increment,
marka varchar(50),
opis varchar(1000)
);

alter table urar add foreign key (posao) references posao(sifra);
alter table korisnik add foreign key (sat) references sat(sifra);
alter table posao add foreign key (sat) references sat(sifra);
alter table segrt add foreign key (posao) references posao(sifra);
alter table korisnik add foreign key (osoba) references osoba(sifra);
alter table urar add foreign key (osoba) references osoba(sifra);
alter table segrt add foreign key (osoba) references osoba(sifra);
alter table urar_silvija add foreign key(urar) references urar(sifra);
alter table urar_silvija add foreign key (segrt) references segrt(sifra);
