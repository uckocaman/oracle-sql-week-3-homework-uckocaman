-- TEKÝL OLARAK MÜÞTERÝLERÝM VE ÇALIÞANLARIM
select  name, surname from employees 
UNION
select name, surname from customer;

-- VERÝ TABANIMA KAYITLI TÜM KÝÞÝLER, AYNI ANDA HEM ÇALIÞANIM HEM DE MÜÞTERÝM OLANLAR VARSA ÝKÝ KERE GELÝR
select  name, surname from employees 
UNION ALL
select name, surname from customer;

-- SADECE HEM MÜÞTERÝM HEM DE ÇALIÞANIM OLANLAR
select  name, surname from employees 
INTERSECT
select name, surname from customer;

-- ÇALIÞANIM OLMAYAN MÜÞTERÝLERÝM
select  name, surname from customer 
MINUS
select name, surname from employees