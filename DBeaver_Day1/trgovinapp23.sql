drop database if exists trgovina;
create database trgovina;
use trgovina;

create table stavka(
racun int not null,
proizvod int,
kolicina decimal(18,2)
);

create table racun(
sifra int not null primary key auto_increment,
datum datetime,
rednibroj varchar(100),
operater int not null
);

create table operater(
sifra int not null primary key auto_increment,
ime varchar(50) not null,
prezime varchar(50) not null,
email varchar(50)
);

create table proizvod(
sifra int not null primary key auto_increment,
naziv varchar(50) not null,
cijena decimal(18,2)
);


alter table stavka add foreign key (proizvod) references proizvod(sifra);
alter table stavka add foreign key (racun) references racun(sifra);

alter table racun add foreign key (operater) references operater(sifra);
