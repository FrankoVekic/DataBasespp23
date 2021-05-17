DROP database IF EXISTS klubcitatelja;
CREATE database klubcitatelja;
use klubcitatelja;

CREATE TABLE clan (
sifra int NOT NULL PRIMARY KEY auto_increment,
ime varchar(50) NOT NULL,
prezime varchar(50) NOT NULL,
oib varchar(11),
datumrodenja date NOT null
);

CREATE TABLE citanje (
sifra int NOT NULL PRIMARY KEY auto_increment,
clan int NOT NULL,
knjiga int NOT NULL,
vrijeme_pocetka datetime,
vrijeme_zavrsetka datetime
);

CREATE TABLE knjiga(
sifra int NOT NULL PRIMARY KEY auto_increment,
naziv varchar(50) NOT null,
vlasnik int not null
);

create table vlasnik (
sifra int not null primary key auto_increment,
clan int not null
);

alter table citanje add foreign key (clan) references clan(sifra);
alter table citanje add foreign key (knjiga) references knjiga(sifra);
alter table vlasnik add foreign key (clan) references clan(sifra);
alter table knjiga add foreign key (vlasnik) references vlasnik(sifra);

insert into clan (ime,prezime,datumrodenja) values
('Anja','Tomčić','1995-04-11'),
('Pavle','Lončar','1998-12-25'),
('Emanuel','Perković','1995-10-02'),
('Marija','Jerković','2000-07-21'),
('Maja','Dragović','1991-08-20');

insert into vlasnik (clan) values 
(3),(1);

insert into knjiga (naziv,vlasnik) values
('Cronicles',2),
('World outside ours',1),
('Help people in need',2);

insert into citanje (clan,knjiga) values 
(4,1),
(5,2),
(1,3);

update knjiga set naziv='Magic book 2' where sifra=1;
update clan set ime ='Branko' where sifra =4;
delete from citanje where sifra>2;