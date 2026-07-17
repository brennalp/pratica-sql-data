-- olha para todas as colunas colocadas na query 
-- registros únicos da linha
-- vai trazer apenas combinações distintas de valores das linhas
-- podem criterios diferentes para selecionar os distintos: a cor, o formato - carac e podem se combinar

SELECT COUNT(DISTINCT FlTwitch)

FROM clientes;

SELECT 
        COUNT(*),
        COUNT (DISTINCT IdTransacao),
        COUNT(DISTINCT IdCliente),
        COUNT(DtCriacao)

FROM transacoes

WHERE DtCriacao>= '2025-07-01'
AND DtCriacao<'2025-08-01';