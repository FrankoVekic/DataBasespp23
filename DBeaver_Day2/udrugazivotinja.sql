drop database if exists udruga_zivotinja;
create database udruga_zivotinja;
use udruga_zivotinja;

create table udruga(
sifra int not null primary key auto_increment,
naziv varchar (50) not null,
adresa varchar (50) not null,
grad varchar (50),
osoba int
);

create table osoba(
sifra int not null primary key auto_increment,
ime varchar(50),
prezime varchar(50),
oib int (13),
iban varchar(32),
sticenik int 
);

create table sticenik (
sifra int not null primary key auto_increment,
zivotinja int,
prostor int
);

create table zivotinja(
sifra int not null primary key auto_increment,
ime varchar(50),
vrsta varchar(50)
);

create table prostor(
sifra int not null primary key auto_increment,
velicina int
);

alter table udruga add foreign key (osoba) references osoba(sifra);
alter table sticenik  add foreign key (zivotinja) references zivotinja(sifra);
alter table sticenik add foreign key (prostor) references prostor(sifra);
alter table osoba add foreign key (sticenik) references sticenik(sifra);

