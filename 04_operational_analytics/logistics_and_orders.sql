-- ==========================================
-- DEPARTMAN: OPERASYON VE LOJİSTİK ANALİTİĞİ
-- Amaç: Dağıtım merkezlerine göre kargolama hızının ve sipariş iptal oranlarının analizi
-- ==========================================

SELECT 
    dc.name AS dagitim_merkezi_adi,
    ROUND(AVG(TIMESTAMP_DIFF(oi.shipped_at, oi.created_at, DAY)), 2) AS ortalama_kargolama_suresi_gun,
    COUNT(oi.id) AS toplam_siparis_adedi,
    ROUND(
        (COUNT(CASE WHEN oi.status = 'Cancelled' THEN 1 END) / COUNT(oi.id)) * 100, 
        2
    ) AS siparis_iptal_orani_yuzde
FROM 
    `bigquery-public-data.thelook_ecommerce.order_items` AS oi
JOIN 
    `bigquery-public-data.thelook_ecommerce.products` AS p ON oi.product_id = p.id
JOIN 
    `bigquery-public-data.thelook_ecommerce.distribution_centers` AS dc ON p.distribution_center_id = dc.id
GROUP BY 
    dc.name
ORDER BY 
    ortalama_kargolama_suresi_gun ASC;
