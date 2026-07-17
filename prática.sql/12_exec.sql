-- Qual cliente juntou mais pontos positivos em 2025-05

SELECT IdCliente,
        sum(QtdePontos) as totalPontos,
        --DtCriacao

FROM clientes

WHERE DtCriacao LIKE '2025-05%'
AND QtdePontos>0

GROUP BY IdCliente

ORDER BY sum(QtdePontos) DESC

LIMIT 10