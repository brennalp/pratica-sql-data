-- ordenar as linhas da tabela, desc deixa em ordem descrescente

/*SELECT idCliente,
        qtdePontos

FROM clientes

ORDER BY QtdePontos DESC 

limit 10;*/

-- mais antigo pro mais novo e de quem tem mais pontos ou menos pontos

SELECT * FROM clientes

WHERE flTwitch = 1 --primeiro escolhe as linhas para depois ordenar

ORDER BY DtCriacao ASC, QtdePontos DESC

LIMIT 10; 

