-- Case funciona como if no python, o distinct serve para tornar distinto:

select 

        
        distinct case 
        
        when product_category_name = 'agro_industria_e_comercio' then '0' 
        
        when product_category_name is null then '1'

        when product_category_name like '%artigos%' then 'artigos'
-- SEM O ELSE, SÓ IRA APARECER AS LINHAS CONDICIONADAS
        else product_category_name
        end as categoria_fillna

from tb_products

order by categoria_fillna