-- qual o saldo de pontos acumulados de cada usuário?
-- so é interessante quando se quer saber o fluxo de cada usuário, quantos tem mais pontos positivos
-- ou mais pontos negativos 
-- seria preciso um full join para pegar todos os clientes que tem positivos e/ou negativos
-- sqlite não aceita full join
-- aqui eu so to fazendo o saldo de quem tinha pontos positivos

WITH tb_pontos_positivos AS (

    SELECT DISTINCT IdCliente,
        sum(QtdePontos) AS pontosPositivos

    FROM transacoes

    WHERE QtdePontos>0

    GROUP BY IdCliente
),

tb_pontos_negativos AS (

    SELECT DISTINCT IdCliente,
        sum(QtdePontos) AS pontosNegativos

    FROM transacoes

    WHERE QtdePontos<0

    GROUP BY IdCliente
),

tb_saldo_de_pontos AS (

    SELECT t1.*,
            IFNULL(t2.pontosNegativos, 0) AS pontosNeg,
            t1.pontosPositivos + IFNULL(t2.pontosNegativos, 0) AS saldoPontos

    FROM tb_pontos_positivos AS t1

    LEFT JOIN tb_pontos_negativos AS t2
    ON t1.IdCliente = t2.IdCliente
)

SELECT *
FROM tb_saldo_de_pontos