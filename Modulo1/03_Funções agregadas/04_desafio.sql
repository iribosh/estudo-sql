-- EXERCÍCIOS ########################################################################

-- (Exercício 1) Conte quantos clientes da tabela sales.customers tem menos de 30 anos
select count(*)
from sales.customers
where ((current_date - birth_date)/356) < 30;
--resultado: 5807


-- (Exercício 2) Informe a idade do cliente mais velho e mais novo da tabela sales.customers
select 
max((current_date - birth_date)/356),
min((current_date - birth_date)/356)
from sales.customers;

--resultado: 83 e 19

-- (Exercício 3) Selecione todas as informações do cliente mais rico da tabela sales.customers
-- (possívelmente a resposta contém mais de um cliente)
select *
from sales.customers
where income=(select max(income)from sales.customers);
--resultado= 24 linhas


-- (Exercício 4) Conte quantos veículos de cada marca tem registrado na tabela sales.products
-- Ordene o resultado pelo nome da marca
select brand,
count(brand) as quantidade
from sales.products
group by brand
order by brand;

-- (Exercício 5) Conte quantos veículos existem registrados na tabela sales.products
-- por marca e ano do modelo. Ordene pela nome da marca e pelo ano do veículo
select brand,
model_year,
count(brand) as quantidade
from sales.products
group by 1,2
order by 1,2;


-- (Exercício 6) Conte quantos veículos de cada marca tem registrado na tabela sales.products
-- e mostre apenas as marcas que contém mais de 10 veículos registrados
select brand,
count(brand) as "quantidade"
from sales.products
group by brand
having count(*)>10;
