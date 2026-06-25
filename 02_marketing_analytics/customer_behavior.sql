-- ==========================================
-- DEPARTMAN: PAZARLAMA VE MÜŞTERİ ANALİTİĞİ
-- Amaç: Ortalama harcamanın üzerinde harcama yapmış yüksek değerli (VIP) kullanıcıların tespiti
-- ==========================================

SELECT 
    user_id,
    COUNT(order_id) AS toplam_siparis_sayisi,
    ROUND(SUM(sale_price), 2) AS toplam_harcama
FROM 
    `bigquery-public-data.thelook_ecommerce.order_items`
WHERE 
    status = 'Complete'
GROUP BY 
    user_id
HAVING 
    SUM(sale_price) > (
        SELECT AVG(sale_price) FROM `bigquery-public-data.thelook_ecommerce.order_items` WHERE status = 'Complete'
    )
ORDER BY 
    toplam_harcama DESC
LIMIT 100;
