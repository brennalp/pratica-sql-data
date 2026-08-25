-- qual o dia da semana mais ativo de cada usuário

WITH tb_atv_dia AS (
    SELECT DISTINCT IdCliente,
        substr(DtCriacao, 1, 10) AS dtDia,
        count(DISTINCT IdTransacao) AS qtdTransacao
    FROM transacoes

    GROUP BY IdCliente, dtDia
),

tb_rn_dia AS (
    SELECT *,
        row_number() OVER (PARTITION BY IdCliente ORDER BY qtdTransacao DESC, dtDia) as rn
    FROM tb_atv_dia
),

tb_dia_semana_ativo AS (
    SELECT IdCliente,
        dtDia,
        strftime('%w', dtDia) AS diaSemana,
        qtdTransacao 
    FROM tb_rn_dia

    WHERE rn = 1
)

-- top 3 dias da semana com transacoes
-- tb poderia fazer a lista de clientes de cada dia da semana em que so muda o where = "1" para outros dias
SELECT diaSemana,
        CASE
            WHEN diaSemana = '1' then 'SEGUNDA FEIRA'
            WHEN diaSemana = '2' then 'TERÇA FEIRA'
            WHEN diaSemana = '3' then 'QUARTA FEIRA'
            WHEN diaSemana = '4' then 'QUINTA FEIRA'
            WHEN diaSemana = '5' then 'SEXTA FEIRA'
            WHEN diaSemana = '6' then 'SÁBADO'
            ELSE 'DOMINGO'
            END AS descDiaSemana,

        count(*) AS volumeTransacoes
FROM tb_dia_semana_ativo

GROUP BY diaSemana
ORDER BY volumeTransacoes DESC

LIMIT 3;

