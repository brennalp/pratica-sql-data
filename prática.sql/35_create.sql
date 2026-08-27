-- ciclo completo de criação da tabela
-- tabela para saber clientes ativos nos últimos 28 dias
-- evita que várias querys fiquem sendo executadas no BD e que as pessoas fiquem alterando os cálculos pras regras de negócio

DROP TABLE IF EXISTS clientes_d28;

CREATE TABLE IF NOT EXISTS clientes_d28 (
    IdCliente varchar (250) PRIMARY KEY,
    QtdeTransacoes INTEGER
);

DELETE FROM clientes_d28;

INSERT INTO clientes_d28 --inseridos com base na query, centraliza a informação por ja estar definida por regra de negócio

SELECT IdCliente,
        count(DISTINCT IdTransacao) AS QtdeTransacoes
FROM QtdeTransacoes
WHERE julianday('now') - julianday(substr(DtCriacao, 1, 10))<=28
GROUP BY IdCliente;

SELECT * FROM clientes_d28;