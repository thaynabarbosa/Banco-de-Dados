use uc4atividades;

/***
consulta para um relatório de todas as vendas pagas em dinheiro. 
Necessários para o relatório data da venda, valor total; produtos vendidos, quantidade e valor unitário; nome do cliente, cpf e telefone.
Ordena-se pela data de venda, as mais recentes primeiro.
**/
SELECT * FROM venda v, item_venda iv, produto p, cliente c, funcionario f
WHERE v.id = iv.venda_id AND c.id = v.cliente_id AND p.id = iv.produto_id AND f.id = v.funcionario_id and tipo_pagamento = 'D';

/*Usei EXPLAIN para ver o comportamento do SELECT *, ANTES dos ajustes*/
/*a consulta percorre 800 linhas*/
EXPLAIN SELECT * FROM venda v, item_venda iv, produto p, cliente c, funcionario f
WHERE v.id = iv.venda_id AND c.id = v.cliente_id AND p.id = iv.produto_id AND f.id = v.funcionario_id and tipo_pagamento = 'D';

/*fiz o ajuste na consulta, selecionando somente as colunas e tabelas que eram importantes para o relatório*/
SELECT v.data, v.valor_total, p.nome AS produtos, iv.quantidade AS quantidade, iv.valor_unitario AS Valor_Unitario, c.nome as Nome_Cliente, c.cpf, c.telefone
FROM venda AS v JOIN item_venda AS iv ON v.id = iv.venda_id
JOIN cliente AS c ON c.id = v.cliente_id
JOIN produto AS p ON p.id = iv.produto_id
WHERE v.tipo_pagamento = 'D'
ORDER BY v.data DESC;

/*Criei um INDICE na tabela de Venda na coluna tipo de pagamento*/
CREATE INDEX idx_Tipo_Pagamento ON venda(tipo_pagamento);
/*conferi pra ver se o INDEX foi criado*/
SHOW INDEX FROM venda;

/*Anteriormente a criação do indice, a consulta percorria 800 linhas, executando o código com o INDICE criado o mesmo percorre 248 LINHAS*/
/*Estou usando o EXPLAIN para verificar ver o comportamento da consulta*/
EXPLAIN SELECT v.data, v.valor_total, p.nome AS produtos, iv.quantidade AS quantidade, iv.valor_unitario AS Valor_Unitario, c.nome as Nome_Cliente, c.cpf, c.telefone
FROM venda AS v JOIN item_venda AS iv ON v.id = iv.venda_id
JOIN cliente AS c ON c.id = v.cliente_id
JOIN produto AS p ON p.id = iv.produto_id
WHERE v.tipo_pagamento = 'D'
ORDER BY v.data DESC;

/*Criando uma View*/
CREATE VIEW pagamento_dinheiro AS 
SELECT v.data, v.valor_total, p.nome AS produtos, iv.quantidade AS quantidade, iv.valor_unitario AS Valor_Unitario, c.nome as Nome_Cliente, c.cpf, c.telefone
FROM venda AS v JOIN item_venda AS iv ON v.id = iv.venda_id
JOIN cliente AS c ON c.id = v.cliente_id
JOIN produto AS p ON p.id = iv.produto_id
WHERE v.tipo_pagamento = 'D'
ORDER BY v.data DESC;

SHOW TABLES;

/*Consultando a View criada*/
SELECT * FROM pagamento_dinheiro;




/**********PRÓXIMA ATIVIDADE**********/



/***
consulta para encontrar todas as vendas de produtos de um dado fabricante
Mostrar dados do produto, quantidade vendida, data da venda.
Ordena-se pelo nome do produto.
***/
SELECT * 
FROM produto p, item_venda iv, venda v
WHERE p.id = iv.produto_id AND v.id = iv.venda_id AND p.fabricante like '%lar%';
 
 /*Usei EXPLAIN para ver o comportamento do SELECT *, ANTES dos ajustes*/
 /*A Consulta percorre 51 linhas na tabela produto usando WHERE */
EXPLAIN SELECT * 
FROM produto p, item_venda iv, venda v
WHERE p.id = iv.produto_id AND v.id = iv.venda_id AND p.fabricante like '%lar%';


/*fiz o ajuste na consulta, selecionando somente as colunas que eram importantes para o relatório*/
SELECT iv.nome_produto AS produtos, p.descricao AS dados_produto, iv.quantidade AS Quantidade_Vendida, v.data, p.fabricante
FROM item_venda AS iv JOIN venda AS v ON v.id = iv.venda_id
JOIN produto AS p ON p.id = iv.produto_id
WHERE p.fabricante = 'ultralar'
GROUP BY iv.nome_produto;
 
