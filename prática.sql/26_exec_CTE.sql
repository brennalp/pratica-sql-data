--qual foi o churn em relação ao último dia
-- 1 - retenção = churn (cancelamento)

WITH tb_clientes_primeiro_dia AS (
    SELECT DISTINCT Idcliente AS clientePrimDia 
    FROM transacoes
    WHERE substr(DtCriacao, 1, 10) = '2025-08-25'
),

tb_clientes_ultimo_dia AS (
    SELECT DISTINCT IdCliente AS clienteUltDia 
    FROM transacoes
    WHERE substr(DtCriacao, 1, 10) = '2025-08-29'
),

tb_join_churn AS (

    SELECT 
            t1.clientePrimDia,
            t2.clienteUltDia
    FROM tb_clientes_primeiro_dia AS t1

    LEFT JOIN tb_clientes_ultimo_dia AS t2
    ON t1.clientePrimDia = t2.clienteUltDia

)

SELECT 
        count(DISTINCT clientePrimDia) AS qtdPrimDia,
        count(DISTINCT clienteUltDia) AS qtdUltDia,
        1.*(count(DISTINCT clientePrimDia)-count(DISTINCT clienteUltDia))/count(DISTINCT clientePrimDia) AS taxaChurn
FROM tb_join_churn;

