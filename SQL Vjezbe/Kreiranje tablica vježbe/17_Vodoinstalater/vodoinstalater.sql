drop database if exists vodoinstalater;
create database vodoinstalater;
use vodoinstalater;

create table vodoinstalater(
sifra int not null primary key auto_increment,
osoba int not null,
iban varchar(32) not null
);

create table segrt(
sifra int not null primary key auto_increment,
osoba int not null,
iban varchar(32) not null
);

create table osoba (
sifra int not null primary key auto_increment,
ime varchar(50) not null,
prezime varchar(50) not null,
oib char(11) not null,
email varchar(100) not null,
datum_rodenja date not null
);

create table kvar (
sifra int not null primary key auto_increment,
instalacija int not null,
opis_kvara text not null
);

create table popravak (
sifra int not null primary key auto_increment,
kvar int not null,
vodoinstalater int not null,
cijena decimal (18,2),
datum_popravka datetime
);

create table instalacija(
sifra int not null primary key auto_increment,
naziv varchar(50) not null
);

create table posao(
popravak int not null,
kvar int not null,
segrt int
);
alter table posao add foreign key (kvar) references kvar(sifra);
alter table posao add foreign key (popravak) references popravak(sifra);
alter table posao add foreign key (segrt) references segrt(sifra);
alter table popravak add foreign key (vodoinstalater) references vodoinstalater(sifra);
alter table segrt add foreign key (osoba) references osoba(sifra);
alter table vodoinstalater add foreign key (osoba) references osoba(sifra);
alter table kvar add foreign key (instalacija) references instalacija(sifra);