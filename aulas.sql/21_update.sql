-- update, modificando os registros da tabela
-- update precisa ter where para ter um critério para as modificações
-- sem o where, vai substituir todos os registros de uma vez

UPDATE relatorio_diario
SET qtdTransacao = 1000
WHERE dtDia>'2025-8-25'