DROP DATABASE IF EXISTS beautysalon;
CREATE DATABASE beautysalon;
USE beautysalon;

CREATE TABLE person (
id int NOT NULL PRIMARY KEY auto_increment,
name varchar(30) NOT NULL,
surname varchar(30) NOT NULL
);

CREATE TABLE employee (
id int NOT NULL PRIMARY KEY auto_increment,
person int NOT NULL,
oib char(11) NOT null,
iban varchar(40) NOT NULL
);

CREATE TABLE customer (
id int NOT NULL PRIMARY KEY auto_increment,
person int NOT NULL
);

CREATE TABLE service(
id int NOT NULL PRIMARY KEY auto_increment,
name varchar(50) NOT NULL,
price decimal(18,2) NOT NULL,
duration varchar(20) NOT NULL
);

CREATE TABLE visit (
id int NOT NULL PRIMARY KEY auto_increment,
visit_date datetime NOT NULL,
service int NOT NULL,
customer int NOT NULL,
employee int NOT NULL
);

ALTER TABLE employee ADD FOREIGN KEY (person) REFERENCES person(id);
ALTER TABLE customer ADD FOREIGN KEY (person) REFERENCES person(id);
ALTER TABLE visit ADD FOREIGN KEY (service) REFERENCES service(id);
ALTER TABLE visit ADD FOREIGN KEY (customer) REFERENCES customer(id);
ALTER TABLE visit ADD FOREIGN KEY (employee) REFERENCES employee(id);