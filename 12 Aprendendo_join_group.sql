select t2.customer_state,
    
    count(distinct t1.customer_id) as qtde_cliente_estado,
    sum(t3.price) as receita_total_estado,
    sum(t3.price) / count(distinct t1.customer_id) as avg_receita_cliente


from tb_orders as t1


left join tb_order_items as t3
on t1.order_id = t3.order_id

left join tb_customers as  t2
on t1.customer_id = t2.customer_id

where t1.order_status = 'delivered'

group by t2.customer_state

 