drop database if exists vrtic;
create database vrtic;
use vrtic;

create table vrtic(
sifra int not null primary key auto_increment,
naziv varchar(50) not null,
adresa varchar(50) not null
);

create table osoba(
sifra int not null primary key auto_increment,
ime varchar(50) not null,
prezime varchar(50) not null,
oib varchar(11)
);

create table djete(
sifra int not null primary key auto_increment,
datum_rodenja date not null,
ime_majke varchar(50),
ime_oca varchar(50),
broj_majke int,
broj_oca int,
skupina int not null,
osoba int not null
);

create table skupina(
sifra int not null primary key auto_increment,
naziv varchar(50) not null,
odgojitelj int not null,
vrtic int not null
);

create table odgojitelj(
sifra int not null primary key auto_increment,
iban varchar(32),
strucna_sprema int not null,
osoba int not null
);

create table strucna_sprema(
sifra int not null primary key auto_increment,
strucna_sprema varchar(50) not null
);

alter table skupina add foreign key (vrtic) references vrtic(sifra);
alter table djete add foreign key (skupina) references skupina(sifra);
alter table skupina add foreign key (odgojitelj) references odgojitelj(sifra);
alter table odgojitelj add foreign key (strucna_sprema) references strucna_sprema(sifra);
alter table odgojitelj add foreign key (osoba) references osoba(sifra);
alter table djete add foreign key (osoba) references osoba(sifra); 
insert into vrtic (naziv,adresa) values 
('Bubamara','Kapucinska 5');

insert into strucna_sprema (strucna_sprema) values
('Niska stručna sprema'),
('Srednja stručna sprema'),
('Visoka stručna sprema'),
('Viša stručna sprema');

insert into osoba (ime,prezime,oib) values 
('Vlatka','Petrić','20985779522'),
('Andrea','Matić','28537123825'),
('Veronika','Lovrić','10008034590'),
('Silvijo','Jerković','42013718117'),
('Ljiljana','Mihaljević','84169889014'),
('Zrinka','Blažević','28291232160'),
('Ljerka','Nikolić','78768473502'),
('Blaž','Stojanović','73338393714'),
('Maja','Ilić','01130038228'),
('Anamarija','Vlašić','20809992495');

insert into odgojitelj (osoba,strucna_sprema,iban) values 
(1,3,'HR4023600004153312961'),
(3,4,'HR1124840088119743954'),
(2,2,'HR5424020066923678636');

insert into skupina (naziv,odgojitelj,vrtic) values 
('Crveni',3,1),
('Plavi',1,1),
('Zeleni',2,1);

insert into djete (osoba,ime_majke,ime_oca,broj_majke,broj_oca,skupina,datum_rodenja) values 
(4,'Smiljana','Slavko',0919820212,0918765672,1,'2018-03-21'),
(5,'Dijana','Alen',0952199932,0982415123,3,'2019-05-01'),
(6,null,'Miroslav',null,0952133112,1,'2019-11-10'),
(7,'Marija','Marin',0912581944,0919430015,2,'2017-01-05'),
(8,'Katarina',null,0919820212,null,2,'2018-12-07'),
(9,'Brigita','Matija',0988207325,0982515511,1,'2018-06-12'),
(10,'Žana',null,0919820212,null,3,'2017-09-13');

update djete set ime_majke='Diana' where sifra=2;
update osoba set ime ='Mirjana' where sifra=3;
delete from djete where sifra>5;
