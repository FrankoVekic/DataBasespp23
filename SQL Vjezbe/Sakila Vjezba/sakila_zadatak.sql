#Dodati novi grad u državu Brazil
show tables;

#Tražim country id od Brazila kako bih mogao pronaći koji gradovi su upisani
select * from country;
#Vidim da nema Sao Paulo
select * from city where country_id =15;

#Ubacujem novi grad (Sao Paulo)
insert into city (city,country_id,last_update) values ('Sao Paulo',15,'2006-02-15 04:45:25');

#Obrisati grad Callao

#Pronalazim id od grada Callao
select * from city where city like 'Callao';
#Prvo moram iz svih child tablica obrisat podatke da bi mogao u city tablici obrisati grad
#Tu pronalazim podatke koje trebam brisati
select * from address where city_id =99;
select * from customer where address_id =309;
select * from payment where customer_id =304;
select * from rental where customer_id =304;
#Brišem podatke
#5izvesti
delete from city where city_id = 99;
#4 izvesti
delete from address where address_id = 309;
#3 izvesti
delete from customer where customer_id =304;
#2 izvesti
delete from payment where customer_id =304;
#1 izvesti
delete from rental where customer_id =304;