drop database if exists doktorska_ordinacija;
create database doktorska_ordinacija;
use doktorska_ordinacija;

create table osoba(
sifra int not null primary key auto_increment,
ime varchar(50) not null,
prezime varchar(50) not null,
datum_rodenja date
);

create table pacijent (
sifra int not null primary key auto_increment,
osoba int not null
);

create table doktor(
sifra int not null primary key auto_increment,
osoba int not null,
iban varchar(32) not null
);

create table medicinska_sestra(
sifra int not null primary key auto_increment,
osoba int not null,
iban varchar(32) not null
);

create table lijecenje (
sifra int not null primary key auto_increment,
pacijent int not null,
doktor int not null,
pocetak datetime,
kraj datetime,
opis text 
);

create table lijecenje_medicinske_sestre(
medicinska_sestra int not null,
lijecenje int not null
);

alter table doktor add foreign key (osoba) references osoba(sifra);
alter table medicinska_sestra add foreign key (osoba) references osoba(sifra);
alter table pacijent add foreign key (osoba) references osoba(sifra);
alter table lijecenje add foreign key (doktor) references doktor(sifra);
alter table lijecenje add foreign key (pacijent) references pacijent(sifra);
alter table lijecenje_medicinske_sestre add foreign key (medicinska_sestra) references medicinska_sestra(sifra);
alter table lijecenje_medicinske_sestre add foreign key (lijecenje) references lijecenje(sifra);