
--ver quantas pessoas estiveram por dia -> curva de churn
-- não é a maneira correta pq não necessariamente são quem estão desde o primeiro dia
-- pode ter pessoas novas entrando todos os dias

SELECT 
        substr(DtCriacao, 1, 10) AS dtDia,
        count(DISTINCT IdCliente) AS qtdeCliente

FROM transacoes

WHERE DtCriacao >= '2025-08-25'
AND DtCriacao < '2025-08-30'

GROUP BY dtDia;

WITH tb_clientes_primeiro_dia AS (
    SELECT DISTINCT Idcliente AS clientePrimDia 
    FROM transacoes
    WHERE substr(DtCriacao, 1, 10) = '2025-08-25'
),

tb_clientes_curso AS (
    SELECT DISTINCT Idcliente AS clientes,
            substr(DtCriacao, 1, 10) AS dtDias
    FROM transacoes
    WHERE DtCriacao >= '2025-08-25'
    AND DtCriacao < '2025-08-30'

),

tb_join_churn AS (

    SELECT 
            count(DISTINCT t2.clientes) AS qtdeClientes,
            t2.dtDias AS dias
    FROM tb_clientes_primeiro_dia AS t1

    LEFT JOIN tb_clientes_curso AS t2
    ON t1.clientePrimDia = t2.clientes

    GROUP BY t2.dtDias

)

SELECT 
        dias,
        qtdeClientes,
        1 - 1.* qtdeClientes/(select count(*) from tb_clientes_primeiro_dia) AS taxaChurn
FROM tb_join_churn;
