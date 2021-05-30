drop database if exists urar;
create database urar;
use urar;

create table osoba(
sifra int not null primary key auto_increment,
ime varchar (50) not null,
prezime varchar(50) not null
);

create table urar (
sifra int not null primary key auto_increment,
osoba int NOT null,
iban varchar(32) NOT null
);

create table segrt (
sifra int not null primary key auto_increment,
osoba int not null,
iban varchar(32) NOT null
);

create table korisnik (
sifra int not null primary key auto_increment,
osoba int not null
);

create table sat (
sifra int not null primary key auto_increment,
marka varchar(50),
korisnik int not null
);

create table popravak (
sifra int not null primary key auto_increment,
urar int not null,
segrt int,
opis_popravka text,
cijena decimal (18,2)
);

create table popravak_sat (
popravak int not null,
sat int not null,
pocetak_popravka datetime,
kraj_popravka datetime
);

alter table urar add foreign key (osoba) references osoba(sifra);
alter table korisnik add foreign key (osoba) references osoba(sifra);
alter table segrt add foreign key (osoba) references osoba(sifra);
alter table popravak add foreign key (segrt) references segrt(sifra);
alter table popravak add foreign key (urar) references urar (sifra);
alter table sat add foreign key (korisnik) references korisnik(sifra);
alter table popravak_sat add foreign key (popravak) references popravak(sifra);
alter table popravak_sat add foreign key (sat) references sat(sifra);
