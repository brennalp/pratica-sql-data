-- WHERE DescProduto LIKE 'Venda de%'

-- Com string que inicia "Venda de%"
-- String que termina "%Lover"
-- String que contem algo "%Chapeu%"

SELECT  IdProduto,
        DescNomeProduto

FROM produtos

WHERE DescNomeProduto LIKE '%Chapéu%'

-- like não é case sensitive