--clientes mais antigos, tem mais frequência de transação? (depender da regra de negócio)
-- julianday -> função para transformar em dias

SELECT 

        t1.Idcliente AS clientes,
        count(DISTINCT t1.IdTransacao) AS qtdTransacao,
        CAST(julianday('now') - julianday(substr(t2.DtCriacao,1,19)) AS INT)  AS qtdDias,
        substr(t2.DtCriacao, 1, 10) AS dtCliente

FROM transacoes AS t1

LEFT JOIN clientes as t2
ON t1.IdCliente = t2.IdCliente

GROUP BY t1.IdCliente

ORDER BY count(DISTINCT t1.IdTransacao) DESC;