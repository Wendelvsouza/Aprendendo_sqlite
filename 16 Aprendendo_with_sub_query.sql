-- melhor forma de fazer sub querys...
-- a receita por estado do seller, por produtod da categia mais vendida


-- comando with é utilizada para criar uma ou mais tabelas temporarias, ou seja, aqui
-- foi criado as tabelas tb_best_categoria; tb_venda e tb_receita_estado_produto
with tb_best_categoria as ( 
        select t2.product_category_name
        from tb_order_items as t1
        left join tb_products as t2
        on t1.product_id = t2.product_id 
        group by t2.product_category_name
        order by count(*) DESC
-- Conta quantida de pedidos por produto e ordenada os tres primeiros
        limit 3 
),

tb_venda as (
    select *
    from tb_orders as t1
    where t1.order_status = 'delivered'
),

tb_receita_estado_produto as (

    select 
            t2.seller_state,
            t1.product_id,
            t3.product_category_name,
            sum(t1.price) as receita_total

    from tb_order_items as t1

    left join tb_sellers as t2
    on t1.seller_id = t2.seller_id
-- left join retorna todos valores da tabela há esquerda cuja a conexão
-- seja satisfeita
    left join tb_products as t3
    on t1.product_id = t3.product_id

-- Inner serve como um filtro, só vai retornar os valores que fazem 
-- intersecção, ou seja, só retornaram os valores que seja façam parte
-- das 3 categorias que mais vendem

    inner join tb_best_categoria as t4
    on t3.product_category_name = t4.product_category_name


    inner join tb_venda as t5
    on t1.order_id = t5.order_id

    group by t2.seller_state,
            t1.product_id,
            t3.product_category_name
)

select * 
from tb_receita_estado_produto as t1

inner join tb_best_categoria as t2
on t1.product_category_name = t2.product_category_name