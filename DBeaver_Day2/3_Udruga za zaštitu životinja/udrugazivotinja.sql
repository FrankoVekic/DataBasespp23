drop database if exists udruga_zivotinja;
create database udruga_zivotinja;
use udruga_zivotinja;

create table osoba(
sifra int not null primary key auto_increment,
ime varchar(50) NOT null,
prezime varchar(50) NOT null,
oib int (13),
iban varchar(32)
);

create table briga (
sticenik int not null,
osoba int not null
);

create table sticenik (
sifra int not null primary key auto_increment,
ime varchar(50) NOT null,
zivotinja int NOT null,
prostor int
);

create table zivotinja(
sifra int not null primary key auto_increment,
vrsta varchar(50) NOT null
);

create table prostor(
sifra int not null primary key auto_increment,
soba int not null,
velicina varchar (20) NOT null
);

alter table sticenik  add foreign key (zivotinja) references zivotinja(sifra);
alter table sticenik add foreign key (prostor) references prostor(sifra);
alter table briga add foreign key (osoba) references osoba(sifra);
alter table briga add foreign key (sticenik) references sticenik(sifra);

insert into prostor (soba,velicina) 
values (1,'25m2');
insert into prostor (soba,velicina) 
values (2,'35m2');
insert into prostor (soba,velicina) 
values (3,'45m2');
insert into prostor (soba,velicina) 
values (4,'55m2');

insert into zivotinja(vrsta) values 
('Pas'),
('Mačka'),
('Konj');

insert into sticenik (ime,zivotinja,prostor) values 
('Floki',1,2),
('Mirko',1,2),
('Tiko',2,1),
('Ujo',2,1),
('Billy',3,4),
('Marley',3,4);

insert into osoba (ime,prezime) values 
('Franko','Vekić'),
('Lidija','Lekić'),
('Marko','Marić');

insert into briga (osoba,sticenik) values 
(1,1),
(1,2),
(2,3),
(2,4),
(3,5),
(3,6);

update osoba set ime='Stanko' where sifra=1;
update osoba set prezime='Mirelić' where sifra=2;
delete from briga where osoba=3;


