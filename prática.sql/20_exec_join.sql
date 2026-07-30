-- qual mes tivemos mais lista de presença assinada
-- as tabelas estão diferentes da época 

SELECT 

    substr(t1.DtCriacao, 1, 7) AS mesData,
    count(DISTINCT t1.IdTransacao) AS qtdTransacao


FROM transacoes AS t1

LEFT JOIN transacao_produto AS t2
ON t1.IdTransacao = t2.idTransacao

LEFT JOIN produtos AS t3
ON t2.IdProduto = t3.IdProduto

WHERE t3.DescCategoriaProduto = 'Lista de presença'

GROUP BY substr(t1.DtCriacao, 1, 7)

ORDER BY count(DISTINCT t1.IdTransacao) DESC

