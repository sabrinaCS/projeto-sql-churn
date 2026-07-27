-- Caderno 2 – Projeto Portfólio SQL
-- Análise de Churn Telecom
-- Banco utilizado: churn

-- ETAPA 1 - Visão Geral da Base
-- 1. Quantidade total de clientes.
/*R:
SELECT COUNT(*) AS Total_Clientes
FROM churn; -- Total de 7032 clientes.
*/

/*2. Quantidade de clientes que cancelaram (Churn='Yes').
R:
SELECT COUNT(*) AS Total_Clientes_Cancelados
FROM churn
WHERE Churn='Yes';
-- Resultado: 1869 Clientes Cancelaram*/


/*-3. Quantidade de clientes que permaneceram (Churn='No').
R:
SELECT COUNT(*) AS Total_Clientes_Permanentes
FROM churn
WHERE Churn='No';
-- Resultado: 5163 Clientes não canelaram o Contrato.*/


/*4. Quantidade de clientes por status de Churn (GROUP BY).
-- R:
SELECT Churn, COUNT(*) AS Total_Clientes
FROM churn
GROUP BY Churn;
-- Resultado: 1869 clientes cancelou o Contrato  e 5163 permanece com o contrato ativo*/
-- ==============================================================================================================================================================

/*--ETAPA 2 - Perfil dos Clientes
5. Clientes por gênero.
--R:
SELECT Gender,
	COUNT(*) AS Total_clientes
FROM churn
GROUP BY Gender;
/*Resultado:
Female: 3483 clientes são do gênero Feminino,
Male: 3549 clientes são do gênero Masculino
*/

/*6. Clientes Senior_Citizen = 1.
--R:
SELECT Senior_Citizen,
	COUNT(*) AS Total_Clientes
FROM churn
WHERE Senior_Citizen=1	;
/*Resultado:
Clientes Senior_citizen = 1 são 1142
*/

/*7. Clientes com Partner = 'Yes'.
--R:
SELECT Partner,
	COUNT(*) AS Total_Clientes
FROM churn
WHERE Partner='Yes';
/*Resultado:
Ao todo são 3393 clientes parceiros (Partner)
*/

/*8. Clientes com Dependents = 'Yes'.
--R:
SELECT Dependents,
	COUNT(*) AS Total_Clientes
FROM churn
WHERE Dependents='Yes';
/* Resultado:
2099 Clientes são depedentes.
*/

-- ===========================================================================================================================

/*--ETAPA 3 - Contratos
9. Quantidade de clientes por contrato.
--R:
SELECT Contract,
	COUNT(*) AS Total_Clientes
FROM churn
GROUP BY Contract;
/*Resultado:
Month-to-month : 3875 clientes
One Year : 1472 clientes
Two Year: 1685 clientes
*/

/*10. Contrato mais utilizado.
--R:
SELECT Contract,
	COUNT(*) AS Total_Clientes
FROM churn
GROUP BY Contract
ORDER BY Total_Clientes DESC;
/*Resultado:
O Contrato mais Utilizado é Month-to-month com 3875 contratos
*/

/*11. Cancelamentos por contrato.
--R:
SELECT contract,
	COUNT(*) AS Total_Cancelados
FROM churn
WHERE Churn='Yes'
GROUP BY contract;
/*Resultado:
Month-to-month: possui 1655 contratos cancelados
One Year: possui 166 contratos cancelados
Two Year: possui 48 ontratos cancelados 
*/

/*12. Contrato com maior quantidade de cancelamento.
--R:
SELECT contract,
	COUNT(*) AS Total_Cancelados
FROM churn
WHERE Churn='Yes'
GROUP BY contract
ORDER BY Total_Cancelados DESC;
/*Resultado:
A maior qnt de cancelamentos são dos contratos Month-to-month com 1655 cancelamentos
*/

-- ===========================================================================================================================

/*--ETAPA 4 - Serviços
13. Clientes por serviço de internet.
--R:
SELECT Internet_Service,
	COUNT(*) AS Total_Clientes
FROM churn
GROUP BY Internet_Service;
/*Resultado:
DSL: possui 2416 clientes
Fiber Optic: possui 3096 clientes
No: 1520 clientes não possui serviço de Internet
*/

/*14. Serviço de internet com maior quantidade de cancelamentos.
--R:
SELECT Internet_Service,
	COUNT(*) AS Total_Cancelado
FROM churn
WHERE Churn= 'Yes'
GROUP BY Internet_Service
ORDER BY Total_Cancelado DESC;
/*Resultado:
O serviço com maior quantidade de cancelametos é o serviço de Fiber Optic com 1297 contratos cancelados
*/

/*15. Clientes Fiber optic cancelados.
--R:
SELECT Internet_Service,
	COUNT(*) AS Total_Clientes
FROM churn
WHERE Internet_Service='Fiber optic' 
AND Churn='Yes';
/*Resultado;
1297 clientes que possuiam o contrato com Fiber Optic cancelaram o contrato
*/

/*16. Clientes sem Tech Support.
--R:
SELECT Tech_Support,
	COUNT(*) AS Total_Clientes
FROM churn
WHERE Tech_Support ='No';
/*Resultado:
3472 clientes não possui o serviço de Tech Support
*/

