drop database if exists odvjetnik;
create database odvjetnik;
use odvjetnik;

create table odvjetnik (
sifra int not null primary key auto_increment,
osoba int not null,
iban varchar(32) not null
);

create table klijent (
sifra int not null primary key auto_increment,
osoba int
);

create table suradnik (
sifra int not null primary key auto_increment,
osoba int
);

create table osoba(
sifra int not null primary key auto_increment,
ime varchar(50) not null,
prezime varchar(50) not null,
datumrodenja date not null,
email varchar(50),
oib char(11)
);

create table obrana(
odvjetnik int,
suradnik int,
klijent int,
datumvrijeme datetime,
cijena decimal(18,2)
);

alter table odvjetnik add foreign key (osoba) references osoba(sifra);
alter table klijent add foreign key (osoba) references osoba(sifra);
alter table suradnik add foreign key (osoba) references osoba(sifra);
alter table obrana add foreign key (odvjetnik) references odvjetnik(sifra);
alter table obrana add foreign key (klijent) references klijent(sifra);
alter table obrana add foreign key (suradnik) references suradnik(sifra);

insert into osoba (ime,prezime,datumrodenja)
values 
('Pero','Perić','1985-03-21'),
('Marko','Marić','1980-01-02'),
('Luka','Lukić','1995-08-20'),
('Iva','Ivić','1985-07-15'),
('Marta','Martić','1992-05-10'),
('Mirko','Mirić','1992-05-10');

insert into odvjetnik (osoba,iban) values (1,'HR94 4115 0081 0111 1111 6'),(6,'HR94 4115 0081 01231 1000 2');
insert into klijent (osoba) values (4),(5);
insert into suradnik (osoba) values (2),(3);
insert into obrana (odvjetnik,suradnik,klijent,cijena) 
values
(2,2,1,9999.99),(1,1,2,2000.00);


