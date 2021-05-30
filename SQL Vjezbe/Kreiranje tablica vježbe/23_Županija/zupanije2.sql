DROP database IF EXISTS zupanija2;
CREATE database zupanija2;
use zupanija2;

CREATE TABLE zupanija (
sifra int NOT NULL PRIMARY KEY auto_increment,
naziv varchar(50) NOT NULL,
zupan int NOT null
);

CREATE TABLE zupan (
sifra int NOT NULL PRIMARY KEY auto_increment,
ime varchar(50) NOT NULL,
prezime varchar(50) NOT null
);

CREATE TABLE opcina (
sifra int NOT NULL PRIMARY KEY auto_increment,
zupanija int NOT NULL,
naziv varchar(50) NOT null
);

CREATE TABLE grad (
sifra int NOT NULL PRIMARY KEY auto_increment,
zupanija int NOT NULL,
naziv varchar(50) NOT null
);

alter table zupanija add foreign key (zupan) references zupan(sifra);
alter table opcina add foreign key (zupanija) references zupanija(sifra);
alter table grad add foreign key (zupanija) references zupanija(sifra);
insert into zupan (ime,prezime) values 
('Ivan','Anušić'),
('Božo','Galić'),
('Goran','Pauk');

insert into zupanija (naziv, zupan) values 
('Osječko-baranjska županija',1),
('Šibensko-kninska županija',3),
('Vukovarsko-srijemska županija',2);

insert into opcina (naziv, zupanija) values 
('Semeljci',1),
('Draž',1),
('Podgorač',1),
('Gunja',3),
('Cerna',3),
('Lovas',3),
('Kijevo',2),
('Ervenik',2),
('Primošten',2);

insert into grad (zupanija,naziv) values 
(1,'Osijek'),
(1,'Našice'),
(1,'Đakovo'),
(1,'Valpovo'),
(2,'Šibenik'),
(2,'Vodice'),
(2,'Knin'),
(2,'Drniš'),
(3,'Vukovar'),
(3,'Vinkovci'),
(3,'Borovo'),
(3,'Županja');

update grad set naziv ='Beli Manastir' where sifra=2;
update grad set naziv ='Belišće' where sifra=3;
update grad set naziv ='Skradin' where sifra=8;
update grad set naziv ='Tribunj' where sifra=6;
update grad set naziv ='Ilok' where sifra =12;
delete from opcina where sifra>1;