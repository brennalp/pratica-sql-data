-- qual dia da semana tem mais pedidos em 2025?

SELECT 
        strftime('%w', datetime(substr(DtCriacao, 1, 10))) AS diaSem,
        count(IdTransacao) AS totalPedidoSemana --nao precisa de distinct por serem valores unicos


FROM transacoes

WHERE substr(DtCriacao, 1, 10) LIKE '2025%'

GROUP BY strftime('%w', datetime(substr(DtCriacao, 1, 19)))

ORDER BY 2 DESC

