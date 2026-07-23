-- um case gera uma coluna

SELECT IdCliente,
       QtdePontos,

       CASE
           WHEN QtdePontos <= 500 THEN 'Ponei'
           WHEN QtdePontos <= 1000 THEN 'Ponei premium'
           WHEN QtdePontos <= 5000 THEN 'Mago aprendiz'
           WHEN QtdePontos <= 10000 THEN 'Mago mestre'
           ELSE 'Mago Supremo'
       END AS NomeGrupo,

       CASE
            WHEN QtdePontos<= 1000 THEN 1
            ELSE 0
        END AS flPonei,

        CASE 
            WHEN QtdePontos>1000 THEN 1
            ELSE 0
        END AS flMago

FROM clientes

WHERE flMago = 1

ORDER BY QtdePontos DESC;