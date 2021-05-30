drop database if exists zupanija;
create database zupanija;
use zupanija;
create table zupanija(
sifra int not null primary key auto_increment,
naziv varchar(50) not null,
zupan varchar(50) not null
);
create table opcina(
sifra int not null primary key auto_increment,
zupanija int not null,
naziv varchar(50) not null
);
alter table opcina add foreign key (zupanija) references zupanija(sifra);
insert into zupanija (naziv,zupan) values
('Osječko baranjska županija','Ivan Anušić'),
('Virovitičko-podravska županija','Igor Andrović'),
('Varaždinska županija','Radimir Čačić');
insert into opcina(zupanija,naziv) values 
(1,'Antunovac'),
(1,'Bilje'),
(1,'Bizovac'),
(1,'Darda'),
(1,'Donja Motičina'),
(1,'Vuka'),
(2,'Čaćinci'),
(2,'Mikleuš'),
(2,'Nova Bukovica'),
(2,'Pitomača'),
(2,'Suhopolje'),
(2,'Sopje'),
(3,'Cestica'),
(3,'Donja Voća'),
(3,'Martijanec'),
(3,'Gornji Kneginec'),
(3,'Jalžabet'),
(3,'Klenovnik');