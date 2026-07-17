-- quantos produtos são de rpg -> essa coluna não existe mais

SELECT count(*)

FROM produtos;

WHERE DescDescricaoProduto == '%rpg%';

SELECT DescDescricaoProduto,
        count(*)

FROM produtos

GROUP BY DescDescricaoProduto;

