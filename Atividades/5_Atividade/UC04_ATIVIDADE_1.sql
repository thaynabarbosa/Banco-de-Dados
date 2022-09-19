/*Atividade 1 */
CREATE ROLE 'app_consulta';
GRANT SELECT ON uc4atividades.* TO 'app_consulta';
FLUSH PRIVILEGES;
SHOW GRANTS FOR 'app_consulta';
CREATE USER 'usuario_relatorio'@'localhost' IDENTIFIED BY '1234';
GRANT 'app_consulta' TO 'usuario_relatorio'@'localhost';
FLUSH PRIVILEGES;
SHOW GRANTS FOR 'usuario_relatorio'@'localhost';

/*Atividade 2*/

CREATE ROLE 'app_funcionario';
GRANT SELECT, INSERT, UPDATE, DELETE ON uc4atividades.venda TO 'app_funcionario';
GRANT SELECT, INSERT, UPDATE, DELETE ON uc4atividades.cliente TO 'app_funcionario';
GRANT SELECT, INSERT, UPDATE, DELETE ON uc4atividades.produto TO 'app_funcionario';
FLUSH PRIVILEGES;
SHOW GRANTS FOR 'app_funcionario';
CREATE USER 'usuario_vendedor'@'localhost' IDENTIFIED BY '1234';
GRANT 'app_funcionario' TO 'usuario_vendedor'@'localhost';
FLUSH PRIVILEGES;
SHOW GRANTS FOR 'usuario_vendedor'@'localhost';

/*Atividade 3*/
SELECT * FROM usuario;
UPDATE USUARIO SET senha = md5(senha);
SELECT * FROM usuario;