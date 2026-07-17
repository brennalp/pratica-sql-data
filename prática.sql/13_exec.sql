-- qual cliente fez mais transações no ano de 2024?

SELECT  IdCliente,
        count(*) AS transacaoCliente, -- é mais rapido, o de baixo funciona pq so tem 1 ID por transação
        count(DISTINCT IdTransacao) --é a mesma coisa que count (*)
        
FROM transacoes

WHERE DtCriacao LIKE '2024%'

GROUP BY IdCliente

ORDER BY count(DISTINCT IdTransacao) DESC

LIMIT 1;