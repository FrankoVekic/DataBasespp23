drop database if exists restoran;
create database restoran;
use restoran;


create table restoran(
sifra int not null primary key auto_increment,
naziv varchar(50) not null,
adresa varchar(50) not null,
jelovnik int
);

create table jelovnik (
sifra int not null primary key auto_increment,
stranice int(30) not null,
kategorija int not null
);

create table kategorija(
sifra int not null primary key auto_increment,
naziv varchar(50) not null,
jelo int not null
);

create table jelo(
sifra int not null primary key auto_increment,
naziv varchar(50) not null,
pice int not null,
cijena decimal(14,2) not null
);

create table pice(
sifra int not null primary key auto_increment,
naziv varchar(50),
kolicina int not null,
cijena decimal(14,2) not null
);

create table narudzba(
pice int not null,
jelo int not null
);

alter table jelovnik add foreign key (kategorija) references kategorija(sifra);
alter table kategorija add foreign key (jelo) references jelo(sifra);
alter table narudzba add foreign key (pice) references pice(sifra);
alter table narudzba add foreign key (jelo) references jelo(sifra);
alter table restoran add foreign key (jelovnik) references jelovnik(sifra);

