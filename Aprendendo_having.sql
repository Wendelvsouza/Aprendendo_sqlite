select seller_state,
    count(*) as qtde_sellers

from tb_sellers

--where seller_state in ("SP", "RJ", "PR")

group by seller_state

--having (filtro) só retorna linhas os quais as condicoes foram satisfeitas:

HAVING count(*) > 10