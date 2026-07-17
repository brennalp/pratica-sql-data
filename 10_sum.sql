-- estatísticas

-- soma de pontos de um determinado período
-- verificar se pontos são positivos ou negativos

-- uma coluna para cada critério e somou os valores
-- se colocasse para que os valores nulos fossem substituídos por zero, seriam contados como registros válidos

SELECT 
        
        sum(QtdePontos),

        sum(CASE 
            WHEN QtdePontos > 0 THEN QtdePontos
            END) AS qtdePontosPositivos,

        sum(CASE
            WHEN QtdePontos < 0 THEN QtdePontos
            END) AS qtdePontosNegativos,

        count(CASE
                WHEN QtdePontos < 0 THEN QtdePontos
                END) AS qtdeTransaçõesNegativos


FROM transacoes

WHERE DtCriacao >= '2025-07-01'
AND DtCriacao < '2025-08-01'