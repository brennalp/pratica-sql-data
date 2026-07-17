SELECT IdTransacao,
        DtCriacao,
        substr(DtCriacao, 1, 11) AS DtFatiada,
        datetime(substr(DtCriacao, 1, 11)) AS DtFormatada,
        strftime('%w', datetime(substr(DtCriacao, 1, 11))) as diaSemana

FROM transacoes

WHERE diaSemana IN ('6','0') --final de semana

