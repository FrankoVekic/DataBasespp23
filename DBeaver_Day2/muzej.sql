drop database if exists muzejpp23;
create database muzejpp23;
use muzejpp23;

create table muzej (
sifra int not null primary key auto_increment,
naziv varchar(50) not null,
adresa varchar(59),
izlozba int 
);

create table izlozba(
sifra int not null primary key auto_increment,
naziv varchar(50) not null,
djela int,
sponzor int
);

create table djela(
sifra int not null primary key auto_increment,
naziv varchar(50),
godina varchar(50)
);

create table kustos(
sifra int not null primary key auto_increment,
ime varchar(50),
prezime varchar(50),
oib varchar(11),
iban varchar(32),
izlozba int
);

create table sponzor(
sifra int not null primary key auto_increment,
naziv varchar(50)
);


alter table muzej add foreign key (izlozba) references izlozba(sifra);
alter table izlozba add foreign key (djela) references djela(sifra);
alter table kustos add foreign key (izlozba) references izlozba(sifra);
alter table izlozba add foreign key (sponzor) references sponzor(sifra);

