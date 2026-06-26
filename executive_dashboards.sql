CREATE OR REPLACE VIEW `semiotic-garden-500516-d0.thelook_ecommerce.vw_ceo_finansal_ozet` AS
SELECT 
    p.category AS urun_kategorisi,
    ROUND(SUM(CASE WHEN oi.status = 'Complete' THEN oi.sale_price ELSE 0 END), 2) AS brut_ciro,
    ROUND(SUM(CASE WHEN oi.status = 'Cancelled' THEN oi.sale_price ELSE 0 END), 2) AS iptal_edilen_tutar,
    ROUND(SUM(CASE WHEN oi.status = 'Returned' THEN oi.sale_price ELSE 0 END), 2) AS iade_edilen_tutar
FROM 
    `bigquery-public-data.thelook_ecommerce.order_items` AS oi
JOIN 
    `bigquery-public-data.thelook_ecommerce.products` AS p ON oi.product_id = p.id
GROUP BY 
    p.category;

CREATE OR REPLACE VIEW `semiotic-garden-500516-d0.thelook_ecommerce.vw_operasyon_risk_paneli` AS
SELECT 
    dc.name AS dagitim_merkezi_adi,
    ROUND(AVG(TIMESTAMP_DIFF(oi.shipped_at, oi.created_at, DAY)), 2) AS ortalama_kargolama_suresi_gun,
    ROUND((COUNT(CASE WHEN oi.status = 'Cancelled' THEN 1 END) / COUNT(oi.id)) * 100, 2) AS siparis_iptal_orani_yuzde
FROM 
    `bigquery-public-data.thelook_ecommerce.order_items` AS oi
JOIN 
    `bigquery-public-data.thelook_ecommerce.products` AS p ON oi.product_id = p.id
JOIN 
    `bigquery-public-data.thelook_ecommerce.distribution_centers` AS dc ON p.distribution_center_id = dc.id
GROUP BY 
    dc.name;
