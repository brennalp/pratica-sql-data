--recorrencia (intervalo) de pessoas que assistem o canal
--diferente de frequencia que é sobre quantidade em proporção a um total
-- a média que as pessoas voltam 

WITH cliente_dia AS (--pegar os clientes em um intervalo de tempo

    SELECT 
            DISTINCT
            IdCliente,
            substr(DtCriacao, 1, 10) AS dtDia
    
    FROM transacoes
    WHERE substr(DtCriacao, 1, 4) = '2025'
    ORDER BY IdCliente, dtDia
),

tb_lag AS ( --empurra os registros para baixo para poder comparar as linhas

    SELECT *,
            lag(dtDia) OVER (PARTITION BY IdCliente ORDER BY dtDia) AS lagDia

    FROM cliente_dia
),

tb_diff_dt AS (

    SELECT *,
            julianday(dtDia) - julianday(lagDia) as dtDiff --transforma a data em dias para fazer a diferença
    FROM tb_lag
),

tb_avg AS ( --a média de dias em que cada cliente volta 

    SELECT IdCliente,
            avg(dtDiff) AS avgDia

    FROM tb_diff_dt

    GROUP BY IdCliente
)

SELECT av(avgDia) FROM tb_avg --a média geral em que os clientes voltam a assistir o canal


