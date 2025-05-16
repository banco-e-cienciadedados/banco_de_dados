CREATE USER admin_user WITH PASSWORD 'admin123';
CREATE USER normal_user WITH PASSWORD 'normal123';

GRANT ALL PRIVILEGES ON SCHEMA gerenciamento TO admin_user; --Coloca privilégios de criar tabelas, funções etc, porém ainda precisa de permissões para manipulá-las
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA gerenciamento TO admin_user; --Garante privilégios para o usuário ter controle total dentro das tabelas que estão dentro do esquema gerenciamento
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA gerenciamento TO admin_user; --Fornece permissões sobre todas as sequências existentes em gerenciamento 


GRANT USAGE ON SCHEMA gerenciamento TO normal_user; --Concede ao usuário leitura_user a permissão de uso do esquema
GRANT SELECT ON ALL TABLES IN SCHEMA gerenciamento TO normal_user; --Concede ao usuário leitura_user a permissão de leitura (somente consulta) em todas as tabelas


-- Garante que permissões sejam propagadas para futuras tabelas
ALTER DEFAULT PRIVILEGES IN SCHEMA gerenciamento
    GRANT SELECT ON TABLES TO normal_user;

GRANT INSERT ON ALL TABLES IN SCHEMA gerenciamento TO normal_user;
REVOKE INSERT ON ALL TABLES IN SCHEMA gerenciamento FROM normal_user;


BEGIN;

SAVEPOINT antes_inserir_filme;

INSERT INTO gerenciamento.filmes (titulo, genero)
VALUES ('O Senhor dos Anéis', 'Fantasia');

UPDATE gerenciamento.filmes SET disponivel = TRUE 
WHERE titulo = 'O Senhor dos Anéis'

IF (SELECT COUNT(*) FROM gerenciamento.filmes WHERE titulo = 'O Senhor dos Anéis') > 1 THEN
    ROLLBACK TO SAVEPOINT antes_inserir_filme;
ELSE

    COMMIT;
END IF;


