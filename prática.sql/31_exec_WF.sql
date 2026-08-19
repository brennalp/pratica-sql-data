--quantidade de transacoes acumuladas ao longo do tempo e quando chegamos em 100.000 transações

WITH tb_transacao_dia AS (
    SELECT 
        substr(DtCriacao, 1, 10) AS dtDia,
        count(DISTINCT IdTransacao) AS qtdeTransacao
    FROM transacoes

    GROUP BY dtDia
    ORDER BY dtDia 
),

tb_acum_dia AS (
    SELECT *,
        sum(qtdeTransacao) OVER (ORDER BY dtDia) AS acumTransacao --somando a transacao ao longo dos dias de forma ordenada
    FROM tb_transacao_dia

)

SELECT *
FROM tb_acum_dia

WHERE acumTransacao>=100000

ORDER BY acumTransacao
LIMIT 1