-- ===========================================================================================================================

/*--ETAPA 5 - Financeiro
17. Média da Monthly_Charges.
--R:SELECT
	AVG(Monthly_Charges) AS Média
FROM churn;

SELECT
	ROUND(AVG(Monthly_Charges),2) AS Média
FROM churn;
/*Resultado:
A média de cobrança mensal (Monthly_Charges) é 64.79820819112632 (64.8)
*/

/*18. Maior Monthly_Charges.
--R:SELECT
	MAX(Monthly_Charges) AS Maior_Valor
FROM churn;
/*Resultado:
O Maior Valor cobrado mensalmente é 118.75
*/

/*19. Menor Monthly_Charges.
--R:
SELECT
	Min(Monthly_Charges) AS Menor_Valor
FROM churn;
/*Resultado:
O Menor Valor cobrado mensalmente é 18.25
*/

/*20. Clientes com Monthly_Charges > 100.
--R:
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

-- ===========================================================================================================================

/*--ETAPA 6 - Tempo de Cliente
21. Média de Tenure.
--R:
SELECT
	AVG(Tenure)
FROM churn;

SELECT
	ROUND(AVG(Tenure),1) Média
FROM churn;
/*Resultado:
A média tenure é 32.4
*/

/*22. Clientes com Tenure < 12.
--R:
SELECT*
FROM churn
WHERE Tenure < 12;

SELECT
	COUNT(*) AS Total_Clientes
FROM churn
WHERE Tenure < 12;
/*Resultado:
2058 clientes com <12
*/

/*23. Clientes com Tenure > 60.
--R:
SELECT*
FROM churn
WHERE Tenure > 60;

SELECT
	COUNT(*) AS Total_Clientes
FROM churn
WHERE Tenure > 60;
/*Resultado:
1407 clientes com > 60
*/

/*24. Clientes com Tenure > 60 que cancelaram.
--R:
SELECT
	COUNT(*) AS Total_Clientes
FROM churn
WHERE Tenure > 60
AND churn='Yes';
/*Resultado: 
93 clientes com tenure >60 cancelaram o contrato
*/

-- ==============================================================================================================
/*--ETAPA 7 - Pagamentos
25. Forma de pagamento mais utilizada.
--R:
SELECT Payment_Method,
	COUNT(*) AS Total_Clientes
FROM churn
GROUP BY Payment_Method
ORDER BY Total_Clientes DESC;
/*Resultado:
A forma de pagamento mais utilizada é Eletronic check com 2365 clientes
*/

/*26. Forma de pagamento mais utilizada entre cancelados.
--R:
SELECT Payment_Method,
	COUNT(*) AS Total_Clientes
FROM churn
WHERE Churn='Yes'
GROUP BY Payment_Method
ORDER BY Total_Clientes DESC;
/*Resultado:
A forma de pagamento mais utilizada entre os cancelados é Eletronic check com 2365 clientes
*/

/*--ETAPA 8 - Análise de Negócio
27. Clientes de alto risco (Churn='Yes', Contract='Month-to-month', Monthly_Charges > 80).
--R:
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

/*28. Clientes fiéis (Churn='No', Tenure > 48, Contract='Two year').
--R:
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

/*29. Qual gênero cancela mais?
--R:
SELECT Gender,
	COUNT(*) AS Total_Clientes
FROM churn
WHERE Churn='Yes'
GROUP BY Gender
ORDER BY Total_Clientes DESC;
/*Resultado:
O genero que mais cancela é o Genero Feminino ( Female ) com 939 cancelamentos
*/

/*30. Top 10 maiores mensalidades.
--R:
SELECT *
FROM churn
ORDER BY Monthly_Charges DESC
LIMIT 10;


--DESAFIO FINAL
31. Responder: Quais clientes possuem maior risco de cancelar e quais características eles possuem?
--R:
SELECT *
FROM churn
WHERE Churn='Yes';

SELECT 
	CASE WHEN Tenure < 12 THEN 'Clientes Novos (12 meses)'
		WHEN Tenure BETWEEN 12 AND 48 THEN 'Clientes Intermediarios'
		ELSE 'Antigo ( > 48 meses)' END AS Perfil_Tenure,
        COUNT(*) AS Cancelados
FROM churn
WHERE Churn='Yes'
GROUP BY Perfil_Tenure
ORDER BY Cancelados DESC;
/*Resultado:
Maior parte dos cancelamentos ocorre entre clientes com menos de 12 meses de contrato.
Em seguida aparecem os clientes com permanência entre 12 e 48 meses.
Os clientes com mais de 48 meses apresentam a menor quantidade de cancelamentos, indicando maior fidelização.
*/

/*SELECT
	ROUND(AVG(Monthly_Charges),2) AS Media_Mensalidade
FROM churn
WHERE Churn='Yes';

SELECT
	ROUND(AVG(Monthly_Charges),2) AS Media_Mensalidade
FROM churn
WHERE Churn='No';
/*Resultado:
A média de mensalidade entre os cancelados é de R$ 74.44
A média de mensalidade entre os clientesd fieis é de R$ 61.31
*/




