-- saldo acumulado dos usuários
-- soma a transacao ao longo do dia
-- histórico do saldo da carteira para cada cliente
-- a soma dos pontos positivos é a receita (tudo que ja foi recebido) != saldo (receita-perdas)

WITH tb_saldo_pontos AS (

    SELECT DISTINCT IdCliente,
            substr(DtCriacao, 1, 10) AS dtDia,
            SUM(CASE WHEN QtdePontos>0 THEN QtdePontos ELSE 0 END) AS pontosPositivos,
            SUM(CASE WHEN QtdePontos<0 THEN QtdePontos ELSE 0 END) AS pontosNegativos,
            sum(QtdePontos) AS saldoPontos
    FROM transacoes

    GROUP BY IdCliente, dtDia
)

SELECT *,
        sum(saldoPontos) OVER (PARTITION BY IdCliente ORDER BY dtDia) AS saldoAcumulado,
        sum(pontosPositivos) OVER (PARTITION BY IdCliente ORDER BY dtDia) AS receita
FROM tb_saldo_pontos