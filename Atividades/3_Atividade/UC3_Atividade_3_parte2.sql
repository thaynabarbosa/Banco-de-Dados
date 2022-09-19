USE hospital;

ALTER TABLE medico ADD em_atividade VARCHAR(10) DEFAULT 'ATIVO';
SELECT*FROM medico;

UPDATE medico SET em_atividade = 'INATIVO' WHERE id = 4;
UPDATE medico SET em_atividade = 'INATIVO' WHERE id = 3;
SELECT*FROM medico;


UPDATE internacao SET data_alta = data_entrada+3 WHERE quarto_id = 1;

SELECT*FROM internacao;

SELECT*FROM consulta;
DELETE FROM consulta WHERE convenio_id = 5;
SELECT*FROM consulta;

ALTER TABLE paciente MODIFY COLUMN convenio_id INT NULL;
UPDATE paciente SET convenio_id = null WHERE convenio_id = 5;
SELECT*FROM paciente;

SELECT*FROM convenio;
DELETE FROM convenio WHERE id = 5;
SELECT*FROM convenio;


