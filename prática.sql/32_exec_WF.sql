-- quantidade de usuários cadastrados (absoluto e acumulado) ao longo do tempo
-- o dia em que chegamos a 3.000 clientes

WITH tb_qtd_cliente AS (
    SELECT substr(DtCriacao, 1, 10) AS dtDia,
        count(DISTINCT IdCliente) AS qtdCliente
    FROM clientes

    GROUP BY dtDia
    ORDER BY dtDia
),

tb_acum_cliente AS(
    SELECT *,
        sum(qtdCliente) OVER (ORDER BY dtDia) AS acumCliente
    FROM tb_qtd_cliente
)

SELECT *
FROM tb_acum_cliente

WHERE acumCliente>=3000
ORDER BY dtDia

LIMIT 1