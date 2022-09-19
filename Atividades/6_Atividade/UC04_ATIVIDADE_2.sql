USE uc4atividades;

/*atividade 1*/
DELIMITER //
CREATE PROCEDURE lista_compras (id_cliente INT, data_inicial DATE, data_final DATE)
BEGIN

SELECT c.nome, v.id as id_compra, iv.subtotal as Total, iv.nome_produto, iv.quantidade, DATE(v.data) as data_compra
FROM cliente as c JOIN venda as v ON c.id=v.cliente_id
JOIN item_venda as iv ON v.id=iv.venda_id
WHERE (DATE(v.data) >= data_inicial) AND (DATE(v.data) <=data_final);

END //
DELIMITER ;

CALL lista_compras(1,'2022-01-01','2022-04-01');

/*atividade 2*/

DELIMITER //
CREATE FUNCTION comissao_vendedor (id_vendedor INT, data_inicial DATE, data_final DATE) RETURNS DECIMAL(24,2) DETERMINISTIC
BEGIN

DECLARE total_venda DECIMAL(9.2);
DECLARE perc_comissao INT;
DECLARE porcentagem INT UNSIGNED DEFAULT 100;

SELECT SUM(v.valor_total) as total, c.comissao 
INTO total_venda, perc_comissao
FROM funcionario AS f JOIN venda AS v
ON f.id = v.funcionario_id
JOIN cargo AS c ON c.id = f.cargo_id
WHERE f.id = id_vendedor AND ((DATE(v.data) >= data_inicial) AND (DATE(v.data) <=data_final));

RETURN ((total_venda * perc_comissao) / porcentagem);
END//
DELIMITER ;

SELECT comissao_vendedor(3,'2022-02-01','2022-04-01');

/*atividade 3*/

DROP FUNCTION retorne_cliente;

DELIMITER //
CREATE FUNCTION retorne_cliente (id_cliente INT) RETURNS VARCHAR(25) DETERMINISTIC
BEGIN

DECLARE p_cliente INT;
DECLARE valor_total_compras DECIMAL(9,2);
DECLARE tipo_cliente VARCHAR(25);

SELECT c.id, sum(v.valor_total)
INTO p_cliente, valor_total_compras
FROM cliente as c JOIN venda as v
ON c.id = v.cliente_id
WHERE v.cliente_id = id_cliente AND (YEAR(v.data) >= YEAR(curdate())-2);

IF valor_total_compras > 10000.00 THEN
	SET tipo_cliente := "PREMIUM";
ELSE 
	SET tipo_cliente := "REGULAR";
END IF;
RETURN tipo_cliente;
END//
DELIMITER ;

SELECT retorne_cliente(200);

/*atividade 4*/

DELIMITER //
CREATE TRIGGER novo_usuario BEFORE INSERT ON usuario
FOR EACH ROW
BEGIN
SET NEW.senha = md5(new.senha);

END //
DELIMITER ;

INSERT INTO usuario (login, senha,ultimo_login) VALUES ('Alexa','124536',current_date());
SELECT * FROM usuario;