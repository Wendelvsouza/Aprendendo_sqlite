-- coalesce compara linha por linha entre as colunas especificadas e retorna o primeiro valor que não seja nulo
-- podemos especificar uma palavra ou numero ao inves de inserir coluna na comparação
SELECT DISTINCT coalesce(product_category_name, 'outros') as categoria_fillna
FROM tb_products

order by product_category_name