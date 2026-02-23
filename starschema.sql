CREATE DATABASE STAR_SCHEMA;
USE STAR_SCHEMA;

CREATE TABLE dim_professor (
professor_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nome VARCHAR(255) NOT NULL,
genero VARCHAR(20) NOT NULL,
data_nascimento DATE NOT NULL,
grau_academico VARCHAR(100) NOT NULL,
data_contratacao DATE NOT NULL);

CREATE TABLE dim_curso (
curso_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nome_curso VARCHAR(50) NOT NULL,
fk_dim_departamento_departamento_id INT DEFAULT NULL,
nivel VARCHAR(50) NOT NULL,
creditos INT NOT NULL,
duracao_semanas INT NOT NULL);

CREATE TABLE dim_departamento (
departamento_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nome_departamento VARCHAR(100) NOT NULL,
faculdade VARCHAR(255) NOT NULL,
chefe_departamento VARCHAR(255) NOT NULL);

CREATE TABLE fato_professor (
fk_dim_professor_professor_id INT DEFAULT NULL,
fk_dim_curso_curso_id INT DEFAULT NULL,
fk_dim_departamento_departamento_id INT DEFAULT NULL,
fk_dim_data_data_id INT DEFAULT NULL,
numeros_de_aulas INT NOT NULL,
horas_ensino TIME NOT NULL,
avaliacao_media VARCHAR(100) NOT NULL,
salario DECIMAL NOT NULL);

CREATE TABLE dim_data (
data_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
data DATE NOT NULL,
ano YEAR NOT NULL,
mes INT NOT NULL COMMENT 'seria MONTH não possui este tipo de dado',
dia INT NOT NULL COMMENT 'seria DAY porém não possui este tipo de dado',
trimestre INT NOT NULL,
semana_do_ano INT NOT NULL);

ALTER TABLE dim_curso ADD CONSTRAINT dim_curso_departamento_id_dim_departamento_departamento_id FOREIGN KEY (fk_dim_departamento_departamento_id) REFERENCES dim_departamento(departamento_id);
ALTER TABLE fato_professor ADD CONSTRAINT fato_professor_professor_id_dim_professor_professor_id FOREIGN KEY (fk_dim_professor_professor_id) REFERENCES dim_professor(professor_id);
ALTER TABLE fato_professor ADD CONSTRAINT fato_professor_curso_id_dim_curso_curso_id FOREIGN KEY (fk_dim_curso_curso_id) REFERENCES dim_curso(curso_id);
ALTER TABLE fato_professor ADD CONSTRAINT fato_professor_departamento_id_dim_departamento_departamento_id FOREIGN KEY (fk_dim_departamento_departamento_id) REFERENCES dim_departamento(departamento_id);
ALTER TABLE fato_professor ADD CONSTRAINT fato_professor_data_id_dim_data_data_id FOREIGN KEY (fk_dim_data_data_id) REFERENCES dim_data(data_id);