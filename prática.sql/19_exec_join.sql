-- em 2024, quantas transações de Lovers tivemos?

SELECT count(DISTINCT t1.IdTransacao) AS qtdLovers
        --t1.IdCliente,
        --t2.IdProduto,
        --t3.DescCategoriaProduto

FROM transacoes AS t1

LEFT JOIN transacao_produto AS t2
ON t1.IdTransacao = t2.IdTransacao

LEFT JOIN produtos AS t3
ON t2.IdProduto = t3.IdProduto

WHERE t1.DtCriacao LIKE '2024%'
AND t3.DescCategoriaProduto = 'lovers'