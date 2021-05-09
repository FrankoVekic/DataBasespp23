drop database if exists osnovna_skola;
create database osnovna_skola;
use osnovna_skola;

create table skola(
sifra int not null primary key auto_increment,
naziv varchar(50) not null,
adresa varchar(50) not null,
djeca int,
radionica int
);

create table dijete(
sifra int not null primary key auto_increment,
osoba int
);

create table osoba(
sifra int not null primary key auto_increment,
ime varchar(50),
prezime varchar(50),
datum_rodenja date,
oib varchar(11)
);

create table radionica(
sifra int not null primary key auto_increment,
opis varchar(50) not null,
naziv varchar(50),
dijete int,
uciteljica int
);

create table uciteljica(
sifra int not null primary key auto_increment,
osoba int,
iban varchar(32)
);

create table clan (
dijete int,
radionica int
);

alter table skola add foreign key (radionica) references radionica(sifra);
alter table clan add foreign key (dijete) references dijete(sifra);
alter table clan add foreign key (radionica) references radionica(sifra);
alter table radionica add foreign key (uciteljica) references uciteljica(sifra);
alter table uciteljica add foreign key (osoba) references osoba(sifra);
alter table dijete add foreign key (osoba) references osoba(sifra);
