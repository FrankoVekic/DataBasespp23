DROP database IF EXISTS taxi_sluzba;
CREATE database taxi_sluzba;
use taxi_sluzba;

CREATE TABLE taksi_sluzba(
sifra int NOT NULL PRIMARY KEY auto_increment,
naziv varchar(50) NOT NULL,
adresa varchar(50) NOT NULL
);

CREATE TABLE osoba(
sifra int NOT NULL PRIMARY KEY auto_increment,
ime varchar (50) NOT NULL,
prezime varchar(50) NOT NULL
);

CREATE TABLE vozac (
sifra int NOT NULL PRIMARY KEY auto_increment,
iban varchar(32),
oib varchar(11) NOT null,
osoba int not null,
vozilo int not null
);

CREATE TABLE vozilo (
sifra int NOT NULL PRIMARY KEY auto_increment,
registracija varchar(12) NOT NULL,
sjedala int,
taksi_sluzba int not null
);

CREATE TABLE putnik(
sifra int NOT NULL PRIMARY KEY auto_increment,
osoba int not null
);

CREATE TABLE voznja (
sifra int NOT NULL PRIMARY KEY auto_increment,
vozilo int not null,
vozac int not null,
vrijeme_i_datum datetime,
od_do_adresa text,
cijena decimal(18,2)
);

create table voznja_putnik (
voznja int not null,
putnik int not null
);

alter table vozac add foreign key (osoba) references osoba(sifra);
alter table putnik add foreign key (osoba) references osoba(sifra);
alter table vozilo add foreign key (taksi_sluzba) references taksi_sluzba(sifra);
alter table vozac add foreign key (vozilo) references vozilo(sifra);
alter table voznja_putnik add foreign key (voznja) references voznja(sifra);
alter table voznja_putnik add foreign key (putnik) references putnik(sifra);
alter table voznja add foreign key(vozac) references vozac(sifra);