-- uma função de janela executa um calculo agregado com um conjunto de linhas relacionadas ao registro atual sem colapsá-las
-- preserva a identidade de cada linha e associada a métrica a elas
-- cláusula OVER -> diz ao BD qual é a janela de visão para aquela linha
-- PARTITION BY: define a definição dos grupos (um group by interno)
-- ORDER BY: define a ordem de cálculo, principalmente em rankings/somas acumuladas

-- os 3 casos mais importantes do mercado:
-- 1.Rankings de desempenho: row_number()/rank() -> identificar produto top 1 de forma mais direta
-- 2.Valores acumulados: sum() over () -> criar a métrica de faturamento acumulado mês a mês 
-- 3.Análise de tendência e tempo: lag ()/lead() -> saber o intervalo entre registros por comparação 

-- interações totais do curso de forma acumulada
-- frequencia acumulada

WITH tb_sumario_dias(

    SELECT substr(DtCriacao, 1, 10) AS DtDia,
        count(DISTINCT IdTransacao) AS qtdTransacao
    FROM transacoes

    WHERE DtCriacao >= '2025-08-25'
    AND DtCriacao < '2025-08-25'

    GROUP BY DtDia
)

SELECT *,
        sum(qtdTransacao) OVER (ORDER BY DtDia) AS transacaoAcumulada
FROM tb_sumario_dias