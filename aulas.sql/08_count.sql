--resumir a tabela calculando estatistics

-- qtd de linhas na tabela - ele cria uma coluna nova com o numero 1 e vai saber a qtd de linhas 
-- todos iguais - melhor os dois primeiros
-- com as colunas vai verificar se são nulos

SELECT 
        count(*),
        count(1),
        count(IdCliente)

FROM clientes

