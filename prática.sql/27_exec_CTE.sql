-- dentre os clientes de janeiro/2025, quantos assistiram ao curso de sql?

WITH tb_clientes_jan_2025 AS (

    SELECT DISTINCT IdCliente
    FROM transacoes
    WHERE DtCriacao >= '2025-01-01'
    AND DtCriacao < '2025-02-01'
),

tb_clientes_sql AS (

    SELECT DISTINCT IdCliente
    FROM transacoes
    WHERE DtCriacao >= '2025-08-25'
    AND DtCriacao < '2025-08-30'
)

SELECT 
        count(DISTINCT t1.IdCliente) AS qtdJaneiro,
        count(DISTINCT t2.IdCliente) AS qtdCurso

FROM tb_clientes_jan_2025 AS t1

LEFT JOIN tb_clientes_sql AS t2
ON t1.IdCliente = t2.IdCliente

--poderia colocar o filtro do where depois do join se fosse fazer 
--apenas uma cte e depois outra query, mas fica confuso

