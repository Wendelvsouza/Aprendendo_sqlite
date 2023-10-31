select  count(t1.product_id) as qtde_produtos, 
        sum(t1.product_width_cm) / count(t1.product_id)  as media_largura,
        sum(t1.product_height_cm) / count(t1.product_id)  as media_comprimento,
        sum(t1.product_length_cm) / count(t1.product_id)  as media_altura, 
        count(distinct t1.product_category_name) as media_produtos
from tb_products as t1

