-- gerando uma tabela a partir de outra tabela
-- fazer um consulta em cima do resultado de outra 
-- o filtro da consulta advém do resultado de outra consulta
-- a consulta executada primeiro é a que ta dentro do where
-- execução de dentro pra fora
-- ser bom ou não vai depender do volume de dados que a subquery tras -> se vai ver uma tabela com muitos registros/retorna poucos dados

SELECT *

FROM transacao_produto AS t1

WHERE t1.IdProduto IN ( -- =

    SELECT IdProduto
    FROM produtos
    WHERE DescProduto = 'Resgatar Ponei'
) --condição dentro do where o resultado de uma outra query

--compara os valores da coluna que advém do resultado da query em relação à coluna filtrada no where