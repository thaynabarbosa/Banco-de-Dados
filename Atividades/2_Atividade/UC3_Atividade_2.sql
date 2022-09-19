CREATE DATABASE hospital;
USE hospital;

CREATE TABLE convenio (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(45) NOT NULL,
cnpj VARCHAR(14) NOT NULL,
tempo_carencia VARCHAR(45) NOT NULL
);

CREATE TABLE paciente (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(45) NOT NULL,
data_nascimento DATE NOT NULL,
endereco VARCHAR(45) NOT NULL,
email VARCHAR(45),
cpf VARCHAR(11) NOT NULL,
rg VARCHAR(45) NOT NULL,
convenio_id INT NOT NULL,
FOREIGN KEY (convenio_id) REFERENCES convenio (id)
);

 CREATE TABLE especialidade(
 id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 nome_especialidade VARCHAR (45)
 );
 
 CREATE TABLE medico(
 id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 nome VARCHAR(45) NOT NULL,
 data_nascimento DATE NOT NULL,
 cpf VARCHAR(11) NOT NULL,
 crm VARCHAR(45) NOT NULL,
 uf CHAR(2) NOT NULL,
 tipo VARCHAR(45) NOT NULL,
 especialidade_id INT NOT NULL,
 telefone VARCHAR(45) NOT NULL,
 endereco VARCHAR(45) NOT NULL,
FOREIGN KEY (especialidade_id) REFERENCES especialidade (id)
 );
 
 CREATE TABLE consulta (
 id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 data_hora DATETIME,
 medico_id INT NOT NULL,
 paciente_id INT NOT NULL,
 valor_consulta DECIMAL(9,2) NOT NULL,
 convenio_id INT NOT NULL,
 numero_carteira VARCHAR(45) NOT NULL,
 especialidade_id INT NOT NULL,
 FOREIGN KEY (medico_id) REFERENCES medico(id),
 FOREIGN KEY (paciente_id) REFERENCES paciente(id),
 FOREIGN KEY (convenio_id) REFERENCES convenio(id),
 FOREIGN KEY (especialidade_id) REFERENCES especialidade(id)
  );
  
  CREATE TABLE receita_medica (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  paciente_id INT NOT NULL,
  medico_id INT NOT NULL,
  especialidade_id INT NOT NULL,
  medicamento_receita VARCHAR(255) NOT NULL,
  qtd_medicamento INT NOT NULL,
  instrucoes_uso VARCHAR(255) NOT NULL,
  FOREIGN KEY (paciente_id) REFERENCES paciente(id),
  FOREIGN KEY (medico_id) REFERENCES medico(id),
  FOREIGN KEY (especialidade_id) REFERENCES especialidade(id)
  );
  
  CREATE TABLE tipo_quarto(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  descricao VARCHAR(45) NOT NULL,
  valor_diaria DECIMAL(9,2) NOT NULL
    );
    
    CREATE TABLE quarto(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    numero_quarto INT NOT NULL,
    tipo_quarto_id INT NOT NULL,
    FOREIGN KEY (tipo_quarto_id) REFERENCES tipo_quarto(id)
    );
    
    CREATE TABLE enfermeiro(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45),
    cpf VARCHAR(11) NOT NULL,
    cre VARCHAR(45) NOT NULL
    );
    
    CREATE TABLE internacao(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    data_entrada DATE NOT NULL,
    data_prev_alta DATE NOT NULL,
    data_alta DATE NOT NULL,
    procedimento TEXT NOT NULL,
    quarto_id INT NOT NULL,
    enfermeiro_id INT NOT NULL,
    paciente_id INT NOT NULL,
    medico_id INT NOT NULL,
    FOREIGN KEY (quarto_id) REFERENCES quarto(id),
    FOREIGN KEY (enfermeiro_id) REFERENCES enfermeiro(id),
    FOREIGN KEY (paciente_id) REFERENCES paciente(id),
    FOREIGN KEY (medico_id) REFERENCES medico(id)
    );
    
    CREATE TABLE internacao_enfermeiro(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    enfermeiro_id INT NOT NULL,
    internacao_id INT NOT NULL,
    FOREIGN KEY (enfermeiro_id) REFERENCES enfermeiro(id),
    FOREIGN KEY (internacao_id) REFERENCES internacao(id)
    );