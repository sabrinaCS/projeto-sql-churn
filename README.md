# Projeto SQL | Análise de Churn em Telecomunicações

---

# Sobre o Projeto

Este projeto tem como objetivo analisar o comportamento de cancelamento de clientes (Churn) em uma empresa de telecomunicações utilizando SQL (MySQL) para explorar, filtrar e interpretar os dados.

A análise foi desenvolvida como projeto de portfólio com foco na prática de SQL aplicado à análise de dados e à resolução de problemas de negócio.

---

# Base de Dados

* Dataset: Telco Customer Churn
* Fonte: Kaggle
* Total de registros: 7.032 clientes
* SGBD: MySQL
* Ferramenta utilizada: MySQL Workbench

---

# Estrutura do Projeto

Projeto\_SQL\_Telco/

│

├── Base\_Dados/

│   └── WA\_Fn-UseC\_-Telco-Customer-Churn.csv

│

├── Imagens/

│   ├── 01\_Visao\_Geral.png

│   ├── 02\_Clientes\_Cancelados.png

│   ├── 03\_Contratos.png

│   ├── 04\_Financeiro.png

│   ├── 05\_Servicos.png

│   ├── 06\_Tempo\_de\_Contrato.png

│   ├── 07\_Pagamentos.png

│   ├── 08\_Analise\_de\_Negocio.png

│   └── 09\_Etapa\_Final.png

│

├── Scripts\_SQL/

│   ├── 01\_Criacao\_Banco.sql

│   ├── 02\_Importacao\_Dados.sql

│   └── 03\_Consultas\_SQL.sql

│

├── 04\_Conclusoes.md

│

└── README.md

---

# Etapas da Análise

|Etapa|Descrição|
|-|-|
|1|Visão Geral da Base|
|2|Perfil dos Clientes|
|3|Análise de Contratos|
|4|Análise de Serviços|
|5|Análise Financeira|
|6|Tempo de Permanência|
|7|Formas de Pagamento|
|8|Análise de Negócio|
|Final|Perfil de Risco de Churn|

---

# Perfil do Cliente com Maior Risco de Churn

Com base nas consultas realizadas, o perfil com maior propensão ao cancelamento apresenta as seguintes características:

* Contrato Month-to-month
* Serviço de internet Fiber Optic
* Pagamento via Electronic Check
* Menos de 12 meses de permanência
* Mensalidade acima da média da base

---

# Principais Resultados

Durante a análise foi possível identificar que:

• O contrato Month-to-month apresentou a maior quantidade de cancelamentos.

• Clientes com Fiber Optic cancelaram com maior frequência.

• Clientes com menos de 12 meses de permanência apresentaram maior risco de churn.

• Clientes que cancelaram possuem mensalidade média superior à dos clientes ativos.

• O método de pagamento Electronic Check foi o mais frequente entre os clientes cancelados.

---

# Comandos SQL Utilizados

* SELECT
* WHERE
* GROUP BY
* ORDER BY
* COUNT()
* AVG()
* MAX()
* MIN()
* CASE WHEN
* ROUND()
* BETWEEN
* LIMIT
* AND
* OR

---

# Autor

Sabrina C. Silva

Estudante de Tecnologia em Banco de Dados – Estácio

Atualmente estudando:

* SQL
* Excel
* Análise de Dados
* Power BI (em aprendizado)

