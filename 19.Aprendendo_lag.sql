with tb_seller_order as (

select t1.order_id,
        data(t1.order_approved_at) as data_venda,
        t2.seller_id
    from tb_orders as t1

    left join tb_order_items as t2
    on t1.order_id = t2.order_id
    where order_status = "delivered"
),

tb_seller_order_sort as (
select *,

    row_number() over (partition by seller_id, data_venda) as date_saller_order
from tb_seller_order
),

tb_seller_lag_data as (
select order_id,
seller_id,
data_venda,
lag(data_venda) over(partition by seller_id order by data_venda) as lag_data_venda

