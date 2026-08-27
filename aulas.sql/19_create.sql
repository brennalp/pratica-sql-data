-- .tables : mostra as tabelas salvas/criadas
-- alterando o banco de dados com insert into, create table, drop table, delete, truncate, update

DROP TABLE IF EXISTS relatorio_diario; --apaga quando existir para poder atualizar 

CREATE TABLE IF NOT EXISTS relatorio_diario AS --criando tabelas a partir de uma query

WITH tb_qtd_cliente AS (
    SELECT substr(DtCriacao, 1, 10) AS dtDia,
        count(DISTINCT IdCliente) AS qtdCliente
    FROM clientes

    GROUP BY dtDia
    ORDER BY dtDia
),

tb_acum_cliente AS(
    SELECT *,
        sum(qtdCliente) OVER (ORDER BY dtDia) AS acumCliente
    FROM tb_qtd_cliente
)

SELECT *
FROM tb_acum_cliente;

SELECT * FROM relatorio_diario;

-- truncate ou delete: limpa os registros da tabela, mas ela ainda existe 

DELETE FROM relatorio_diario;

.tables

.schema relatorio_diario; --mostra as colunas da tabela 