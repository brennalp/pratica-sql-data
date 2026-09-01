-- tabela comportamental dos nossos usuários

SELECT idCliente,
        count(DISTINCT qtdTransacoes),
        count(CASE
                WHEN julianday('now')-julianday(substr(DtCriacao, 1, 10))<=7 THEN idTransacao
                END) AS transacoesD7,
        count(CASE
                WHEN julianday('now')-julianday(substr(DtCriacao, 1, 10))<=28 THEN idTransacao
                END) AS transacoesD28,
FROM transacoes

GROUP BY idCliente