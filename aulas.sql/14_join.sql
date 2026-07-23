-- qual a categoria de produtos mais vendidos
-- olhar para a tabela de transacoes e buscar a informação da tabela produto

SELECT 
        t2.DescCategoriaProduto,
        count(DISTINCT t1.IdProduto) AS qtdVendas

FROM transacao_produto AS t1 --sempre a tabela da esquerda

LEFT JOIN produtos as t2 
ON t1.IdProduto = t2.IdProduto

GROUP BY t2.DescCategoriaProduto 
ORDER BY count(DISTINCT t1.IdProduto) DESC
