# 🛒 Ecommerce Cloud Data Warehouse Project

Bu proje, Google Cloud BigQuery üzerinde barındırılan **TheLook Ecommerce** ham verilerini kullanarak uçtan uca inşa edilmiş bir bulut veri ambarı ve analitik raporlama mimarisidir. Proje kapsamında e-ticaret süreçleri departman bazlı veri modellerine dönüştürülmüş ve üst yönetim için optimize edilmiştir.

## 📁 Proje Yapısı ve Departman Analizleri

*   **`02_marketing_analytics`**: Sitenin genel harcama ortalamasını baz alarak, bu ortalamanın üzerinde kalan yüksek değerli (VIP) müşterilerin tespitini içerir.
*   **`03_financial_analytics`**: En yüksek ciro getiren ilk 10 ürün kategorisinin performansını hesaplar; iptal ve iade maliyet analizlerini çıkarır.
*   **`04_operational_analytics`**: Dağıtım merkezlerinin ortalama kargolama hızını (gün bazlı) ve depoların sipariş iptal oranlarını analiz eder.
*   **`06_custom_analytics`**: Tamamen sıfırdan yazılmış SQL sorgusu ile şirketin ciro şampiyonu ürün gruplarını listeler. (Analiz sonucunda 'Outerwear & Coats' kategorisinin $1.37M ciro ile lider olduğu doğrulanmıştır).
*   **`executive_dashboards.sql`**: CEO ve CFO gibi üst düzey yöneticiler için `CREATE OR REPLACE VIEW` yapısı kullanılarak oluşturulmuş, tek tıkla çalışan hazır raporlama mimarisidir.

## 🛠️ Kullanılan Teknolojiler
*   **Google Cloud Platform (GCP) & BigQuery**: Bulut veri ambarı yönetimi ve SQL sorgulama.
*   **GitHub**: Sürüm kontrolü ve veri mimarisi dökümantasyonu.
