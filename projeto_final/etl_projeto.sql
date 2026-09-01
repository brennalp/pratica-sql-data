-- tabela comportamental dos nossos usuários
-- quantidade de transações históricas

WITH tb_transacoes AS ( --cria uma coluna na tabela que quer e com a conta necessária para saber a diferença de dias, fatiamento dos dados 

        SELECT IdTransacao,
                IdCliente,
                qtdePontos,
                datetime(substr(dtCriacao, 1, 19)) AS dtCriacao,
                julianday('now')-julianday(substr(DtCriacao, 1, 10)) AS diffDate
        FROM transacoes
),

tb_cliente AS (

        SELECT IdCliente,
                datetime(substr(dtCriacao,1,19)) AS dtCriacao,
                julianday('now')-julianday(substr(DtCriacao, 1, 10)) AS idadeBase
        FROM clientes
),

tb_sumario_transacoes AS (
        SELECT idCliente,
                count(DISTINCT IdTransacao) AS qtdTransacaoVida,
                count(CASE WHEN diffDate<=7 THEN idTransacao END) AS transacoesD7,
                count(CASE WHEN diffDate<=14 THEN idTransacao END) AS transacoesD14,
                count(CASE WHEN diffDate<=28 THEN idTransacao END) AS transacoesD28,
                count(CASE WHEN diffDate<=56 THEN idTransacao END) AS transacoesD56,

                min(diffDate) AS qtdUltimaTransacao,

                sum(qtdePontos) AS saldoPontos,
                sum(CASE WHEN qtdePontos>0 THEN qtdePontos ELSE 0 END) AS pontosPositivosVida,
                sum(CASE WHEN qtdePontos>0 AND diffDate<=7 THEN qtdePontos END) AS pontosPositivosD7,
                sum(CASE WHEN qtdePontos>0 AND diffDate<=14 THEN qtdePontos END) AS pontosPositivosD14
                sum(CASE WHEN qtdePontos>0 AND diffDate<=28 THEN qtdePontos END) AS pontosPositivosD28
                sum(CASE WHEN qtdePontos>0 AND diffDate<=56 THEN qtdePontos END) AS pontosPositivosD56,

                sum(CASE WHEN qtdePontos<0 THEN qtdePontos ELSE 0 END) AS pontosNegativosVida,
                sum(CASE WHEN qtdePontos<0 AND diffDate<=7 THEN qtdePontos END) AS pontosNegativosD7,
                sum(CASE WHEN qtdePontos<0 AND diffDate<=14 THEN qtdePontos END) AS pontosNegativosD14
                sum(CASE WHEN qtdePontos<0 AND diffDate<=28 THEN qtdePontos END) AS pontosNegativosD28
                sum(CASE WHEN qtdePontos<0 AND diffDate<=56 THEN qtdePontos END) AS pontosNegativosD56,


        FROM tb_transacoes
        GROUP BY idCliente;
),

tb_transacao_produto AS (

        SELECT t1.*,
                t3.DescProduto,
                t3.DescCategoriaProduto

        FROM tb_transacoes AS t1

        LEFT JOIN produto_transacao AS t2
        ON t1.IdTransacao = t2.IdTransacao

        LEFT JOIN transacoes AS t3
        ON t2.IdProduto = t3.IdProduto
),

tb_cliente_produto AS (
        SELECT IdCliente,
                DescProduto,
                count(*) AS qtdeVida,
                count(CASE WHEN diffDate<=7 THEN idTransacao END) AS qtdeD7,
                count(CASE WHEN diffDate<=14 THEN idTransacao END) AS qtdeD14,
                count(CASE WHEN diffDate<=28 THEN idTransacao END) AS qtdeD28,
                count(CASE WHEN diffDate<=56 THEN idTransacao END) AS qtdeD56
        FROM tb_transacao_produto

        GROUP BY idCliente, DescProduto
),

tb_ranking_produtos AS ( --não pode cruzar diretamente porque o cliente se repete aqui

        SELECT *,
                row_number() OVER (PARTITION BY idCliente ORDER BY qtdeVida DESC) AS rnVida,
                row_number() OVER (PARTITION BY idCliente ORDER BY qtde7 DESC) AS rn7,
                row_number() OVER (PARTITION BY idCliente ORDER BY qtde14 DESC) AS rn14,
                row_number() OVER (PARTITION BY idCliente ORDER BY qtde28 DESC) AS rn28,
                row_number() OVER (PARTITION BY idCliente ORDER BY qtde56 DESC) AS rn56

        FROM tb_cliente_produto
),

tb_join AS (

        SELECT t1.*,
                t2.idadeBase,
                t3.DescProduto AS produtoVida,
                t4.DescProduto AS produtoD7,
                t5.DescProduto AS produtoD14,
                t6.DescProduto AS produtoD28,
                t7.DescProduto AS produtoD56

        FROM tb_sumario_transacoes AS t1

        LEFT JOIN tb_cliente AS t2
        ON t1.idCliente = t2.idCliente

        LEFT JOIN tb_ranking_produtos AS t3 --left join por linha -> produto que mais comprou na vida; a tabela é a mesma, mas as linhas são diferentes
        ON t1.IdCliente = t3.idCliente
        AND rnVida = 1 --and junto com lef join filtra as linhas antes de fazer 

        LEFT JOIN tb_ranking_produtos AS t4
        ON t1.IdCliente = t4.IdCliente
        AND rn7 = 1

        LEFT JOIN tb_ranking_produtos AS t5
        ON t1.IdCliente = t5.IdCliente
        AND rn14 = 1

        LEFT JOIN tb_ranking_produtos AS t6
        ON t1.IdCliente = t6.IdCliente
        AND rn28 = 1

        LEFT JOIN tb_ranking_produtos AS t7
        ON t1.IdCliente = t7.IdCliente
        AND rn56 = 1


)




        