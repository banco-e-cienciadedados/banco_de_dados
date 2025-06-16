
INSERT INTO gerenciamento.endereço (bairro, cep, rua, cidade, numero) VALUES
('Centro', 12345678, 'Rua das Flores', 'São Paulo', 123),
('Jardim', 87654321, 'Avenida Principal', 'Rio de Janeiro', 456);

INSERT INTO gerenciamento.clientes (endereço, cpf, telefone, email) VALUES
('Rua das Flores, 123, Centro, São Paulo', 12345678901, '(11) 98765-4321', 'pedro1@email.com'),
('Avenida Principal, 456, Jardim, Rio de Janeiro', 98765432109, '(21) 91234-5678', 'duda2@email.com');

INSERT INTO gerenciamento.funcionarios (cpf, cargo, nome) VALUES
(11425235644, 'Atendente', 'Giovana'),
(53461677388, 'Gerente', 'Duda');

INSERT INTO gerenciamento.filmes (titulo, disponivel, ano, categoria) VALUES
('O Senhor dos Anéis', TRUE, 2001, 'Fantasia'),
('Matrix', TRUE, 1999, 'Ficção Científica');

INSERT INTO gerenciamento.locacao (data_inicio, data_final, valor, id_cliente, id_filme, id_funcionario, id_endereço) VALUES
('2025-05-16', '2025-05-20', 15.00, 1, 1, 1, 1),    -- Cliente 1 aluga "O Senhor dos Anéis" com funcionário 1
('2025-05-16', '2025-05-18', 12.00, 2, 2, 2, 2);    -- Cliente 2 aluga "Matrix" com funcionário 2

-- Atualizar o valor da locação do ID 2
UPDATE gerenciamento.locacao
SET valor = 14.00
WHERE id_locacao = 2;


UPDATE gerenciamento.filmes
SET disponivel = TRUE             -- Atualizar a disponibilidade de um filme (por exemplo, o filme foi devolvido)
WHERE id_filme = 2;


DELETE FROM gerenciamento.clientes
WHERE id_cliente = 2;


DELETE FROM gerenciamento.locacao
WHERE id_locacao = 1;