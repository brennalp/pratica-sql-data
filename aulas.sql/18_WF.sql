-- WF com row number para ranking

-- qual foi o dia que o cliente teve mais iterações?

WITH tb_alunos_dia01 AS (

    SELECT DISTINCT IdCliente
    FROM transacoes
    WHERE substr(DtCriacao, 1, 10) = '2025-08-25'
),

tb_dia_cliente AS (

    SELECT t1.IdCliente,
            substr(t2.DtCriacao, 1, 10) AS dtDia,
            count(DISTINCT t2.IdTransacao) AS qtdeInteracoes


    FROM tb_alunos_dia01 AS t1
    
    LEFT JOIN transacoes AS t2
    ON t1.IdCliente = t2.IdCliente

    WHERE DtCriacao>='2025-08-25'
    AND DtCriacao<'2025-08-30'

    GROUP BY t1.IdCliente, dtDia
    ORDER BY qtdeInteracoes
),

tb_rn AS ( --enumerando as linhas com base numa partição em função dos clientes - cada cliente é uma fatia da base

    SELECT *,
            row_number() OVER (PARTITION BY IdCliente ORDER BY qtdeInteracoes DESC, dtDia) AS rn  
    FROM tb_dia_cliente
)

SELECT * 
FROM tb_rn
WHERE rn = 1

ORDER BY qtdeInteracoes DESC