drop database if exists trgovacki_centar;
create database trgovacki_centar;
use trgovacki_centar;

create table trgovacki_centar(
sifra int not null primary key auto_increment,
naziv varchar(50) not null,
adresa varchar(50) not null
);

create table osoba (
sifra int not null primary key auto_increment,
ime varchar(50) not null,
prezime varchar(50) not null,
datum_rodenja date not null,
oib varchar(11) not null
);

create table trgovina(
sifra int not null primary key auto_increment,
naziv varchar(50) not null,
prostor decimal(18,2) not NULL,
sef int not null,
trgovacki_centar int not null
);

create table sef(
sifra int not null primary key auto_increment,
osoba int not null,
iban varchar(32) not null
);

create table radnik(
sifra int not null primary key auto_increment,
osoba int not null,
trgovina int not null
);
create table rad(
radnik int not null,
trgovina int not null
);

alter table trgovina add foreign key (trgovacki_centar) references trgovacki_centar(sifra);
alter table radnik add foreign key (osoba) references osoba(sifra);
alter table trgovina add foreign key (sef) references sef(sifra);
alter table sef add foreign key (osoba) references osoba(sifra);
alter table rad add foreign key (radnik) references radnik(sifra);
alter table rad add foreign key (trgovina) references trgovina(sifra);