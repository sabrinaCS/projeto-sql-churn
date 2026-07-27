-- ============================================
-- Projeto SQL -  Analise de churn (Telecon)
-- Autor: Sabrina Silva
-- Objetivo: Analise de Negócios
-- =============================================

-- ===============================
 -- ETAPA 1 - Visão Geral da Base
-- ================================
-- 1) - Total de clientes
SELECT
	COUNT(*) AS Total_Clientes
FROM churn;
/*Resultado: 
A Base possui 7032 Clientes
*/

-- 2)- Quantidade de clientes que cancelaram
SELECT 
	COUNT(*) AS Total_Clientes_Cancelados
FROM churn
WHERE Churn='Yes';
/*Resultado: 
1869 Clientes Cancelaram o contrato
*/

-- 3)- Quantidade de clientes que permaneceram 
SELECT 
	COUNT(*) AS Total_Clientes_Permanentes
FROM churn
WHERE Churn='No';
/*Resultado:
5163 Clientes não cancelaram o Contrato
*/

-- 4)- Quantidade de clientes por status de Churn 
SELECT Churn, 
	COUNT(*) AS Total_Clientes
FROM churn
GROUP BY Churn;
/* Resultado:
Yes: 1869 clientes cancelaram o contrato.
No: 5163 clientes permanecem com o contrato ativo.
*/

-- ===============================
-- ETAPA 2 - Perfil dos Clientes
-- ================================

-- 5)- Clientes por gênero
SELECT Gender,
	COUNT(*) AS Total_Clientes
FROM churn
GROUP BY Gender;
/*Resultado:
Female: 3483 clientes são do gênero Feminino,
Male: 3549 clientes são do gênero Masculino
*/

-- 6)- Clientes Senior_Citizen = 1
SELECT Senior_Citizen,
	COUNT(*) AS Total_Clientes
FROM churn
WHERE Senior_Citizen=1;
/*Resultado:
Clientes Senior_citizen = 1 são 1142
*/

-- 7)- Clientes com Partner = 'Yes'
SELECT Partner,
	COUNT(*) AS Total_Clientes
FROM churn
WHERE Partner='Yes';
/*Resultado:
Ao todo são 3393 clientes parceiros (Partner)
*/

-- 8)- Clientes com Dependents = 'Yes'
SELECT Dependents,
	COUNT(*) AS Total_Clientes
FROM churn
WHERE Dependents='Yes';
/* Resultado:
2099 Clientes são dependentes
*/

-- ========================
-- ETAPA 3 - Contratos
-- ========================

-- 	9)- Quantidade de clientes por contrato
SELECT Contract,
	COUNT(*) AS Total_Clientes
FROM churn
GROUP BY Contract;
/*Resultado:
Month-to-month : 3875 clientes
One Year : 1472 clientes
Two Year: 1685 clientes
*/

-- 10)- Contrato mais utilizado
SELECT Contract,
	COUNT(*) AS Total_Clientes
FROM churn
GROUP BY Contract
ORDER BY Total_Clientes DESC;
/*Resultado:
O Contrato mais Utilizado é Month-to-month com 3875 contratos
*/

-- 11)- Cancelamentos por contrato
SELECT contract,
	COUNT(*) AS Total_Cancelados
FROM churn
WHERE Churn='Yes'
GROUP BY contract;
/*Resultado:
Month-to-month: possui 1655 contratos cancelados
One Year: possui 166 contratos cancelados
Two Year: possui 48 contratos cancelados 
*/

-- 12)- Contrato com maior quantidade de cancelamento
SELECT contract,
	COUNT(*) AS Total_Cancelados
FROM churn
WHERE Churn='Yes'
GROUP BY contract
ORDER BY Total_Cancelados DESC;
/*Resultado:
A maior quantidade de cancelamentos são dos contratos Month-to-month com 1655 cancelamentos
*/

