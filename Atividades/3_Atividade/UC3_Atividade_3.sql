USE hospital;

INSERT INTO especialidade (id,nome_especialidade) 
VALUES (1,'Clinico Geral'),(2,'Pediatra'),(3,'Gastroenterologia'), (4,'Dermatologia'),
(5,'Ginecologista'), (6,'Urologista'), (7,'Endocrinologia'),(8,'Obstetrícia'),(9,'Oftalmologia'), (10,'Cardiologia');

SELECT* FROM especialidade;

INSERT INTO convenio (id,nome,cnpj, tempo_carencia)
VALUES (1,'CCG Saúde', '00773639000100','180 dias'),
(2,'Unimed', '02812468000106','180 dias'),
(3,'IPE', '30483455000176','240 dias'),
(4,'Doctor Clin', '01387625000110','90 dias'),
(5,'Bradesco Saúde', '92693118000160','120 dias');

SELECT* FROM convenio;

INSERT INTO medico (id, nome,data_nascimento,cpf,crm, uf, tipo, especialidade_id, telefone, endereco)
VALUES (1,'Anny Quintanilha','1970-11-10','86132473009','120935','RS','especialista',1,'(69) 3752-5488','Rua Flores 10, apto 101'),
(2,'Alisson Sacramento','1981-01-15','80814279023','178105','MG','especialista',3,'(79) 2718-0264','Rua Albieri 480'),
(3,'Lívia Veloso','1972-03-22','20924987030','17897','MG','especialista',2,'(61) 3019-1483','Travessa A 89'),
(4,'Gael Milheiro Lemes','1964-02-13','38603737061','9826','RS','especialista',4,'(82) 2433-7762','Rua das Rosas, 80, apto 200'),
(5,'Gisela Espinosa','1980-09-12','23529091049','34548','SP','generalista',5,'(86) 3368-4812','Avenida Santos, 90'),
(6,'Júlia Camarinho','1980-07-05','74492596054','24654','MG','generalista',8,'(61) 2615-4776','Rua Albieri 590'),
(7,'Cristovão Xavier','1979-12-12','92690490005','67432','RS','especialista',9,'(24) 2448-9465','Rua da Luz, 80'),
(8,'Ezequiel Pestana Henriques','1979-06-30','67297959057','9756','RS','especialista',6,'(69) 2537-6076','Avenida Chateaubriand, 150'),
(9,'Nelson Anjos Palmeira','1980-10-14','3626639045','344789','SP','especialista',7,'(54) 3941-4795','Rua Álamo, 180, ap 90'),
(10,'Tito Carqueijeiro','1973-05-19','74588651056','14777','RS','generalista',10,'(83) 3272-8326','Rua Flores 670'),
(11,'Suéli Simão Pegado','1990-08-27','62876978067','15891','SP','residente',2,'(97) 2810-2734','Avenida Japão 50'),
(12,'Fabiano Gomide','1989-08-31','32972518080','65765','RS','residente',10,'(63) 3230-5071','Avenida das Águas 600'),
(13,'Alberto Veríssimo','1986-06-26','70600178013','13548','SP','residente',7,'(67) 3754-8886','Avenida das aves, 9912 apto 60');

SELECT*FROM medico;

