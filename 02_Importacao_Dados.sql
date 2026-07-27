-- =================================================
-- Projeto SQL - Analise de Churn(Telecon)
-- Autor: Sabrina Silva
-- Objetivo: Importar os dados para a tabela churn
-- =================================================

INSERT INTO churn
SELECT * FROM `wa_fn-usec_-telco-customer-churn`;

-- Conferir se os dados foram importados corretamente
SELECT * FROM churn;

-- Verificar se a quantidade de dados importados esta correto
SELECT COUNT(*) FROM churn;


