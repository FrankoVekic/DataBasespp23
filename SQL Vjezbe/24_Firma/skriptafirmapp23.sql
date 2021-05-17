drop database if exists firmapp23;
create database firmapp23;
use firmapp23;

create table projekt (
sifra int not null primary key auto_increment,
naziv varchar(50) not null,
cijena decimal (18,2) not null
);

create table programer (
sifra int not null primary key auto_increment,
ime varchar(50) not null,
prezime varchar(50) not null,
datum_rodenja date,
placa decimal (18,2)
);

create table sudjeluje (
projekt int not null,
programer int not null,
datum_pocetka date,
datum_kraja date
);

alter table sudjeluje add foreign key (projekt) references projekt(sifra);
alter table sudjeluje add foreign key (programer) references programer(sifra);

insert into projekt (naziv,cijena) values 
('Robo Projekt',4999.99),
('Space Projekt', 1999.99),
('TeslaX',20000.00);

insert into programer (ime,prezime) values 
('Franko','Vekić'),
('Marin','Marić');

insert into sudjeluje (projekt,programer) values 
(2,1),
(3,2);