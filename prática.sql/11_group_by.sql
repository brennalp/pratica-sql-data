/* WHERE trabalha no nível individual (Linha por Linha): 
Ele olha para cada linha da sua tabela e decide: "Você entra no resultado ou é descartada?". 
Ele filtra antes de qualquer conta ser feita.

GROUP BY trabalha no nível de grupo (Baldes/Sacolas): 
Ele pega as linhas que restaram e as junta em "baldes" baseados em um valor igual. 
Depois que agrupou, você geralmente usa funções como SUM(), COUNT() ou AVG() para dar um veredito sobre aquele grupo.

SELECT IdCliente, 
       SUM(QtdePontos) AS TotalPontos
FROM transacoes
WHERE DtCriacao >= '2025-07-01'  Filtra as linhas individuais primeiro
GROUP BY IdCliente;              Agrupa o que sobrou pelo cliente*/

-- quantos clientes tem email cadastrado? possíveis respostas

SELECT IdCliente,
        flEmail

FROM clientes

WHERE flEmail == '1';


SELECT sum(flEmail)
FROM clientes;

SELECT count(*)
FROM clientes
WHERE flEmail = 1;

