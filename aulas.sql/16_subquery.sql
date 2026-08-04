-- quantos clientes chegaram ao quinto dia de sql?
-- não é a melhor opção por ser uma tabela grande

SELECT count(DISTINCT IdCliente) AS qtdCliente

FROM transacoes AS t1

WHERE t1.IdCliente IN (
    
    SELECT DISTINCT IdCliente --pegar clientes distintos
    FROM transacoes
    WHERE substr(DtCriacao, 1, 10) = '2025-08-25' 
)

AND substr(t1.DtCriacao, 1, 10) = '2025-08-29'; --filtro para ir ate o quinto dia


SELECT * 

FROM (
    SELECT *
    FROM transacoes
    WHERE DtCriacao >= '2025-01-01'
)

WHERE DtCriacao < 2025-07-01;
