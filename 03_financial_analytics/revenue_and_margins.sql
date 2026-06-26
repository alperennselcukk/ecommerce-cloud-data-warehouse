-- ==========================================
-- DEPARTMAN: FİNANS ANALİTİĞİ
-- Amaç: En yüksek ciro getiren ilk 10 ürün kategorisinin performans, iptal ve iade maliyet analizi
-- ==========================================

SELECT 
    p.category AS urun_kategorisi,
    ROUND(SUM(CASE WHEN oi.status = 'Complete' THEN oi.sale_price ELSE 0 END), 2) AS brut_ciro,
    ROUND(SUM(CASE WHEN oi.status = 'Cancelled' THEN oi.sale_price ELSE 0 END), 2) AS iptal_edilen_tutar,
    ROUND(SUM(CASE WHEN oi.status = 'Returned' THEN oi.sale_price ELSE 0 END), 2) AS iade_edilen_tutar,
    COUNT(oi.id) AS toplam_islem_adedi
FROM 
    `bigquery-public-data.thelook_ecommerce.order_items` AS oi
JOIN 
    `bigquery-public-data.thelook_ecommerce.products` AS p ON oi.product_id = p.id
GROUP BY 
    p.category
ORDER BY 
    brut_ciro DESC
LIMIT 10;
