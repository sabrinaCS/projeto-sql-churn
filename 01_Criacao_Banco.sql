-- =============================================
-- Projeto SQL - Analise de churn (Telecon)
-- Autor: Sabrina Silva
-- Objetivo: Criar Estrutura do Banco de Dados
-- =============================================

CREATE TABLE churn(
Customer_Id VARCHAR(15),
Gender VARCHAR (10),
Senior_Citizen INTEGER,
Partner VARCHAR(3),
Dependents VARCHAR(3),
Tenure INTEGER,
Phone_Service VARCHAR(3),
Multiple_Lines VARCHAR(20),
Internet_Service VARCHAR(15),
Online_Security VARCHAR(30),
Online_Backup VARCHAR(30),
Device_Protection VARCHAR(30),
Tech_Support VARCHAR(30),
Streaming_Tv VARCHAR(30),
Streaming_Movies VARCHAR(30),
Contract VARCHAR(30),
Paperless_Billing VARCHAR(3),
Payment_Method VARCHAR(40),
Monthly_Charges DOUBLE,
Total_Charges DOUBLE,
Churn VARCHAR(3)
);