-- ========================
-- ETAPA 4 - Serviços
-- ========================
-- 13)- Clientes por serviço de internet.
SELECT Internet_Service,
	COUNT(*) AS Total_Clientes
FROM churn
GROUP BY Internet_Service;
/*Resultado:
DSL: 2416 clientes.
Fiber optic: 3096 clientes.
Sem serviço de internet: 1520 clientes.
*/

-- 14)- Serviço de internet com maior quantidade de cancelamentos
SELECT Internet_Service,
	COUNT(*) AS Total_Cancelado
FROM churn
WHERE Churn= 'Yes'
GROUP BY Internet_Service
ORDER BY Total_Cancelado DESC;
/*Resultado:
O serviço com maior quantidade de cancelamentos é o serviço de Fiber Optic com 1297 contratos cancelados
*/

-- 15)- Clientes Fiber optic cancelados
SELECT Internet_Service,
	COUNT(*) AS Total_Clientes
FROM churn
WHERE Internet_Service='Fiber optic' 
AND Churn='Yes';
/*Resultado;
1297 clientes que possuiam o contrato com Fiber Optic cancelaram o contrato
*/

-- 16)- Clientes sem Tech Support
SELECT Tech_Support,
	COUNT(*) AS Total_Clientes
FROM churn
WHERE Tech_Support ='No';
/*Resultado:
3472 clientes não possui o serviço de Tech Support
*/

-- ==========================
-- ETAPA 5 - Financeiro
-- ==========================
-- 17)- Média da Monthly_Charges
SELECT
	AVG(Monthly_Charges) AS Média
FROM churn;

SELECT
	ROUND(AVG(Monthly_Charges),2) AS Média
FROM churn;
/*Resultado:
A média da mensalidade dos clientes é R$ 64,80.
*/

-- 18)- Maior Monthly_Charges
SELECT
	MAX(Monthly_Charges) AS Maior_Valor
FROM churn;
/*Resultado:
O maior valor de mensalidade é R$ 118,75.
*/

-- 19)-  Menor Monthly_Charges
SELECT
	Min(Monthly_Charges) AS Menor_Valor
FROM churn;
/*Resultado:
A menor mensalidade encontrada foi R$ 18,25.
*/

-- 20)-  Clientes com Monthly_Charges > 100
SELECT*
FROM churn
WHERE Monthly_Charges > 100;

SELECT 
	COUNT(*) AS Total_Clientes
FROM churn
WHERE Monthly_Charges > 100;
/*Resultado:
902 clientes pagam mensalidade acima de 100
*/

-- ===========================
-- ETAPA 6 - Tempo de Cliente
-- ===========================
-- 21)-  Média de Tenure
SELECT
	AVG(Tenure)
FROM churn;

SELECT
	ROUND(AVG(Tenure),1) Média_Tenure
FROM churn;
/*Resultado:
A média de permanência dos clientes (Tenure) é de 32,4 meses.
*/

-- 22)- Clientes com Tenure < 12
SELECT*
FROM churn
WHERE Tenure < 12;

SELECT
	COUNT(*) AS Total_Clientes
FROM churn
WHERE Tenure < 12;
/*Resultado:
2058 clientes possuem menos de 12 meses de contrato.
*/

-- 23)- Clientes com Tenure > 60
SELECT*
FROM churn
WHERE Tenure > 60;

SELECT
	COUNT(*) AS Total_Clientes
FROM churn
WHERE Tenure > 60;
/*Resultado:
1407 clientes possuem mais de 60 meses de contrato.
*/

-- 24)-  Clientes com Tenure > 60 que cancelaram
SELECT
	COUNT(*) AS Total_Clientes
FROM churn
WHERE Tenure > 60
AND churn='Yes';
/*Resultado: 
93 clientes com mais de 60 meses de contrato cancelaram o serviço.
*/

-- ======================
-- ETAPA 7 - Pagamentos
-- ======================
-- 25)- Forma de pagamento mais utilizada
SELECT Payment_Method,
	COUNT(*) AS Total_Clientes
