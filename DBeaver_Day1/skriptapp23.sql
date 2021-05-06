drop database if exists edunovapp23;
create database edunovapp23;
use edunovapp23;
create table smjer(
    sifra int NOT null primary key auto_increment,
    naziv varchar(50) NOT null,
    trajanje int null, #NULL se ne mora pisati
    cijena decimal(18,2),
    certifikat boolean
);

#NULL je nepoznavanje vrijednosti

create table grupa(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    smjer int not null,
    predavac int,
    datumpocetka datetime
);

create table polaznik(
    sifra int not null primary key auto_increment,
    osoba int not null,
    brojugovora varchar(50)
);

create table predavac(
    sifra int not null primary key auto_increment,
    osoba int not null,
    iban varchar(32)
);

create table osoba (
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    oib char(11),
    email varchar(100)
);

create table clan(
    grupa int not null,
    polaznik int not null
);

alter table grupa add foreign key (smjer) references smjer(sifra);
alter table grupa add foreign key (predavac) references predavac(sifra);

alter table clan add foreign key (grupa) references grupa(sifra);
alter table clan add foreign key (polaznik) references polaznik(sifra);

alter table predavac add foreign key (osoba) references osoba(sifra);
alter table polaznik add foreign key (osoba) references osoba(sifra);