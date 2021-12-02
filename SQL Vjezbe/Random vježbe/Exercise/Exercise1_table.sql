DROP database IF EXISTS primjer1;
CREATE database primjer1;
use primjer1;

CREATE TABLE muskarac(
id int NOT NULL PRIMARY KEY auto_increment,
maraka decimal(17,7) NOT NULL,
hlace varchar(45) NOT NULL,
prstena int NOT NULL,
nausnica int,
neprijateljica int NOT NULL
);

CREATE TABLE neprijateljica(
id int NOT NULL PRIMARY KEY auto_increment,
indiferentno tinyint(1) NOT NULL,
modelnaocala varchar(39) NOT NULL,
maraka decimal(12,10) NOT NULL,
kratkamajica varchar(32) NOT NULL,
ogrlica int
);

CREATE TABLE sestra (
id int NOT NULL PRIMARY KEY auto_increment,
introvertno tinyint(1) NOT NULL,
carape varchar(41),
suknja varchar(40),
narukvica int NOT null
);

CREATE TABLE punac(
id int NOT NULL PRIMARY KEY auto_increment,
modelnaocala varchar(39),
treciputa datetime,
drugiputa datetime,
novcica decimal(14,6) NOT NULL,
narukvica int
);

CREATE TABLE zarucnica (
id int NOT NULL PRIMARY KEY auto_increment,
stilfrizura varchar(40),
prstena int NOT NULL,
gustoca decimal(14,5),
modelnaocala varchar(35) NOT NULL,
nausnica int NOT null
);

ALTER TABLE muskarac ADD FOREIGN KEY (neprijateljica) REFERENCES neprijateljica(id);
