DROP database IF EXISTS taxi_sluzba;
CREATE database taxi_sluzba;
use taxi_sluzba;

CREATE TABLE taksi_tvrtka(
sifra int NOT NULL PRIMARY KEY auto_increment,
naziv varchar(50) NOT NULL,
adresa varchar(50) NOT NULL,
vozilo int
);

CREATE TABLE vozac (
sifra int NOT NULL PRIMARY KEY auto_increment,
iban varchar(32),
osoba int,
vozilo int
);

CREATE TABLE osoba(
sifra int NOT NULL PRIMARY KEY auto_increment,
ime varchar (50) NOT NULL,
prezime varchar(50) NOT NULL,
oib varchar(11) NOT NULL
);

CREATE TABLE vozilo (
sifra int NOT NULL PRIMARY KEY auto_increment,
registracija varchar(15) NOT NULL,
sjedala int
);

CREATE TABLE putnik(
sifra int NOT NULL PRIMARY KEY auto_increment,
osoba int,
voznja int
);

CREATE TABLE voznja (
sifra int NOT NULL PRIMARY KEY auto_increment,
vozilo int,
vozac int,
vrijeme_i_datum datetime not null,
broj_putnika int
);


alter table taksi_tvrtka add foreign key (vozilo) references vozilo(sifra);
alter table vozac add foreign key (vozilo) references vozilo(sifra);
alter table voznja add foreign key (vozac) references vozac(sifra);
alter table voznja add foreign key (vozilo) references vozilo(sifra);
alter table vozac  add foreign key (osoba) references osoba(sifra);
alter table putnik  add foreign key (osoba) references osoba(sifra);
alter table putnik  add foreign key (voznja) references voznja(sifra);


