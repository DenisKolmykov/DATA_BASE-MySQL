/*
Вывести название и цену для всех анализов, которые продавались 5 февраля 2020 и всю следующую неделю.

Есть таблица анализов Analysis:
an_id — ID анализа;
an_name — название анализа;
an_cost — себестоимость анализа;
an_price — розничная цена анализа;
an_group — группа анализов.

Есть таблица групп анализов Groups:
gr_id — ID группы;
gr_name — название группы;
gr_temp — температурный режим хранения.

Есть таблица заказов Orders:
ord_id — ID заказа;
ord_datetime — дата и время заказа;
ord_an — ID анализа.
*/

CREATE TABLE Analysis 
(
    an_id NUMBER 
          NOT NULL 
          PRIMARY KEY,
    an_name VARCHAR2(20),
    an_cost FLOAT (2),
    an_price FLOAT (2),
    an_group NUMBER
             NOT NULL,
);

CREATE TABLE Groups 
(
    gr_id NUMBER 
          NOT NULL 
          PRIMARY KEY,
    gr_name VARCHAR2(20),
    gr_temp INT,
);

CREATE TABLE Orders 
(
    ord_id NUMBER 
           NOT NULL 
           PRIMARY KEY,
    ord_datetime DATE,
    ord_an NUMBER,
);

CREATE VIEW v_orders_analysis AS 
SELECT a.an_name , an_cost, a.an_price 
FROM Orders o 
JOIN Analyses a ON o.ord_an = a.an_id 
WHERE o.ord_datetime BETWEEN '2020-02-05' AND '2020-02-12';

SELECT * FROM v_orders_analysis;