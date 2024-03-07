Select product_category_name,
            avg(product_name_lenght) as tamanho_avg_nome,
            min(product_name_lenght) as tamanho_min_nome,
            max(product_name_lenght) as tamanho_max_nome

    from tb_products

where product_description_lenght > 100

group by product_category_name

-- Filtra pela media da categoria product_description_lenght maior que 500
having avg(product_description_lenght) > 500

-- Ordena pelo minimo da categoria product_name_lenght
-- Ordena pelo Maximo da categoria product_name_lenght

order by min(product_name_lenght) desc,
         max(product_name_lenght) desc