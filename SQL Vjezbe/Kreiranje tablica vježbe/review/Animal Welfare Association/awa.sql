DROP database IF EXISTS awa;
CREATE database awa;
use awa;


CREATE TABLE employee (
id int NOT NULL PRIMARY KEY auto_increment,
name varchar(30) NOT NULL,
surname varchar(30) NOT NULL,
oib char(11) NOT NULL,
iban varchar(40) NOT NULL
);

CREATE TABLE protege (
id int NOT NULL PRIMARY KEY auto_increment,
name varchar(30) NOT NULL,
animal varchar(30) NOT NULL,
age int,
animal_space int NOT NULL,
);

CREATE TABLE animal_space (
id int NOT NULL PRIMARY KEY auto_increment,
space_size varchar(30) NOT NULL
);


alter table protege add foreign key (care) references employee(id);
alter table protege add foreign key (animal_space) references animal_space(id);