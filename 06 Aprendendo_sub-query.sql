
select t1.*

from 
--Faz a tabela completa
    (select seller_state,
    count(*) as qtde_sellers      

    from tb_sellers

    group by seller_state
) as t1
--Filtra os estados com mais de 50 vendedores
where t1.qtde_sellers > 50