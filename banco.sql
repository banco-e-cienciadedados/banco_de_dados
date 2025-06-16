CREATE USER admin_user WITH PASSWORD 'admin123';
CREATE USER normal_user WITH PASSWORD 'normal123';

GRANT ALL PRIVILEGES ON SCHEMA gerenciamento TO admin_user; 
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA gerenciamento TO admin_user;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA gerenciamento TO admin_user; 


GRANT USAGE ON SCHEMA gerenciamento TO normal_user; 
GRANT SELECT ON ALL TABLES IN SCHEMA gerenciamento TO normal_user;


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


