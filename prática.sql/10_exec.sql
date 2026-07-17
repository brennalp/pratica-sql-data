SELECT idTransacaoProduto,
        COUNT(vlProduto),

        CASE
        WHEN vlProduto<10 THEN 'Baixo'
        WHEN vlProduto<500 THEN 'Médio'
        ELSE 'Alto'
        END AS vlCategoria

FROM transacao_produto

WHERE vlCategoria == 'Baixo'

