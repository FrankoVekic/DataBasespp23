drop database if exists samostanpp23;
create database samostanpp23;
use samostanpp23;

create table samostan(
sifra int not null primary key auto_increment,
naziv varchar(50),
adresa varchar(50)
);

create table osoba (
sifra int not null primary key auto_increment,
ime varchar(50) not null,
prezime varchar(50) not null,
oib varchar(11),
datum_rodenja date,
samostan int not null
);


create table svecenik(
sifra int not null primary key auto_increment,
osoba int not null,
nadredeni_svecenik int not null
);

create table posao(
sifra int not null primary key auto_increment,
naziv varchar(50) not null,
opis text
);

create table nadredeni_svecenik(
sifra int not null primary key auto_increment,
osoba int not null
);

create table posao_svecenik (
svecenik int not null,
posao int not null
);

alter table svecenik add foreign key (osoba) references osoba(sifra);
alter table nadredeni_svecenik add foreign key (osoba) references osoba(sifra);
alter table osoba add foreign key (samostan) references samostan(sifra);
alter table posao_svecenik add foreign key (posao) references posao(sifra);
alter table posao_svecenik add foreign key (svecenik) references svecenik(sifra);
alter table svecenik add foreign key (nadredeni_svecenik) references nadredeni_svecenik(sifra);
