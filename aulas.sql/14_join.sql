-- qual a categoria de produtos mais vendidos
-- olhar para a tabela de transacoes e buscar a informação da tabela 
--achar o correspondente dos dados da esquerda na tabela da direita
-- faz a associação entre cada tipo de dado pelo formato
-- os que não derem match serão null
-- inner join -> retorna apenas o que for entre os dois

SELECT 
        t2.DescCategoriaProduto,
        count(DISTINCT t1.IdProduto) AS qtdVendas

FROM transacao_produto AS t1 --sempre a tabela da esquerda

LEFT JOIN produtos as t2 
ON t1.IdProduto = t2.IdProduto

GROUP BY t2.DescCategoriaProduto 
ORDER BY count(DISTINCT t1.IdProduto) DESC
