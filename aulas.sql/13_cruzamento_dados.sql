-- tabela da esq é o primeiro select e a tabela da direita é o segundo
-- se os dados não corresponderem: tem como deixar o dado nulo, tirar os que não deram match
-- SELECT * FROM -> tabela da esquerda
-- JOIN ... ON ... -> tabela da direita 

-- LEFT JOIN -> a referencia é a tabela da esquerda, a que é selecionada primeiro no FROM
-- busca a tabela da direita por informações que vão dar match com a tabela da esquerda
-- se não encontrar a info, é deixada vazia

--INNER JOIN -> match de 100%, se tiver valor nulo vai ser apagado

-- RIGHT JOIN -> a referencia é a tabela da direita
-- o mesmo de SELECT * FROM clientes LEFT JOIN vendas
-- SELECT * FROM vendas RIGHT JOIN clientes

-- EM GERAL: left join e inner join
-- parte de uma tabela e se busca a informação por uma expressão de igualdade

SELECT * 

FROM transacao_produto

LEFT JOIN produtos -- SE COLOCAR INNER, É A INTERSEÇÃO
ON transacao_produto.IdProduto = produtos.IdProduto

LIMIT 10;

SELECT t1.*, --todas as colunas de t1
        t2.DescProduto

FROM transacao_produto AS t1

LEFT JOIN produtos AS t2
ON t1.IdProduto = t2.IdProduto

LIMIT 10;