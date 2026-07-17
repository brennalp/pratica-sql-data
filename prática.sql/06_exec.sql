SELECT  idCliente,
        qtdePontos

FROM clientes

-- WHERE qtdePontos >= 100 AND qtdePontos <=200

WHERE qtdePontos BETWEEN 100 AND 200; 
--MESMA COISA DA EXPRESSAO ACIMA
