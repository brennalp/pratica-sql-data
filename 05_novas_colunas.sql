-- não modifica a tabela

SELECT *,
        QtdePontos+10,
        QtdePontos*2

FROM clientes;


SELECT idCliente,
        qtdePontos,
        qtdePontos+10 AS QtdPontosPlus10,
        qtdePontos*2 AS QtdPontosDobro,
        DtCriacao, 
        datetime(substr(DtCriacao, 1,19)) AS dtCriacaoNova -- 

FROM clientes;

SELECT DtCriacao,
        substr(DtCriacao, 1, 19) AS strFatiada,
        datetime(substr(DtCriacao, 1, 19)) AS dataFormatada,
        strftime('%w',  datetime(substr(DtCriacao, 1, 19))) AS diaSemana

FROM clientes;