INSERT INTO paciente (id,nome, data_nascimento,endereco,email,cpf,rg,convenio_id)
VALUES (1,'Karine Macena Porciúncula','1991-04-01','Rua Padre Chagas 10','karine@gmail.com','90125436287','1021323625',1),
(2,'Zilda Gomide Osório','1989-09-19','Av. Carlos Gomes 22','zilda@gmail.com','47131201023','3326501471',5),
(3,'Fabrício Norões Xavier','1997-10-01','Av. Assis Brasil 301','fabrício@hotmail.com','30129846513','9641210356',3),
(4,'César Sítima Faria','1999-06-10','Av. Benjamin Constant 904','cesar@gmail.com','41245789631','6934872540',2),
(5,'Silvana Fartaria Nazário','2000-03-07','Av. Getúlio Vargas 3301','silvana@hotmail.com','21465932102','2145369741',4),
(6,'Evandro Trindade Bouça','1990-5-15','Travessa Osório 22','evandro@hotmail.com','12457841201','3693441237',5),
(7,'Ivo Brandão Palos','1991-06-14','Rua Fernando Pessoa 66','ivo@gmail.com','66521430214','6234789541',1),
(8,'Armindo Moreira Azeredo','1987-07-11','Beco Diagonal 191','armindo@gmail.com','72151243262','7451236987',3),
(9,'Mark Festas Santana','1982-04-30','Rua das Hortências 5500','mark@hotmail.com','36287496512','4296354781',4),
(10,'Helton Espinosa','1981-2-26','Rua Andrade Neves 65','helton@gmail.com','74145321975','9875412396',4),
(11,'Giovanni Arouca Mata','1950-08-13','Rua San Andreas 48','giovanni@gmail.com','63598720231','2231478954',5),
(12,'Cármen Mata Camargo','1966-03-18','Rua da Terra Média 89','carmen@gmail.com','75417498736','8745698567',2),
(13,'Pablo Atilano Flores','1969-11-09','Rua dos Alfaneiros nº 4','pablo@hotmail.com','20364789451','4574123698',2),
(14,'Francisca Parracho Caneira','2019-04-20','Rua Oscar Shick 66','francisca@hotmail.com','67958413203','5231478413',3),
(15,'Lauren Gonçalves','2020-01-16','Rua Fernão Dias 71','lauren@gmail.com','42148739658','3652121471',1),
(16,'Artur Rezende','1988-07-11','Av Panvel 142','artur@gmail.com','96378411014','3012478954',1);

SELECT*FROM paciente;

INSERT INTO consulta (id,data_hora,medico_id,paciente_id,valor_consulta,convenio_id,numero_carteira,especialidade_id)
VALUES (1,'2015-03-22 14:00:00',1,4,'110.00',2,'12342342',1),
(2,'2015-04-06 15:30:00',7,9,'110.00',4,'542315',9),
(3,'2016-01-04 11:15:00',1,2,'110.00',5,'21484234',1),
(4,'2016-02-12 11:15:00',4,3,'180.00',3,'12341234',4),
(5,'2016-05-20 11:45:00',7,16,'150.00',1,'21341244',9),
(6,'2017-09-17 16:30:00',10,12,'110.00',2,'2354641656',10),
(7,'2017-10-26 09:30:00',8,8,'180.00',3,'226672634',6),
(8,'2017-10-30 10:30:00',10,12,'150.00',2,'2354641656',10),
(9,'2018-11-09 14:00:00',4,6,'110.00',5,'11234214124',4),
(10,'2018-12-14 16:00:00',13,11,'75.00',5,'213455',7),
(11,'2019-06-21 11:30:00',11,14,'150.00',3,'324324321',2),
(12,'2020-01-28 13:30:00',1,5,'100.00',4,'4351315',1),
(13,'2021-06-10 10:15:00',6,1,'100.00',1,'55643215',8),
(14,'2021-06-10 14:30:00',4,10,'75.00',4,'4548643',4),
(15,'2021-07-18 09:15:00',1,7,'75.00',1,'2446354',1),
(16,'2021-08-16 10:15:00',5,5,'150.00',4,'4351315',5),
(17,'2021-08-20 10:45:00',3,15,'150.00',1,'12525312531',2),
(18,'2021-09-11 15:00:00',2,11,'100.00',5,'213455',3),
(19,'2021-09-12 17:00:00',12,13,'100.00',2,'837493',10),
(20,'2021-11-05 16:30:00',6,1,'110.00',1,'55643215',8);

SELECT * FROM consulta;

