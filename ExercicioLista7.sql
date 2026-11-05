--** Exercício 1 — Pizzaria (continuação da Aula 07).No banco Pizzaria:

Use Pizzaria;


--1. Todas as pizzas da mais cara para a mais barata.

SELECT * FROM PIZZA
ORDER BY preco DESC


--2. As 3 pizzas mais baratas.

SELECT TOP 3 * FROM PIZZA
ORDER BY preco ASC


--3. Pizzas com preço entre R $50 e R$ 60.

SELECT *
FROM PIZZA 
WHERE preco BETWEEN 50 AND 60


--4. Clientes que moram no Centro ou no Jardim.

SELECT *
FROM CLIENTE 
WHERE bairro IN ('Centro', 'Jardim')
-- ou  (bairro = 'Centro' or bairro = 'Jardim')


--5. Pedidos feitos em outubro de 2026.

SELECT *
FROM PEDIDO
WHERE data_pedido BETWEEN '2026-10-01' AND '2026-10-31'


--6. Quantos pedidos cada cliente fez (cpf e quantidade), do maior para o menor.

SELECT cpf_cliente, COUNT (*) as total_vendido
FROM PEDIDO
GROUP BY cpf_cliente
ORDER BY total_vendido desc


--7. Quantas pizzas (soma das quantidades) foram vendidas de cada código de pizza. *

SELECT codigo_pizza as codigo,
       SUM(quantidade) as qtd_pedido
FROM ITEM_PEDIDO
GROUP BY codigo_pizza


--8. Entregadores (matrícula) que fizeram mais de 2 entregas.

SELECT matricula_entregador, COUNT (*) as total
from PEDIDO
GROUP BY matricula_entregador
ORDER BY total asc

-- ou

SELECT matricula_entregador, COUNT (*) as total
from PEDIDO
GROUP BY matricula_entregador
HAVING COUNT (*) > 2
ORDER BY total asc


--9. Preço médio, menor e maior preço das pizzas.

SELECT AVG(preco) as media,
       MIN(preco) as menor,
       MAX(preco) as maior
FROM PIZZA


--10. Quantos pedidos houve em cada dia, só dos dias com mais de 1 pedido.

SELECT data_pedido, COUNT (*) quantidade
FROM PEDIDO
GROUP BY data_pedido
HAVING COUNT (*) > 1

