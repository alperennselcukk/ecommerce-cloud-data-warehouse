-- ========================================================
-- ANALİZ: EN YÜKSEK CİRO GETİREN KATEGORİLER
-- Amaç: Şirketin ciro şampiyonu ilk 10 ürün kategorisini bulmak
-- ========================================================

SELECT 
    p.category, 
    SUM(oi.sale_price) AS toplam_ciro
FROM 
    `bigquery-public-data.thelook_ecommerce.order_items` AS oi 
INNER JOIN 
    `bigquery-public-data.thelook_ecommerce.products` AS p ON oi.product_id = p.id 
GROUP BY 
    p.category
ORDER BY 
    toplam_ciro DESC
LIMIT 10;
