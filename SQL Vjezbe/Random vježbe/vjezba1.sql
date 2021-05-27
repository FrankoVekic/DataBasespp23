#Izlistati ime iz tablice osoba, staviti grad 'Zagreb', trenutno vrijeme kao danas 
# da ide uzlazno i da je limitirano na 5 
select * from osoba;
select * from smjer;
select * from grupa;
select * from predavac;
select * from polaznik;
select * from clan;

select ime, 'Zagreb' as grad, now() as danas
from osoba 
where sifra<15
order by ime asc
limit 5;

#Izlistati ime i prezime iz osoba u jednom stupcu kao polaznik
select concat(ime,' ',prezime) as polaznik from osoba;

#Unesi novi smjer Python programiranje minimalnim skupom atributa

insert into smjer (naziv) values ('Python programiranje');

#Unesi novu grupu PP25 na smjer Python programiranje

insert into grupa (naziv,smjer) values ('PP25',3);

#Unesi Marina Markovića kao predavača grupi PP25

insert into osoba (ime,prezime) values ('Marin','Marković');
insert into predavac (osoba) values (20);
update grupa set predavac = 3 where naziv ='PP25';

#Unesi novu osobu te ju unesi u grupu JP24, nakon toga odabrati sve polaznike koji ne idu na PP23.
insert into osoba (ime,prezime) values ('Dario','Barić');
insert into polaznik (osoba) values (21);
insert into clan (grupa,polaznik) values (2,18);

select a.osoba 
from polaznik a 
left join clan b on b.polaznik= a.sifra 
left join grupa c on c.sifra = b.grupa 
where b.grupa !=1;

#Odabrati naziv iz smjer kao smjer, naziv iz grupa kao grupa te napraviti stupac predavač i polaznik
#i ubaciti njihova imena i prezimena 
#bez predavača
select b.naziv as grupa, a.naziv as smjer,
concat (e.ime,' ',e.prezime) as polaznik
from smjer a 
inner join grupa b on b.smjer =a.sifra 
inner join clan c on c.grupa =b.sifra 
inner join polaznik d on d.sifra =c.polaznik 
inner join osoba e on e.sifra = d.osoba 
where b.sifra = 1;
#sa predavačem
update grupa set predavac=1 where sifra=1;
select a.naziv, b.naziv,
concat (d.ime,' ',d.prezime) as predavac,
concat (g.ime,' ',g.prezime) as polaznik
from grupa a 
inner join smjer b on b.sifra = a.smjer 
inner join predavac c on c.sifra =a.predavac 
inner join osoba d on d.sifra =c.osoba 
inner join clan e on e.grupa =a.sifra 
inner join polaznik f on f.sifra =e.polaznik 
inner join osoba g on g.sifra =f.osoba 
where a.naziv ='PP23';


#Dodati trajanje u smjeru 'PHP programer' te dodati cijenu na bilo koji način
update smjer a 
inner join grupa b on b.smjer =a.sifra 
inner join clan c on c.grupa =b.sifra 
set a.trajanje = abs(-150), a.cijena = a.trajanje * 100
where c.polaznik =1;
#Suma cijena svih smjerova
select  sum(a.cijena)
from smjer a;

#Baza classicmodels

select * from productlines;
select * from products;
select * from employees;
select * from orders;
select * from orderdetails;

# Odaberi sve podređene zaposlenike od Patterson Mary
select * from employees where firstName = 'Mary';
select firstName, lastName from employees where reportsTo = 1056;

# Odaberite sve podređene zaposlenike od Bondur Gerard
select * from employees where firstName = 'Gerard';
select firstName, lastName from employees where reportsTo =1102;

# Obrišite 1985 Toyota Supra
select * from products where productName like '%toyota%';
delete from products where productCode = 'S18_3233';

#odaberite sve proizvode koji nisu niti na jednoj narudžbi
select * from products where productCode not in 
(select distinct productCode from orderdetails );

# Na koji datum narudžbe je prodan najjeftiniji proizvod?

select a.priceEach, b.orderDate 
from orderdetails a 
inner join orders b on b.orderNumber = a.orderNumber 
where a.priceEach = (select min (a2.priceEach) from orderdetails a2);

# odaberite sve proizvode koje je prodala Leslie Jennings

select * from employees;

select distinct e.productName 
from employees a 
inner join customers b on b.salesRepEmployeeNumber = a.employeeNumber 
inner join orders c on c.customerNumber = b.customerNumber 
inner join orderdetails d on d.orderNumber = c.orderNumber 
inner join products e on e.productCode = d.productCode 
where a.firstName = 'Leslie' and a.lastName = 'Jennings';