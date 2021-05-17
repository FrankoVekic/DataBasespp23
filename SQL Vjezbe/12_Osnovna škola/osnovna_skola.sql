drop database if exists osnovna_skola;
create database osnovna_skola;
use osnovna_skola;

create table djete(
sifra int not null primary key auto_increment,
osoba int not null,
ime_majke varchar(50),
ime_oca varchar(50),
tel_majke int,
tel_oca int
);

create table osoba(
sifra int not null primary key auto_increment,
ime varchar(50) not null,
prezime varchar(50) not null,
datum_rodenja date not null,
oib varchar(11) not null
);

create table radionica(
sifra int not null primary key auto_increment,
opis text not null,
naziv varchar(50) not null,
uciteljica int not null
);

create table uciteljica(
sifra int not null primary key auto_increment,
osoba int not null,
iban varchar(32) not null
);

create table radionica_djete(
djete int not null,
radionica int not null
);

alter table radionica add foreign key (uciteljica) references uciteljica(sifra);
alter table uciteljica add foreign key (osoba) references osoba(sifra);
alter table djete add foreign key (osoba) references osoba(sifra);
alter table radionica_djete add foreign key (djete) references djete(sifra);
alter table radionica_djete add foreign key (radionica) references radionica(sifra);
