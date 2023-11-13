select 
        product_category_name,
        count(*) as qtde_produtos,
        max(product_weight_g) as maior_peso,
        min(product_weight_g) as menor_peso, 
        avg(product_weight_g) as avg_peso,   
        sum(product_weight_g) as soma_peso
from tb_products

--retira o nulo da coluna e isso deve vir antes do group by (no processamento)
where product_category_name is not null
and product_category_name != 'alimentos'

group by product_category_name 