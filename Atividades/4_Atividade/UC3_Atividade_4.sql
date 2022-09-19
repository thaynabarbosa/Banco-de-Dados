USE hospital;

SELECT*FROM medico;

INSERT INTO medico (id,nome, data_nascimento, cpf, crm, uf, tipo, especialidade_id, telefone, endereco, em_atividade)
VALUES (14,'Marcelo Luís Kevin Lopes','1988-06-09','71514546949','11719','RS','especialista',3,'(51) 99912-9936','Rua Lauredano Pires da Silva 699','ATIVO'),
(15,'Kamilly Natália Nicole Brito','1964-05-24','76355733302','92542','RS','especialista',3,'(51) 3691-5534','Travessa Itatiaia 402','ATIVO'),
(16,'Antonio Cauê Lucas Figueiredo','1943-04-27','23428096975','45394','RS','especialista',3,'(51) 2731-3820','Praça da Imaculada Conceição 376','ATIVO'); 

/*alterei algumas colunas que estavam como NOT NULL*/
ALTER TABLE consulta MODIFY COLUMN convenio_id INT NULL;
ALTER TABLE consulta MODIFY COLUMN numero_carteira VARCHAR(45) NULL;
ALTER TABLE paciente MODIFY COLUMN convenio_id INT NULL;

INSERT INTO consulta (id, data_hora ,medico_id ,paciente_id ,valor_consulta , convenio_id ,numero_carteira ,especialidade_id)
VALUE (21,'2020-03-10 10:30:00',16,3,'100.00',NULL, NULL,3),  (22,'2020-06-02 15:00:00',14,16,'100.00',NULL, NULL,3),(23,'2020-10-09 11:15:00',15,10,'100.00',NULL, NULL,3),
(24,'2020-04-11 09:15:00',1,7,'75.00',1, '2446354',3);

/* todos os dados e o valor médio das consultas do ano de 2020 e das que foram feitas com convênio */ 
SELECT YEAR(data_hora), medico_id, paciente_id, AVG(valor_consulta) AS ValorMediaConsulta, convenio_id, numero_carteira, especialidade_id FROM consulta WHERE YEAR(data_hora) = YEAR(curdate())-2 AND convenio_id is not null;

/*todos os dados das internações que tiveram data de alta maior que a data prevista para a alta*/
SELECT * FROM internacao;
SELECT * FROM internacao WHERE data_alta > data_prev_alta;

ALTER TABLE consulta ADD receitaMedica_id INT NULL;
ALTER TABLE consulta ADD FOREIGN KEY (receitaMedica_id) REFERENCES receita_medica (id);
UPDATE consulta SET receitaMedica_id = 3 WHERE id = 1;
UPDATE consulta SET receitaMedica_id = 6 WHERE id = 4;
UPDATE consulta SET receitaMedica_id = 1 WHERE id = 6;
UPDATE consulta SET receitaMedica_id = 2 WHERE id = 7;
UPDATE consulta SET receitaMedica_id = 8 WHERE id = 9;
UPDATE consulta SET receitaMedica_id = 4 WHERE id = 10;
UPDATE consulta SET receitaMedica_id = 10 WHERE id = 11;
UPDATE consulta SET receitaMedica_id = 7 WHERE id = 15;
UPDATE consulta SET receitaMedica_id = 9 WHERE id = 17;
UPDATE consulta SET receitaMedica_id = 5 WHERE id = 19;
UPDATE consulta SET receitaMedica_id = 12 WHERE id = 20;



