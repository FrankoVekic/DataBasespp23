drop database if exists fakultet;
create database fakultet;
use fakultet;

create table student (
sifra int not null primary key auto_increment,
ime varchar(50) not null,
prezime varchar(50) not null,
oib char(11) not null
);

create table rok(
sifra int not null primary key auto_increment,
datum_i_vrijeme datetime not null,
mjesto varchar(50) not null,
trajanje time not null,
student int not null
);

create table kolegij (
sifra int not null primary key auto_increment,
predmet varchar(50) not null
);

create table polaganje (
student int not null,
kolegij int not null,
rok int not null
);

alter table polaganje add foreign key (student) references student(sifra);
alter table polaganje add foreign key (kolegij) references kolegij(sifra);
alter table polaganje add foreign key (rok) references rok(sifra);