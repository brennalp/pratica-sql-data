-- agrupando por idproduto

/*SELECT IdProduto,
        count(*) as QtdProduto

FROM transacao_produto

GROUP BY IdProduto*/

-- primeiro seleciona as colunas da tabela
-- depois filtra
-- agrupa
-- e ordena
-- pode cortar em qtd de linhas 

SELECT IdCliente,
        sum(QtdePontos) AS somaPontos, 
        count(IdTransacao) AS QtdTransacao

FROM transacoes

WHERE DtCriacao>='2025-07-01'
AND DtCriacao<'2025-08-01'

GROUP BY IdCliente -- order by mostra o mesmo cliente fazendo varias transações unicas
HAVING sum(QtdePontos)>4000 -- FILTRAR DEPOIS DE TER AGRUPADO/ where do group by

ORDER BY sum(QtdePontos) DESC --ordem é a última coisa que aparece

LIMIT 10 -- os 10 primeiros dps de ordenar


