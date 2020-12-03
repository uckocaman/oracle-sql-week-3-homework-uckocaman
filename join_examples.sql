-- SÝPARÝÞÝ HENÜZ KARGOYA VERÝLMEYEN MÜÞTERÝLERÝN ADI, SOYADI, 
-- SÝPARÝÞ TARÝHÝ, ALDIÐI ÜRÜNLERÝN SÝPARÝÞ TARÝHÝNE GÖRE SIRALANMASI
SELECT C.NAME, c.surname, o.order_date, p.product_name, s.status_type FROM orders O
INNER JOIN order_detaýls OD ON o.order_ýd = od.order_ýd
INNER JOIN status S ON o.status_ýd = s.ýd
INNER JOIN customer C ON o.customer_ýd = c.customer_ýd
INNER JOIN PRODUCTS P ON OD.PRODUCT_ID = p.product_ýd
WHERE s.status_type = 'Siparis Alindi'
ORDER BY o.order_date;

-- TEK SEFERDE ÝNDÝRÝMSÝZ OLARAK 10'DAN FAZLA SATILAN ÜRÜNLER 
SELECT od.quantýty, od.prýce, od.dýscount, p.product_name, b.brand_name FROM order_detaýls OD
INNER JOIN PRODUCTS P ON od.product_ýd = p.product_ýd
INNER JOIN brand B ON p.brand_ýd = b.brand_ýd
WHERE OD.quantýty > 10 AND dýscount = 0;

-- HÝÇ SÝPARÝÞ VERMEYEN MÜÞTERÝLER
SELECT * FROM customer C LEFT JOIN orders O ON c.customer_ýd = o.customer_ýd
WHERE o.order_ýd IS NULL;

-- HÝÇ SATIÞ YAPILMAYAN ÜRÜNLER
SELECT * FROM products P LEFT JOIN order_detaýls OD ON p.product_ýd = od.product_ýd
WHERE od.order_ýd IS NULL;