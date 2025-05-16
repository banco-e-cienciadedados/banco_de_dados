CREATE DATABASE locadora;

CREATE SCHEMA gerenciamento;

CREATE TABLE gerenciamento.locacao (
    id_locacao SERIAL PRIMARY KEY,
    data_inicio DATE NOT NULL,
    data_final DATE NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    id_cliente INT,
    id_filme INT,
    id_funcionario INT,
    id_endereço INT,
    FOREIGN KEY (id_cliente) REFERENCES gerenciamento.clientes(id_cliente),
    FOREIGN KEY (id_filme) REFERENCES gerenciamento.filmes(id_filme),
    FOREIGN KEY (id_funcionario) REFERENCES gerenciamento.funcionarios(id_funcionario),
    FOREIGN KEY (id_endereço) REFERENCES gerenciamento.endereço(id_endereço)
);

CREATE TABLE gerenciamento.clientes (
    id_cliente SERIAL PRIMARY KEY,
    endereço VARCHAR(200) NOT NULL,
    cpf BIGINT NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL
);

CREATE TABLE gerenciamento.funcionarios (
    id_funcionario SERIAL PRIMARY KEY,
    cpf BIGINT NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE gerenciamento.filmes (
    id_filme SERIAL PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    disponivel BOOLEAN NOT NULL,
    ano INT NOT NULL,
    categoria VARCHAR(50) NOT NULL
);

CREATE TABLE gerenciamento.endereço (
    id_endereço SERIAL PRIMARY KEY,
    bairro VARCHAR(100) NOT NULL,
    cep BIGINT NOT NULL,
    rua VARCHAR(100) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    numero INT NOT NULL
);







