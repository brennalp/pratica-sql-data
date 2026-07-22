--qual produto mais transacionado

SELECT  IdTransacaoProduto,
        IdProduto,
        COUNT(IdTransacaoProduto) AS qtdVendas 

FROM transacao_produto

GROUP BY IdProduto

ORDER BY 3 DESC