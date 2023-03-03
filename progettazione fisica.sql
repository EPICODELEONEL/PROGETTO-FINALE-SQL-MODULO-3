CREATE DATABASE INT_UNI;
use INT_UNI;
CREATE TABLE studente
(matricola int primary key auto_increment,
nome varchar(128)not null,
citta varchar(128) not null) engine = innodb;
create table docente
(matricola int primary key auto_increment,
nome varchar(128) not null);
create table corso 
(codice int not null ,
nome varchar(128) not null,
matricola_docente int,
primary key(codice),
FOREIGN KEY (matricola_docente) REFERENCES docente(matricola)
) engine=innodb;

create table esame
(codice int not null,
primary key (codice),
matricola_studente int,
foreign key(matricola_studente) references studente(matricola),
data_esame date,
voto int not null,
settore_scientifico varchar(128) not null);


create table dipartimento
(codice_dipartimento int primary key auto_increment,
nome_dipartimento varchar(128) not null,
settore_scientifico varchar(100) not null);

alter table dipartimento
add column matricola_docente int;


create table concorso_master
(codice_master int not null,
primary key(codice_master),
codice_dipartimento int,
foreign key(codice_dipartimento) references dipartimento(codice_dipartimento),
data_pubblicazione date,
data_scadenza date,
num_posti_disponibili int not null);

create table partecipa_corsomaster
(codice_dipartimento int not null,
codice_master int,
foreign key(codice_master) references concorso_master(codice_master),
matricola_studente int,
foreign key(matricola_studente) references studente(matricola),
data_domanda date);
alter table partecipa_corsomaster modify matricola_studente int not null ;


insert into studente(matricola,nome,citta)
values(1,'marco','roma'),	
(2,'marta','napoli'),	
(3,'laura','verona'),	
(4,'mackenzi','bari'),	
(5,'bettanny','empoli'),	
(6,'layla','lisbona'),	
(7,'david','madrid'),	
(8,'marta','tokyo'),	
(9,'kasak','rio'),	
(10,'rolland','helsinki'),	
(11,'trevor','amsterdam'),	
(12,'kayla','los angeles'),	
(13,'ceddy','miami'),	
(14,'bridget','ohio'),	
(15,'michael','new york'),	
(16,'briston','new jersey'),	
(17,'malik','oregon'),	
(18,'chad','laos'),	
(19,'andrew','saigon'),	
(20,'tristan','cebu');	
 
 insert into docente(matricola,nome)
 values(311,'tiffany'),
(422,'alessandra'),
(533,'nerisa'),
(644,'blanco'),
(755,'victor'),
(866,'selena'),
(977,'taylor'),
(1088,'freddy'),
(1199,'gerard'),
(1310,'anna'),
(1421,'steven'),
(1532,'jason'),
(1643,'henry'),
(1754,'loka'),
(1865,'luke'),
(1976,'sinatra'),
(2087,'kevin'),
(2198,'joe'),
(2309,'franco'),
(2420,'duwo');


insert into corso(codice,nome,matricola_docente)
values(111,'dataanalyst',311),
(222,'cybersecurity',422),
(333,'web developer',533),
(444,'cloud engineer',644),
(555,'java',755),
(666,'sq',866),
(777,'mongol',977),
(888,'phyton',1088),
(999,'javascript',1199),
(1110,'r',1310),
(1221,'googlestudio',1421),
(1332,'power bi',1532),
(1443,'aws',1643),
(1554,'microsoft azzure',1754),
(1665,'mongoldb',1865),
(1776,'cplus',1976),
(1887,'ion',2087),
(1998,'html',2198),
(2109,'css',2309),
(2220,'xml',2420);





insert into esame(codice,matricola_studente,data_esame,voto,settore_scientifico)
values(1001,1,'2015-05-02',25,'informatica'),
(1002,2,'2015-05-03',22,'informatica'),
(1003,3,'2015-05-04',28,'informatica'),
(1004,4,'2015-05-05',28,'informatica'),
(1005,5,'2015-05-06',28,'informatica'),
(1006,6,'2017-08-08',22,'informatica'),
(1007,7,'2017-08-09',24,'informatica'),
(1008,8,'2017-08-10',24,'informatica'),
(1009,9,'2017-08-11',25,'informatica'),
(2000,10,'2017-08-12',22,'informatica'),
(2001,11,'2019-03-04',28,'informatica'),
(2002,12,'2019-03-05',26,'informatica'),
(2003,13,'2019-03-06',21,'informatica'),
(2004,14,'2019-03-07',20,'informatica'),
(2005,15,'2019-03-08',28,'informatica'),
(2006,16,'2020-03-15',30,'informatica'),
(2007,17,'2020-03-16',30,'informatica'),
(2008,18,'2020-03-17',27,'informatica'),
(2009,19,'2020-03-18',27,'informatica'),
(2010,20,'2020-03-19',25,'informatica');


