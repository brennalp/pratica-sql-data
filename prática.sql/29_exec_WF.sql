-- fazer soma acumulada de transações por cliente e por dia

WITH tb_cliente_dia AS ( --agrupar por cliente e por dia pra ver a qtd de transacoes 

    SELECT IdCliente,
            substr(DtCriacao, 1, 10) AS dtDia,
            count(DISTINCT IdTransacao) AS qtdTransacao

    FROM transacoes

    WHERE dtCriiacao >= '2025-08-25'
    AND dtCriacao > '2025-08-30'

    GROUP BY IdCliente, dtDia
),

tb_lag AS ( --da a soma acumulada de transacoes e empurra o registro anterior para baixo para poder comparar em outra operação

    SELECT *,
        sum(qtdTransacao) OVER (PARTITION BY IdCliente ORDER BY dtDia) AS acum, --vai somando as transações por dia de cada cliente
        lag(qtdTransacao) OVER (PARTITION BY IdCliente ORDER BY dtDia) AS lagTransacao --compara um registro com outro (retorno - medir tendencia)

    FROM tb_cliente_dia
)

SELECT *,
        1*.qtdTransacao/lagTransacao --a proporção para saber se o engajamento ta aumentando e diminuindo
FROM tb_cliente_dia
