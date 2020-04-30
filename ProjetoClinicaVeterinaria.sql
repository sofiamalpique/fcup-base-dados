CREATE DATABASE IF NOT EXISTS ClinicaVeterinaria2;

USE ClinicaVeterinaria2;

-- Create Tables
DROP TABLE IF EXISTS CONSULTA;
DROP TABLE IF EXISTS ANIMAL;
DROP TABLE IF EXISTS DEPARTAMENTO;
DROP TABLE IF EXISTS MEDICO;
DROP TABLE IF EXISTS CLIENTE;
DROP TABLE IF EXISTS MORADA;


CREATE TABLE IF NOT EXISTS MORADA
(
  Id	            INT PRIMARY KEY AUTO_INCREMENT,
  Rua		        VARCHAR(64) NOT NULL,
  Num		        INT NOT NULL,
  Andar		        INT DEFAULT NULL,
  CodPostal	        VARCHAR(16) NOT NULL,
  Localidade	    VARCHAR(32) NOT NULL,
  Pais	            VARCHAR(64) DEFAULT 'Portugal'
);

CREATE TABLE IF NOT EXISTS CLIENTE
(
  Id	      INT PRIMARY KEY AUTO_INCREMENT,
  Nome 		  VARCHAR(128) NOT NULL,
  Email		  VARCHAR(64) UNIQUE,
  DataNasc	  DATE NOT NULL,
  Sexo		  ENUM('M', 'F') NOT NULL,
  Telemovel   INT NOT NULL,
  Morada      INT DEFAULT NULL,

  FOREIGN KEY(Morada) REFERENCES MORADA(Id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS MEDICO
(
  Id	       INT PRIMARY KEY AUTO_INCREMENT,
  Nome 		   VARCHAR(128) NOT NULL,
  Email	       VARCHAR(64) UNIQUE,
  DataNasc	   DATE NOT NULL,
  Sexo		   ENUM('M', 'F') NOT NULL,
  Telemovel    INT NOT NULL,
  Morada       INT DEFAULT NULL,
  Supervisor   INT DEFAULT NULL,
  
  FOREIGN KEY(Morada) REFERENCES MORADA(Id) ON DELETE CASCADE,
  FOREIGN KEY(Supervisor) REFERENCES MEDICO(Id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS DEPARTAMENTO
(
  Id	    INT PRIMARY KEY AUTO_INCREMENT,
  Nome 		VARCHAR(128) NOT NULL,
  Diretor 	INT NOT NULL,

  FOREIGN KEY(Diretor) REFERENCES MEDICO(Id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS ANIMAL
(
  Id	            INT PRIMARY KEY AUTO_INCREMENT,
  Nome 		        VARCHAR(128) NOT NULL,
  DataNasc	        DATE NOT NULL,
  Sexo		        ENUM('M', 'F') NOT NULL,
  Cliente		    INT NOT NULL,
  Departamento      INT NOT NULL,

  FOREIGN KEY(Cliente) REFERENCES CLIENTE(Id) ON DELETE CASCADE,
  FOREIGN KEY(Departamento) REFERENCES DEPARTAMENTO(Id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS CONSULTA
(
  Id	        INT PRIMARY KEY AUTO_INCREMENT,
  Medico 	    INT NOT NULL,
  Animal 	    INT NOT NULL,
  Data		    DATE NOT NULL,
  HoraInicio 	TIME NOT NULL,
  HoraFim 	    TIME NOT NULL,

  FOREIGN KEY(Medico) REFERENCES MEDICO(Id) ON DELETE CASCADE,
  FOREIGN KEY(Animal) REFERENCES ANIMAL(Id) ON DELETE CASCADE
);

-- Insert Values

INSERT INTO MORADA(Rua, Num, Andar, CodPostal, Localidade, Pais)
VALUES
    ('Rua de Cedofeita', 12, NULL, '4367-263', 'Porto', 'Portugal'),
    ('Avenida José Costa', 321, 3, '8200-319', 'Albufeira', 'Portugal'),
    ('Rua Condes Torre', 65, 10, '1239-150', 'Portlegre', 'Portugal'),
    ('Rua Cabral Antunes', 12, NULL, '4367-200', 'Aveiro', 'Portugal'),
    ('Rua Padoa Correia', 43, NULL, '3000-263', 'Vila Nova de Gaia', 'Portugal'),
    ('Avenida da República', 23, 10, '1203-500', 'Lisboa', 'Portugal'),
    ('Travessa de Cima', 45, 4,'5567-345', 'Gondomar', 'Portugal'),
    ('Praça da Liberdade', 73, 7,'5743-321', 'Sintra', 'Portugal'),
    ('Rua das Amoras', 59, NULL, '3241-642', 'Fafe', 'Portugal'),
    ('Thompsons Lane', 92, NULL, 'G84 4TJ', 'MEIKLE RAHANE', 'United Kingdom'),
    ('Praça Aval de Cima', 61, 5, '4450-750', 'Porto', 'Portugal'),
    ('Rua das Flores', 863, NULL, '6367-634', 'Évora', 'Portugal'),
    ('Bleibtreustrasse', 25, 4, '32758', 'Detmold Innenstadt', 'Germany'),
    ('Rua José Malhoa', 34, NULL, '6363-987', 'Setúbal', 'Portugal'),
    ('Rua Vasco Gama', 31, 8, '7436-631', 'Vila Nova de Cerveira', 'Portugal'),
    ('Rua Riamar', 93, 6, '7253-352', 'Santa Maria da Feira', 'Portugal'),
    ('Rua de Santa Bárbara', 13, NULL, '7512-672', 'Viseu', 'Portugal'),
    ('Avenida Galé', 61, 7, '8241-235', 'Quinta de Valadares', 'Portugal'),
    ('Praceta Abel Salazar', 731, 9, '6448-235', 'Andorinho', 'Portugal'),
    ('Travessa Espanhola', 983, NULL, '2234-628', 'Tougues', 'Portugal');

INSERT INTO CLIENTE(Nome, Email, DataNasc, Sexo, Telemovel, Morada)
VALUES
	('Artur Vieira', 'artur@nor.mal', '1994-01-01', 'M', 912435647, 10),
	('Belmira Azevedo',	NULL, '1995-02-02', 'F', 932665647, 16),
	('Carlos Dias', NULL, '1996-03-03', 'M', 969736526, 13),
	('Diana Lopes', 'gatofofo@nor.mal', '1997-04-04', 'F', 925879267, 17),
  ('Catarina Borges', 'cata.bor@net.mal','1985-06-24', 'F', 961341551, 18),
  ('Felício Jasmim', 'feli.jas@net.mal', '1965-02-17', 'M', 928758472, 19),
  ('Adelina Castro', 'adel_cas@nor.mal', '1980-12-25', 'F', 918765314, 20);

INSERT INTO MEDICO(Nome, Email, DataNasc, Sexo, Telemovel, Morada, Supervisor)
VALUES
	('Alice Morgado', 'awesomevet@med.vet', '1992-03-12', 'M', 912435647, 1, NULL),
	('Bernardo Silva',	NULL, '1990-02-02', 'F', 912435647, 2, 1),
	('Cristina Freire', NULL, '1993-10-03', 'M', 912435647, 3, NULL),
	('Duarte Fonseca', 'duarte@med.vet', '1991-04-04', 'M', 912435647, 4, 1),
  ('Sofia Oliveira', 'sofia.oli@med.vet', '1987-08-24', 'F', 935875812, 5, NULL),
  ('André Fernandes', NULL, '1988-05-09', 'M', 912345678, 6, 2),
  ('Adriana Rodrigues', 'adrirod@med.vet', '1986-07-29', 'F', 968435621, 7, NULL),
  ('Sérgio Gomes', 'sgomes@med.vet', '1983-01-09', 'M', 917367936, 8, 3),
  ('Pedro Barreiro', 'pedrobar@med.vet', '1984-10-06', 'M', 927354785, 9, 3),
  ('Daniela Melo', NULL, '1979-03-14', 'F', 964528166, 11, NULL),
  ('Joana Africano', 'joafrican@med.vet', '1986-06-20', 'F', 963142673, 12, 5),
  ('João Nuno Gomes', 'jn.gomes@med.vet', '1990-05-24', 'M', 917452857, 14, 7),
  ('Pedro Belinha', NULL, '1983-11-17', 'M', 964286318, 15, 11);

INSERT INTO DEPARTAMENTO(Nome, Diretor)
VALUES
    ('Departamento de Mamíferos', 1),
    ('Departamento de Répteis', 3),
    ('Departamento de Anfíbios', 5),
    ('Departamento de Aracnídeos', 7),
    ('Departamento de Aves', 11);
    
INSERT INTO ANIMAL(Nome, DataNasc, Sexo, Cliente, Departamento)
VALUES
	('Patusca', '2010-1-1',	'F',	1, 1),
	('Pintas',	'2010-2-2',	'F',	1, 1),
	('Duque',	'2010-3-3',	'M',	1, 1),
	('Tobias',	'2010-4-4',	'M',	2, 5),
	('Costa',	'2010-5-5',	'M',	3, 2),
  ('Branquinho', '2016-07-23', 'M', 4, 4),
  ('Safira', '2017-02-15', 'F', 4, 5),
  ('Índia', '2010-06-18', 'F', 5, 1),
  ('Tintin', '2014-10-26', 'M', 6, 2),
  ('Marcus', '2015-07-12', 'M', 6, 2),
  ('Milu', '2018-11-09', 'M', 6, 2),
  ('Mobidique', '2019-04-25', 'M', 7, 4);

INSERT INTO CONSULTA(Medico, Animal, Data, HoraInicio, HoraFim)
VALUES
	(1, 1, '2020-01-10', '09:00', '10:00'),
  (1, 3, '2020-01-10', '10:00', '12:00'),
  (1, 8, '2020-01-10', '15:00', '16:30'),
  (2, 1, '2020-03-17', '13:00', '14:00'),
  (2, 2, '2020-01-14', '09:30', '11:00'),
  (2, 3, '2020-03-18', '16:00', '17:30'),
  (4, 8, '2020-01-30', '10:00', '11:00'),
  (4, 2, '2020-02-26', '15:00', '17:00'),
  (6, 3, '2020-04-11', '11:00', '12:00'),
  (6, 2, '2020-03-10', '15:30', '17:30'),
  (6, 8, '2020-02-19', '17:00', '18:00'),
	(3, 5, '2020-01-11', '16:00', '17:00'),
  (3, 9, '2020-01-15', '14:00', '15:00'),
  (3, 10, '2020-01-13', '17:00', '18:30'),
  (8, 9, '2020-03-27', '18:00', '19:00'),
  (8, 11, '2020-03-18', '10:00', '11:30'),
  (9, 10, '2020-02-19', '11:00', '12:00'),
  (9, 5, '2020-03-19', '13:00', '14:00'),
  (9, 11, '2020-04-11', '15:00', '16:00'),
  (7, 6, '2020-01-10', '16:00', '17:00'),
  (7, 12, '2020-01-18', '18:00', '19:00'),
  (12, 6, '2020-03-18', '15:30', '17:00'),
  (12, 12, '2020-03-19', '18:00', '19:00'),
  (10, 4, '2020-01-09', '16:30', '17:30'),
  (10, 7, '2020-01-13', '18:30', '19:30'),
  (11, 4, '2020-02-28', '13:00', '14:00'),
  (13, 7, '2020-03-02', '16:00', '18:00'),
  (1, 1, '2020-02-16', '09:00', '10:00'),
  (1, 3, '2020-02-20', '10:00', '12:00'),
  (1, 8, '2020-03-19', '15:00', '16:30'),
  (2, 1, '2020-04-17', '13:00', '14:00'),
  (2, 2, '2020-04-10', '09:30', '11:00'),
  (2, 3, '2020-05-18', '16:00', '17:30'),
  (4, 8, '2020-04-30', '10:00', '11:00'),
  (4, 2, '2020-04-26', '15:00', '17:00'),
  (6, 3, '2020-06-11', '11:00', '12:00'),
  (6, 2, '2020-05-10', '15:30', '17:30'),
  (6, 8, '2020-05-19', '17:00', '18:00'),
	(3, 5, '2020-01-11', '16:00', '17:00'),
  (3, 9, '2020-04-15', '14:00', '15:00'),
  (3, 10, '2020-03-13', '17:00', '18:30'),
  (8, 9, '2020-05-27', '18:00', '19:00'),
  (8, 11, '2020-05-18', '10:00', '11:30'),
  (9, 10, '2020-04-19', '11:00', '12:00'),
  (9, 5, '2020-03-19', '13:00', '14:00'),
  (9, 11, '2020-06-11', '15:00', '16:00'),
  (7, 6, '2020-04-10', '16:00', '17:00'),
  (7, 12, '2020-04-18', '18:00', '19:00'),
  (12, 6, '2020-05-18', '15:30', '17:00'),
  (12, 12, '2020-05-19', '18:00', '19:00'),
  (10, 4, '2020-04-09', '16:30', '17:30'),
  (10, 7, '2020-04-13', '18:30', '19:30'),
  (11, 4, '2020-05-28', '13:00', '14:00'),
  (13, 7, '2020-05-02', '16:00', '18:00');