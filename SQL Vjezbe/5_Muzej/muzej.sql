drop database if exists muzejpp23;
create database muzejpp23;
use muzejpp23;

create table muzej (
sifra int not null primary key auto_increment,
naziv varchar(50) not null,
adresa varchar(59)
);

create table izlozba(
sifra int not null primary key auto_increment,
naziv varchar(50) not null,
kustos int not null,
sponzor int not null,
muzej int not null
);

create table djelo(
sifra int not null primary key auto_increment,
naziv varchar(50) not null,
autor varchar(50) not null,
godina date,
izlozba int not null
);

create table kustos(
sifra int not null primary key auto_increment,
ime varchar(50) not null,
prezime varchar(50) not null,
oib varchar(11),
iban varchar(32)
);

create table sponzor(
sifra int not null primary key auto_increment,
naziv varchar(50) not null
);

alter table izlozba add foreign key (muzej) references muzej(sifra);
alter table izlozba add foreign key (kustos) references kustos (sifra);
alter table izlozba add foreign key (sponzor) references sponzor(sifra);
alter table djelo add foreign key (izlozba) references izlozba(sifra);

