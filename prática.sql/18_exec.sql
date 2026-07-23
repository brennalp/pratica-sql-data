--qual produto com mais pontos transacionados

SELECT IdProduto,
        sum(vlProduto*QtdeProduto) AS qtdPontos,
        sum(QtdeProduto) AS qtdvenda

FROM transacao_produto

GROUP BY IdProduto

ORDER BY sum(vlProduto) DESC