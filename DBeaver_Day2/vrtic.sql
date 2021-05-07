drop database if exists vrtic;
create database vrtic;
use vrtic;

create table vrtic(
sifra int not null primary key auto_increment,
naziv varchar(50) not null,
adresa varchar(50),
skupina int
);

create table djete(
sifra int not null primary key auto_increment,
ime varchar(50) not null,
prezime varchar(50) not null,
godina int,
oib varchar(11),
skupina int,
odgojitelj int
);

create table skupina(
sifra int not null primary key auto_increment,
naziv varchar(50) not null,
djete int,
odgojitelj int
);

create table odgojitelj(
sifra int not null primary key auto_increment,
ime varchar(50) not null,
prezime varchar(50) not null,
oib varchar(11),
iban varchar(32),
strucna_sprema int,
skupina int
);

create table strucna_sprema(
sifra int not null primary key auto_increment,
strucna_sprema varchar(20)
);

alter table vrtic add foreign key (skupina) references skupina(sifra);
alter table skupina add foreign key (djete) references djete(sifra);
alter table djete add foreign key (odgojitelj) references odgojitelj(sifra);
alter table odgojitelj add foreign key (strucna_sprema) references strucna_sprema(sifra);




