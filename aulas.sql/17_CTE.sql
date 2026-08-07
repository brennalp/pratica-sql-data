-- CTE: common table expression
-- salva o resultado de uma query em uma tabela temporária
--saber se os clientes do primeiro dia estão no último dia

--melhor que a subquery por filtrar parcelas das bases e permitir cruzamento 

WITH tb_cliente_primeiro_dia AS ( --tabela dos clientes do primeiro dia
    SELECT DISTINCT IdCliente
    FROM transacoes
    WHERE substr(DtCriacao, 1, 10) = '2025-08-25'
),

tb_cliente_ultimo_dia AS ( --tabela dos clientes do último dia
    SELECT DISTINCT IdCliente
    FROM transacoes
    WHERE substr(DtCriacao, 1, 10) = '2025-08-29'
), 

tb_join AS ( --tabela do join para saber se os clientes do primeiro são os mesmos dos clientes do último
    SELECT 
        t1.IdCliente AS primCliente,
        t2.IdCliente AS ultCliente

    FROM tb_cliente_primeiro_dia AS t1

    LEFT JOIN tb_cliente_ultimo_dia AS t2
    ON t1.IdCliente = t2.IdCliente

)

--métricas para saber a qtd de clientes no primeiro e ultimo dia e o aproveitamento

SELECT count(primCliente),
        count(ultCliente),
        1.*count(ultCliente)/count(primCliente)

FROM tb_join