-- quem iniciou o curso no primeiro dia, em média assistiu quantas aulas?

WITH tb_prim_dia AS (--participou da primeira aula

    SELECT DISTINCT IdCliente 
    FROM transacoes
    WHERE substr(dtCriacao, 1, 10) = '2025-08-25'

),

tb_dias_cursos AS ( --pegando apenas uma pessoa por dia, o order by mostra a mesma pessoa em cada dia (participou do curso todo)

    SELECT DISTINCT IdCliente,
            substr(DtCriacao, 1, 10) AS presenteDia
    FROM transacoes
    WHERE dtCriacao >= '2025-08-25'
    AND dtCriacao < '2025-08-30'

    ORDER BY IdCliente, presenteDia
)

--partindo da galera que começou no primeiro dia e cruzando com a de dias de curso (quem participou no primeiro dia, quem voltou)

tb_cliente_dias AS (
    SELECT t1.Idcliente,
        count(DISTINCT t2.presenteDia) AS qtdeDias
    FROM tb_prim_dia AS t1

    LEFT JOIN tb_dias_cursos AS t2
    ON t1.IdCliente = t2.IdCliente

    GROUP BY t1.IdCliente
)

--o calculo da media 
SELECT avg(presenteDia),
        max(qtdDias),
        min(qtdeDias)
FROM tb_cliente_dias