INSERT INTO receita_medica (id, paciente_id,medico_id,especialidade_id,medicamento_receita,qtd_medicamento,instrucoes_uso)
VALUES (1,12,10,10,'Besilapin/Losartana','2','Tomar um comprimido de cada ao acordar e antes de dormir'),
(2,8,8,6,'Alfuzosina/Prazosina/amoxicilina','3','Tomar um comprimido sempre que começar a sentir dor ou febre'),
(3,4,1,1,'Paracetamol','1','Tomar um comprimido sempre que começar a sentir dor ou febre'),
(4,11,13,7,'amoxicilina/Azitromicina/Clindamicina','3','Tomar um compridido de cada, a cada 12 horas'),
(5,13,12,10,'Xarelto/Losartana','2','Tomar um compridido de cada ao acordar'),
(6,3,4,4,'Retinol/acido Mandelico','2','Uso utopico todos os dias, somente a noite'),
(7,7,1,1,'Torsilax/Paracetamol/Ibuprofeno','3','Tomar um comprimido sempre que sentir dores.'),
(8,6,4,4,'Hidroquinona, ácido glicolico','2','Uso utopico todos os dias, somente a noite.'),
(9,15,3,2,'Melhoral infantil','1','Tomar 1 comprimido 4 vezes ao dia;'),
(10,14,11,2,'Xarope/Alivium infantil','2','Toma xarope de 6 em 6 horas, Alivium somente em caso de febre'),
(11,5,5,5,'Buscopam/Ciclo21','2','Tomar um comprimido sempre que sentir colicas, Ciclo21 tomar um comprimido por 21 dias seguidos)'),
(12,1,6,8,'Metilfolato/Vitamina D3','2','Tomar um comprimido de cada uma vez ao dia');

SELECT * FROM receita_medica;

INSERT INTO tipo_quarto (id,descricao,valor_diaria)
VALUES (1,'Apartamento','150.00'), (2,'Quarto Duplo','120.00'), (3,'Enfermaria','80.00');

SELECT * FROM tipo_quarto;

INSERT INTO quarto (id,numero_quarto,tipo_quarto_id) 
VALUES (1,'101',3),(2,'102',2), (3,'103',2), (4,'201',2), (5,'202',1),(6,'203',1);

SELECT * FROM quarto;

INSERT INTO enfermeiro (id,nome,cpf,cre) 
VALUES (1,'Iago Carlos Kauê Barros','72330430000','259534'),
(2,'Sophie Bruna Farias','22085438075','391677'),
(3,'Silvana Rebeca Porto','18772526033','379055'),
(4,'Levi Márcio Rezende','19970568019','172649'),
(5,'Theo Oliver Alves','57389664495','419771'),
(6,'Josefa Renata Martins','22096466261','217458'),
(7,'Vitória Rosângela Rocha','25032379409','284975'),
(8,'Olivia Cláudia Elza Assunção','12708861930','348907'),
(9,'Lorena Malu Emilly Carvalho','34811042000','476572'),
(10,'Raimundo Iago Enzo Assis','90808070606','281342');

SELECT * FROM enfermeiro;

INSERT INTO internacao (id,data_entrada,data_prev_alta,data_alta,procedimento,quarto_id,enfermeiro_id,paciente_id,medico_id)
VALUES (1,'2017-09-17','2017-09-20','2017-09-20','internacao',2,4,12,10),
(2,'2017-10-30','2017-11-06','2017-11-07','internacao',2,6,12,10),
(3,'2017-10-26','2017-10-29','2017-10-27','internacao',1,7,8,8),
(4,'2018-12-15','2018-12-17','2018-12-17','internacao',2,5,11,13),
(5,'2020-01-28','2020-01-29','2020-01-29','nebulização',1,10,5,1),
(6,'2021-06-10','2021-6-12','2021-06-15','soro',3,6,1,6),
(7,'2021-07-18','2021-07-20','2021-07-20','internação',5,2,7,1),
(8,'2021-09-21','2021-09-14','2021-09-14','internação',6,9,11,2),
(9,'2021-09-12','2021-09-15','2021-09-15','internação',5,3,13,12),
(10,'2021-11-05','2021-11-07','2021-11-07','pós parto',3,8,1,6);

SELECT * FROM internacao;

INSERT INTO internacao_enfermeiro (id,enfermeiro_id,internacao_id)
VALUES (1,4,1), (2,3,1), (3,6,2), (4,1,2),(5,8,3),(6,2,3),(7,5,4),(8,7,4),(9,10,5),(10,7,5),(11,6,6),(12,5,6),(13,2,7),(14,1,7),(15,9,8),(16,4,8),(17,3,9),(18,10,9),(19,8,10),(20,9,10);

SELECT * FROM internacao_enfermeiro;