drop database if exists igraonica;
create database igraonica;
use igraonica;
create table osoba(
sifra int not null primary key auto_increment,
ime varchar(50) not null,
prezime varchar(50) not null,
datumrodenja date not null,
oib char(11)
);

create table djete(
sifra int not null primary key auto_increment,
osoba int not null,
ime_oca varchar(50),
ime_majke varchar(50) 
);

create table teta (
sifra int not null primary key auto_increment,
osoba int not null,
iban varchar(32) not null
);

create table skupina(
sifra int not null primary key auto_increment,
naziv varchar(50) not null,
soba varchar(10),
teta int not null
);

create table igranje(
skupina int not null,
djete int not null
);

alter table djete add foreign key (osoba) references osoba(sifra);
alter table teta add foreign key (osoba) references osoba(sifra);
alter table skupina add foreign key (teta) references teta(sifra);
alter table igranje add foreign key (djete) references djete(sifra);
alter table igranje add foreign key (skupina) references skupina(sifra);

insert into osoba (ime,prezime,datumrodenja) values
('Marina','Marić','1993-05-22'),
('Žaklina','Pavić','1990-01-02'),
('Leona','Perko','1991-11-07'),
('Branislav','Mihaljević','2019-02-01'),
('Erik','Dragović','2020-12-19'),
('Vedran','Ivanković','2019-10-10'),
('Leo','Medved','2018-03-13'),
('Helena','Knežević','2018-05-15'),
('Gojko','Marković','2019-10-09'),
('Vera','Lučić','2020-01-10');
insert into teta (osoba,iban) values 
(1,'HR1823400099428727765'),(2,'HR8424020061372233266'),(3,'HR8224840087666299589');

insert into djete (osoba,ime_majke,ime_oca) values 
(4,'Marija',null),
(5,'Luna',null),
(6,'Nika','Branimir'),
(7,'Ivana','Petar'),
(8,'Nataša','Luka'),
(9,'Karla',null),
(10,null,'Stanko');

insert into skupina (naziv, soba, teta) values 
('Crveni','A2',3),
('Zeleni','C1',2),
('Plavi','B5',1);

insert into igranje (skupina, djete) values 
(1,1),
(1,3),
(1,5),
(2,2),
(2,4),
(3,7),
(3,6);