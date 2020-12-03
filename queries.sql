-- 1 - ÝSÝM VE SOYÝSMÝ BÝRLEÞTÝRÝP FULL_NAME ADINDA SÜTUNDA GETÝR.
SELECT CONCAT(NAME, SURNAME) AS FULL_NAME FROM CUSTOMER;

-- 2 - ADRES SATIR UZUNLUKLARINA GÖRE SIRALANMIÞ ÞEKÝDE GETÝR
SELECT address_lýne1, LENGTH(address_lýne1) FROM ADDRESS ORDER BY LENGTH(address_lýne1) DESC;

-- 3 - ADRES SATIRINDA SOKAK KELÝMESÝ 10. KARAKTERDEN SONRA GELENLERÝ GETÝR
SELECT INSTR(address_lýne1, 'ultricies') FROM ADDRESS WHERE INSTR(address_lýne1, 'ultricies') > 10;

-- 4 - TÜRK MÜÞTERÝLERÝMÝN NUMARALARI +90 ÝLE BAÞLAMIYORSA EKLEME
SELECT CONCAT('+90', PHONE) FROM employees E
INNER JOIN address A ON e.address_ýd = a.addres_ýd
INNER JOIN country C ON a.country_ýd = c.country_ýd
WHERE e.phone NOT LIKE '+90%' AND c.country = 'Turkey';

-- 5 - ADRES SATIRI 1 VE 2 AYNI ÝSE ÝKÝNCÝNÝN NULL YAPILMASI
SELECT REPLACE(address_lýne2, NULL) FROM address
WHERE address_lýne1 = address_lýne2;

-- 6 - ÜLKE ÝSÝMLERÝNÝN BAÞ HARFLERÝNÝN BÜYÜTÜLMESÝ
SELECT INITCAP(country) FROM COUNTRY;

-- 7 - SOYÝSÝMLERÝN TAMAMININ BÜYÜK HARFE ÇEVRÝLMESÝ
SELECT UPPER(surname) FROM employees;

-- 8 - SÝPARÝÞ DETAY TABLOSUNDAKÝ ÜRÜN ÝNDÝRÝMLERÝNÝN AÞAÐI YUVARLANMASI :)
SELECT dýscount, TRUNC(dýscount) FROM order_detaýls;

-- 9 - BÝRÝM FÝYATLARIN VÝRGÜLDEN SONRA 2 BASAMAÐA YUVARLANMASI
SELECT unýt_prýce, ROUND(unýt_prýce,2) FROM PRODUCTS;

-- 10 - ÜRÜN BÝRÝM FÝYATLARININ 100'E BÖLÜMLERÝNDEN KALANLARI
SELECT UNIT_PRICE, MOD(unýt_prýce, 100)FROM PRODUCTS;

-- 11
INSERT INTO week2.orders (customer_id,order_date,status_id,total_price) VALUES (1,TO_DATE('2020/12/2 19:18:01', 'yyyy/mm/dd hh24:mi:ss'),1 ,11595.11);

-- 12 - YIL BAÞINDNA BU GÜNE KADAR VERÝLEN SÝPARÝÞLER
SELECT * FROM ORDERS WHERE order_date > TO_DATE('2020/01/01', 'YYYY/MM/DD');

--13 - HAFTASONU VERÝLEN SÝPARÝÞLERÝN SAYISI ve FÝYAT TOPLAMI
SELECT count(*), sum(total_prýce) FROM ORDERS WHERE TRIM(TO_CHAR(ORDER_DATE, 'Day')) IN ('Cumartesi', 'Pazar');

-- 14 - BÝRÝM FÝYATI EN YÜKSEK OLAN ÜRÜNLERÝM
select * FROM (SELECT row_number() OVER(ORDER BY UNIT_PRICE DESC ) RN, PRODUCT_NAME, UNIT_PRICE from PRODUCTS)
WHERE RN  <= 10;

-- 15 - EN ÇOK GELÝR ELDE ETTÝÐÝM ÝLK 10 ÜRÜNÜN ADI, ID'SÝ, TOPLAM GELÝR, VE KAÇ KERE SATIÞ YAPILDIÐI
SELECT * FROM
(
    SELECT p.product_name, OD.product_ýd, SUM(OD.PRICE) AS TOPLAM_GELÝR, COUNT(OD.product_ýd) AS SATIS_ADEDI,
    ROW_NUMBER() OVER(ORDER BY SUM(OD.PRICE) DESC) RN
    FROM order_detaýls OD
    INNER JOIN PRODUCTS P ON od.product_ýd = p.product_ýd
    GROUP BY OD.product_ýd, p.product_name
)
WHERE RN <= 10;