/*Criei um INDICE na tabela de produto na coluna fabricante*/

CREATE INDEX idx_fabricante ON produto(fabricante);

/*conferi pra ver se o INDEX foi criado*/

SHOW INDEX FROM produto;
 
/*Anteriormente a criação do indice, a consulta percorria 51 linhas, executando o código com o ÍNDICE criado o mesmo percorre 21 LINHAS*/
/*Estou usando o EXPLAIN para verificar ver o comportamento da consulta*/

EXPLAIN SELECT iv.nome_produto AS produtos, p.descricao AS dados_produto, iv.quantidade AS Quantidade_Vendida, v.data
FROM item_venda AS iv JOIN venda AS v ON v.id = iv.venda_id
JOIN produto AS p ON p.id = iv.produto_id
WHERE p.fabricante = 'ultralar'
GROUP BY iv.nome_produto;

 /*Criando uma View*/
CREATE VIEW produto_fabricante AS 
SELECT iv.nome_produto AS produtos, p.descricao AS dados_produto, iv.quantidade AS Quantidade_Vendida, v.data
FROM item_venda AS iv JOIN venda AS v ON v.id = iv.venda_id
JOIN produto AS p ON p.id = iv.produto_id
WHERE p.fabricante = 'ultralar'
GROUP BY iv.nome_produto;
 
 SHOW TABLES;

/*Consultando a View criada*/
SELECT * FROM produto_fabricante;





/**********PRÓXIMA ATIVIDADE**********/



 
/***
Relatório de vendas de produto por cliente.
Mostrar dados do cliente, dados do produto e valor e quantidade totais de venda ao cliente de cada produto.
*/
SELECT SUM(iv.subtotal), SUM(iv.quantidade)
FROM produto p, item_venda iv, venda v, cliente c
WHERE p.id = iv.produto_id AND v.id = iv.venda_id AND c.id = v.cliente_id /*f.id = v.funcionario_id*/
GROUP BY c.nome, p.nome;

/*Usei EXPLAIN para ver o comportamento do SELECT *, ANTES dos ajustes*/
/*A Consulta percorre 232 linhas na tabela cliente, trazendo duas colunas de valor e quantidade total */
EXPLAIN SELECT SUM(iv.subtotal), SUM(iv.quantidade)
FROM produto p, item_venda iv, venda v, cliente c
WHERE p.id = iv.produto_id AND v.id = iv.venda_id AND c.id = v.cliente_id /*f.id = v.funcionario_id*/
GROUP BY c.nome, p.nome;

/*fiz o ajuste na consulta, selecionando somente as colunas e tabelas que eram importantes*/
/*Ao meu ver a consulta anterior não estava trazendo todas as informações que eram necessárias para o relatório*/
SELECT c.nome as Nome_Cliente, p.nome as Produtos, iv.subtotal as Valor_Total, iv.quantidade as Quantidade_total
FROM cliente as c JOIN venda as v ON c.id = v.cliente_id
JOIN item_venda as iv ON v.id = iv.venda_id
JOIN produto as p ON p.id = iv.produto_id;


/*Criei um INDICE na tabela de cliente na coluna NOME*/
DROP INDEX idx_nome_cliente ON cliente;
CREATE INDEX idx_nome_cliente ON cliente(nome);

/*conferi pra ver se o INDEX foi criado*/
SHOW INDEX FROM cliente;

/*Estou usando o EXPLAIN para verificar ver o comportamento da consulta, ela está usando o INDEX criado,
porém como não tem um WHERE (um filtro) ele ainda percorre todas as linhas para trazer todas as informações que seria os nomes dos clientes*/

EXPLAIN SELECT c.nome as nome_cliente, p.nome as produtos, iv.subtotal as Valor_Total, iv.quantidade as Quantidade_total
FROM cliente as c JOIN venda as v ON c.id = v.cliente_id
JOIN item_venda as iv ON v.id = iv.venda_id
JOIN produto as p ON p.id = iv.produto_id;

 /*Criando uma View*/
CREATE VIEW VendaProduto_cliente AS 
SELECT c.nome as nome_cliente, p.nome as produtos, iv.subtotal as Valor_Total, iv.quantidade as Quantidade_total
FROM cliente as c JOIN venda as v ON c.id = v.cliente_id
JOIN item_venda as iv ON v.id = iv.venda_id
JOIN produto as p ON p.id = iv.produto_id;

 SHOW TABLES;

/*Consultando a View criada*/
SELECT * FROM VendaProduto_cliente;
