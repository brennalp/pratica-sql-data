--qual o valor de pontos positivos por dia?

SELECT  
        datetime(substr(DtCriacao, 1, 10)) AS dtFormatada, --DE 1 A 10 EU PEGO SO A DATA REAL
        sum(qtdePontos) AS ptPositvos

FROM clientes

WHERE qtdePontos>0

GROUP BY datetime(substr(DtCriacao, 1, 10))

ORDER BY sum(qtdePontos) DESC

LIMIT 10; -- os 10 dias com maiores quantidades de pontos positivos


--qual o valor médio de pontos positivos por dia?

SELECT  
        count(substr(DtCriacao, 1, 10)) AS diasRepetidos,
        count(DISTINCT(substr(DtCriacao, 1, 10))) AS diasUnicos,
        sum(qtdePontos) AS ptPositvos,
        sum(qtdePontos)/count(DISTINCT(substr(DtCriacao, 1, 10))) AS valorMedio

FROM clientes

WHERE qtdePontos>0;

-- qual o valor médio de pontos positivos de cada dia?

SELECT 
        substr(DtCriacao, 1, 10) AS dtDia,
        AVG(qtdePontos) AS avgpontosDia

FROM clientes

WHERE qtdePontos>0

GROUP BY substr(DtCriacao, 1, 10)

ORDER BY 1 DESC; --ordenar pela primeira coluna, também pode fazer assim com o group by

