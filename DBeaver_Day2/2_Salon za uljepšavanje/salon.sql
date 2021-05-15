drop database if exists salon;
create database salon;
use salon;

create table salon(
sifra int not null primary key auto_increment,
naziv varchar(50) not null,
adresa varchar(50)
);

create table osoba(
sifra int not null primary key auto_increment,
ime varchar(50) not null,
prezime varchar(50) not null
);

create table djelatnica(
sifra int not null primary key auto_increment,
osoba int not null,
oib varchar(11),
iban varchar(32),
salon int
);

create table korisnik(
sifra int not null primary key auto_increment,
osoba int not null
);

create table usluga(
sifra int not null primary key auto_increment,
naziv varchar(50) not null,
cijena decimal (18,2) not null,
trajanje time
);

create table posjet(
korisnik int not null,
djelatnica int not null,
usluga int not null
);

ALTER TABLE djelatnica ADD FOREIGN KEY (salon) REFERENCES salon(sifra);
alter table djelatnica add foreign key (osoba) references osoba(sifra);
alter table korisnik add foreign key (osoba) references osoba(sifra);
alter table posjet add foreign key (korisnik) references korisnik(sifra);
alter table posjet add foreign key (djelatnica) references djelatnica(sifra);
alter table posjet add foreign key (usluga) references usluga(sifra);
insert into osoba (ime,prezime) values 
('Ela','Kolarić'),
('Tereza','Tomčić'),
('Ivo','Šimunović'),
('Lovre','Dragić'),
('Brankica','Stjepanić'),
('Siniša','Knežević'),
('Darko','Horvat');

insert into usluga (naziv, cijena) values 
('Muško šišanje',49.99),
('Žensko šišanje',69.99),
('Žensko šišanje i bojanje',120),
('Muško šišanje i brijanje',70);

insert into djelatnica (osoba, oib, iban) values 
(1,'50466498352','HR3224840081734581127'),
(2,'16519466428','HR4623400096434171197');

insert into korisnik (osoba) values 
(3),(4),(5),(6),(7);

insert into posjet (korisnik,djelatnica,usluga) values 
(4,2,4),
(5,1,1),
(3,2,3);

insert into salon (naziv) values ('Beauty Salon'),('Beauty Salon');

update salon set naziv='Salon Magic';
update osoba set ime='Mirela' where sifra=1;
update osoba set ime='Maria' where sifra=2;
delete from korisnik where sifra=1;