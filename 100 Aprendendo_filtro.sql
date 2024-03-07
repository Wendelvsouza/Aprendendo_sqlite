select  t1.product_id,  
        t1.product_category_name,
        t1.product_weight_g 

from tb_products as t1


where (t1.product_weight_g < 10000) 
    AND (t1.product_weight_g > 8000)
    And (t1.product_category_name = "automotivo")
or (t1.product_weight_g < 1000) 
    AND (t1.product_weight_g > 800)
    And (t1.product_category_name = "perfumaria")
ORDER BY product_category_name;

