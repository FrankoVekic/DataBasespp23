select a.country as Country, concat(d.first_name,' ', d.last_name) as Person 
from country a 
inner join city b on a.country_id = b.country_id 
inner join address c on c.city_id = b.city_id 
inner join staff d on d.address_id = c.address_id;

describe country;

insert into country (country) values ('Croatia');

select * from country order by country_id desc;

describe city;

insert into city (city,country_id) values ('Osijek',110);

select * from city order by 1 desc;

describe address;

insert into address (address,district,city_id,phone) values ('Ulica Pere Perića','Osiječko-Baranjska',601,'0959231232');

select * from address order by 1 desc limit 1;

describe staff;

insert into staff (first_name,last_name,address_id,store_id,username) values ('Franko','Vekić',606,1,'Frankov');

select * from store;

select * from staff where first_name like '%Franko%';

select count(*) from customer;

select distinct first_name from customer;

#599
select first_name from customer;

select first_name, count(*) 
from customer
where first_name like '%a%'
group by first_name
having count(*) > 1;

create table osoba
select first_name,last_name from customer
union
select first_name,last_name from staff;

select * from osoba where last_name like 'Ve%';

# Change data to uppper case
update osoba set first_name = upper(first_name), last_name=upper(last_name);


select * from grupa;

select * from predavac;

describe osoba;

insert into osoba (ime,prezime) values ('Pavle', 'Vidaković');

select * from osoba order by sifra desc limit 1;

insert into predavac (osoba) values (26);

select b.ime, b.prezime 
from predavac a inner join osoba b on a.osoba = b.sifra
where a.sifra not in (select predavac from grupa where predavac is not null);


#sakila baza

select *, datediff(return_date,rental_date) from rental where return_date is not null; 


select a.first_name, a.last_name, sum(datediff(b.return_date,b.rental_date)*d.rental_rate) as ukupno,
avg(datediff(b.return_date,b.rental_date)) as prosjekdana
from customer a
inner join rental b on a.customer_id = b.customer_id 
inner join inventory c on b.inventory_id = c.inventory_id 
inner join film d on c.film_id = d.film_id 
group by a.first_name, a.last_name
having ukupno>700
order by 3 desc;


select distinct d.film_id as ID, d.title as Naziv
from customer a 
inner join rental b on b.customer_id = a.customer_id 
inner join inventory c on c.inventory_id = b.inventory_id 
inner join film d on d.film_id = c.film_id 
where a.first_name = 'RHONDA';