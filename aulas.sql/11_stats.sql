-- average - média e round -> arredonda

SELECT round(avg(QtdePontos),2) as mediaCarteira,
        min(QtdePontos) as minCarteira,
        max(QtdePontos) AS maxCarteira,
        sum(FlTwitch) as comTwitch,
        sum(FlEmail) as comEmail
    
FROM clientes
