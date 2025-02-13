select 

        t2.product_category_name,
        sum(t1.price) as receita,
        count(*) as total_itens_vendidos,
        count(distinct t1.order_id) as qtde_pedidos,
        round( count(*) / cast(count(distinct t1.order_id) as float),2 )as avg_item_por_pedido

from tb_order_items as t1

left join tb_products as t2 
on  t1.product_id = t2.product_id 

group by t2.product_category_name

--Ordena a categoria avg_item_por_pedido, porém devemos escrever de forma explicita 
order by count(*)/ cast(count(distinct t1.order_id) as float) desc