insert into dipartimento(codice_dipartimento,nome_dipartimento,settore_scientifico,matricola_docente)
values(1001,'dataanalyst','informatica',311),
(1002,'cybersecurity','informatica',422),
(1003,'web developer','informatica',533),
(1004,'cloud engineer','informatica',644),
(1005,'java','informatica',755),
(1006,'sq','informatica',866),
(1007,'mongol','informatica',977),
(1008,'phyton','informatica',1088),
(1009,'javascript','informatica',1199),
(2000,'r','informatica',1310),
(2001,'googlestudio','informatica',1421),
(2002,'power bi','informatica',1532),
(2003,'aws','informatica',1643),
(2004,'microsoft azzure','informatica',1754),
(2005,'mongoldb','informatica',1865),
(2006,'cplus','informatica',1976),
(2007,'ion','informatica',2087),
(2008,'html','informatica',2198),
(2009,'css','informatica',2309),
(2010,'xml','informatica',2420);



insert into concorso_master(codice_master,codice_dipartimento,data_pubblicazione,data_scadenza,num_posti_disponibili)
values(1111,1001,'2016-09-05','2016-12-05',2000),
(2222,1002,'2016-09-06','2016-12-06',3000),
(3333,1003,'2016-09-07','2016-12-07',4500),
(4444,1004,'2016-09-08','2016-12-08',2000),
(5555,1005,'2016-09-09','2016-12-09',3000),
(6666,1006,'2015-03-05','2015-12-05',4500),
(7777,1007,'2015-03-06','2015-12-06',2000),
(8888,1008,'2015-03-07','2015-12-07',3000),
(9999,1009,'2015-03-08','2015-12-07',4500),
(11110,2000,'2015-03-09','2015-12-07',2000),
(12221,2001,'2014-04-04','2014-12-04',3000),
(13332,2002,'2014-04-05','2014-12-04',4500),
(14443,2003,'2014-04-06','2014-12-04',2000),
(15554,2004,'2014-04-07','2014-12-07',3000),
(16665,2005,'2014-04-08','2014-12-08',4500),
(17776,2006,'2013-06-08','2014-01-01',2000),
(18887,2007,'2013-06-09','2014-01-02',3000),
(19998,2008,'2013-06-10','2014-01-03',4500),
(21109,2009,'2013-06-11','2014-01-04',2000),
(22220,2010,'2013-06-12','2014-01-05',3000);



insert into partecipa_corsomaster(codice_dipartimento,codice_master,matricola_studente,data_domanda)
values (1001,1111,1,'2012-02-09'),
(1002,2222,2,'2012-02-10'),
(1003,3333,3,'2012-02-11'),
(1004,4444,4,'2012-02-12'),
(1005,5555,5,'2012-02-13'),
(1006,6666,6,'2012-02-14'),
(1007,7777,7,'2012-02-15'),
(1008,8888,8,'2012-02-16'),
(1009,9999,9,'2012-02-17'),
(2000,11110,10,'2012-02-18'),
(2001,12221,11,'2011-11-02'),
(2002,13332,12,'2011-11-03'),
(2003,14443,13,'2011-11-04'),
(2004,15554,14,'2011-11-05'),
(2005,16665,15,'2011-11-06'),
(2006,17776,16,'2011-11-07'),
(2007,18887,17,'2011-11-08'),
(2008,19998,18,'2011-11-09'),
(2009,21109,19,'2011-11-10'),
(2010,22220,20,'2011-11-11');



select dipartimento.codice_dipartimento,nome_dipartimento,settore_scientifico,docente.nome
from dipartimento
right outer join docente on dipartimento.matricola_docente=docente.matricola
where nome like'l%' ;

select matricola_studente,data_esame,voto
from esame 
where voto between '22' and '25';



	




