FROM churn
GROUP BY Payment_Method
ORDER BY Total_Clientes DESC;
/*Resultado:
A forma de pagamento mais utilizada é Eletronic check com 2365 clientes
*/

-- 26)- Forma de pagamento mais utilizada entre cancelados
SELECT Payment_Method,
	COUNT(*) AS Total_Clientes
FROM churn
WHERE Churn='Yes'
GROUP BY Payment_Method
ORDER BY Total_Clientes DESC;
/*Resultado:
A forma de pagamento mais utilizada entre os cancelados é Eletronic check com 2365 clientes
*/

-- ==============================
-- ETAPA 8 - Análise de Negócio
-- ==============================
-- 27)- Clientes de alto risco (Churn='Yes', Contract='Month-to-month', Monthly_Charges > 80)
SELECT*
FROM churn
WHERE Churn='Yes'
AND Contract='Month-to-month'
AND Monthly_Charges > 80;

SELECT
	COUNT(*) AS Total_Clientes
FROM churn
WHERE Churn='Yes'
AND Contract='Month-to-month'
AND Monthly_Charges > 80;
/*Resultado:
764 clientes tem alto risco de cancelamento
*/

-- 28)- Clientes fiéis (Churn='No', Tenure > 48, Contract='Two year')
SELECT*
FROM churn
WHERE Churn='No'
AND Tenure > 48
AND Contract='Two year';

SELECT
	COUNT(*) AS Total_clientes
FROM churn
WHERE Churn='No'
AND Tenure > 48
AND Contract='Two year';
/*Resultado:
1221 clientes são fieis
*/

-- 29)- Qual gênero cancela mais?
SELECT Gender,
	COUNT(*) AS Total_Clientes
FROM churn
WHERE Churn='Yes'
GROUP BY Gender
ORDER BY Total_Clientes DESC;
/*Resultado:
O genero que mais cancela é o Genero Feminino ( Female ) com 939 cancelamentos
*/

-- 30)-  Top 10 maiores mensalidades
SELECT *
FROM churn
ORDER BY Monthly_Charges DESC
LIMIT 10;

-- ==============
-- ETAPA FINAL - Perfil dos Clientes com Maior Risco de Churn
-- ==============
-- Quais clientes possuem maior risco de cancelar e quais características eles possuem?
SELECT *
FROM churn
WHERE Churn='Yes';
/*Consulta utilizada para visualizar o perfil dos clientes que cancelaram o serviço.*/

SELECT 
	CASE WHEN Tenure < 12 THEN 'Até 12 meses'
		WHEN Tenure BETWEEN 12 AND 48 THEN 'Entre 12 a 48 meses'
		ELSE 'Acima de 48 meses' 
        END AS Perfil_Tenure,
        COUNT(*) AS Cancelados
FROM churn
WHERE Churn='Yes'
GROUP BY Perfil_Tenure
ORDER BY Cancelados DESC;
/*Resultado:
A maior concentração de cancelamentos ocorre entre clientes com até 12 meses de permanência.
Clientes com tempo de permanência entre 12 e 48 meses representam o segundo maior grupo de cancelamentos.
Já os clientes com mais de 48 meses apresentam a menor quantidade de cancelamentos, indicando maior fidelização.
*/

SELECT
	ROUND(AVG(Monthly_Charges),2) AS Media_Mensalidade
FROM churn
WHERE Churn='Yes';

SELECT
	ROUND(AVG(Monthly_Charges),2) AS Media_Mensalidade
FROM churn
WHERE Churn='No';
/* Resultado:
A média da mensalidade dos clientes que cancelaram é de R$ 74,44.
Entre os clientes que permaneceram, a média é de R$ 61,31.
Isso indica que, nesta base de dados, clientes com mensalidades mais altas tendem a cancelar com maior frequência.
*/