drop database if exists srednja_skola;
create database srednja_skola;
use srednja_skola;

create table skola (
sifra int not null primary key auto_increment,
naziv varchar(50),
adresa varchar(50),
razred int
);

create table razred (
sifra int not null primary key auto_increment,
razred int(8),
ucenik int,
profesor int
);

create table ucenik(
sifra int not null primary key auto_increment,
osoba int
);

create table osoba (
sifra int not null primary key auto_increment,
ime varchar(50),
prezime varchar(50),
datum_rodenja date,
oib varchar(11)
);

create table profesor(
sifra int not null primary key auto_increment,
osoba int,
iban varchar(32)
);

create table predavanje(
profesor int,
razred int
);


alter table skola add foreign key (razred) references razred(sifra);
alter table razred add foreign key (ucenik) references ucenik(sifra);
alter table ucenik add foreign key (osoba) references osoba(sifra);
alter table profesor add foreign key (osoba) references osoba(sifra);
alter table predavanje add foreign key (profesor) references profesor(sifra);
alter table predavanje add foreign key (razred) references razred(sifra);
