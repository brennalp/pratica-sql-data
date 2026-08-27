DELETE FROM relatorio_diario; --deletando os dados, pode deletar registros específicos com base em filtro (group by)

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

INSERT INTO relatorio_diario --inserindo os resultados na tabela relatorio_diario

SELECT *
FROM tb_acum_cliente;

SELECT * FROM relatorio_diario; --selecionando os dados da tabela

--processo de atualizar a tabela: delete seguido do insert ou dropar a tabela depois recriar ela
-- se rodar o insert mais de uma vez vai ter dado duplicado