drop database if exists doktorska_ordinacija;
create database doktorska_ordinacija;
use doktorska_ordinacija;

create table osoba(
sifra int not null primary key auto_increment,
ime varchar(50),
prezime varchar(50),
datum_rodenja date
);

create table pacijent (
sifra int not null primary key auto_increment,
osoba int
);

create table doktor(
sifra int not null primary key auto_increment,
osoba int,
iban varchar(32),
lijecenje int
);

create table medicinska_sestra(
sifra int not null primary key auto_increment,
osoba int
);

create table lijecenje (
sifra int not null primary key auto_increment,
pacijent int,
medicinska_sestra int,
vrijeme datetime
);

alter table doktor add foreign key (lijecenje) references lijecenje(sifra);
alter table lijecenje add foreign key (medicinska_sestra) references medicinska_sestra(sifra);
alter table lijecenje add foreign key (pacijent) references pacijent(sifra);
alter table doktor add foreign key (osoba) references osoba(sifra);
alter table pacijent add foreign key (osoba) references osoba(sifra);
alter table medicinska_sestra add foreign key (osoba) references osoba(sifra);



