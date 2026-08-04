-- quais clientes mais perderam pontos por lover?

SELECT 

        t1.IdCliente AS cliente,
        sum(t1.QtdePontos) AS totalPontos


FROM transacoes AS t1

LEFT JOIN transacao_produto as t2
ON t1.IdTransacao = t2.IdTransacao

LEFT JOIN produtos AS t3
ON t2.IdProduto = t3.IdProduto

WHERE t3.DescCategoriaProduto = 'lovers' --não é possível colocar funções de agregação no where

GROUP BY t1.IdCliente
HAVING sum(t1.QtdePontos)<0 --filtro depois do agrupamento para retornar apenas valores negativos de saldo

ORDER BY sum(t1.QtdePontos) ASC

LIMIT 5;
