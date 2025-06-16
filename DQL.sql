Listar locações com cliente e filme

SELECT l.id_locacao, c.endereço AS cliente,  f.titulo AS filme,  l.valor FROM  gerenciamento.locacao l 
    JOIN gerenciamento.clientes c ON l.id_cliente = c.id_cliente JOIN gerenciamento.filmes f ON l.id_filme = f.id_filme; 

------------------------------------------------------------------------------------------------------------------------------

Listar filmes disponíveis

SELECT titulo, ano FROM gerenciamento.filmes WHERE disponivel = TRUE;
    
-------------------------------------------------------------------------------------------------------------------------------

Listar funcionários e total de locações

SELECT func.nome, COUNT(l.id_locacao) AS locacoes FROM gerenciamento.funcionarios func LEFT JOIN gerenciamento.locacao l ON func.id_funcionario = l.id_funcionario
    GROUP BY func.nome;

-----------------------------------------------------------------------------------------------------------------------------------
   
Listar clientes ativos:

SELECT id_cliente, email FROM gerenciamento.clientes ORDER BY id_cliente;
   
=====================================================================================================================================

