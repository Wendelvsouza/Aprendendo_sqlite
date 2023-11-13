select t1.*
from (select seller_state,
    count(*) as qtde_sellers      

    from tb_sellers

    group by seller_state
) as t1

where t1.qtde_sellers > 50