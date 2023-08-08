/*
Задание 1
Таблица для работы на слайде.
1. Напишите запрос, который вывел бы таблицу со столбцами в следующем порядке: 
city, sname, snum, comm. (к первой или второй таблице, используя SELECT)
2.Напишите команду SELECT, которая вывела бы оценку(rating), 
сопровождаемую именем каждого заказчика в городе San Jose. (“заказчики”)
3.Напишите запрос, который вывел бы значения snum всех продавцов из таблицы заказов 
без каких бы то ни было повторений. (уникальные значения в  “snum“ “Продавцы”)
4*.Напишите запрос, который бы выбирал заказчиков, чьи имена начинаются с буквы G. 
Используется оператор "LIKE": (“заказчики”) 
https://dev.mysql.com/doc/refman/8.0/en/string-comparison-functions.html
5. 	Напишите запрос, который может дать вам все заказы со значениями суммы выше чем $1,000. 
(“Заказы”, “amt”  - сумма)
6.	Напишите запрос который выбрал бы наименьшую сумму заказа.
 (Из поля “amt” - сумма в таблице “Заказы” выбрать наименьшее значение)
7. 	Напишите запрос к таблице “Заказчики”, который может показать всех заказчиков, 
у которых рейтинг больше 100 и они находятся не в Риме.
*/

-- SALESPEOPLE --
CREATE TABLE sales_people
(
snum INT not null 
        primary key,
sname VARCHAR(45) not null,
city VARCHAR(45) not null,
comm FLOAT(2)
);

INSERT INTO sales_people (snum, sname, city, comm)
VALUES  (1001, 'Peel', 'London', 0.12),
        (1002, 'Serres', 'San Jose', 0.13),
        (1004, 'Motika', 'London', 0.11),
        (1007, 'Rifkin', 'Barcelona', 0.15),
        (1003, 'Aexelrod', 'New York', 0.10);


-- CUSTOMERS --
CREATE TABLE customers
(
cnum INT not null 
        primary key,
cname VARCHAR(45) not null,
city VARCHAR(45) not null,
rating INT null,
snum INT not null
);

INSERT INTO customers (cnum, cname, city, rating, snum)
VALUES  (2001, 'Hoffman', 'London', 100, 1001),
        (2002, 'Giovanni', 'Rome', 200, 1003),
        (2003, 'Liu', 'San Jose', 200, 1002),
        (2004, 'Grass', 'Berlin', 300, 1002),
        (2006, 'Clemens', 'London', 100, 1001),
        (2008, 'Cisneros', 'San Jose', 300, 1007),
        (2007, 'Pereira', 'Rome', 100, 1004);


-- ORDERS --
CREATE TABLE orders
(
onum INT not null 
        primary key,
amt FLOAT(2) not null,
odate DATE not null,
cnum INT not null,
snum INT not null
);

INSERT INTO orders (onum, amt, odate, cnum, snum)
VALUES  (3001, 18.69, '10/03/1990', 2008, 1007),
        (3003, 767.19, '10/03/1990', 2001, 1001),
        (3002, 1900.10, '10/03/1990', 2007, 1004),
        (3005, 5160.45, '10/03/1990', 2003, 1002),
        (3006, 1098.16, '10/03/1990', 2008, 1007),
        (3009, 1713.23, '10/04/1990', 2002, 1003),
        (3007, 75.75, '10/04/1990', 2004, 1002),
        (3008, 4723.00, '10/05/1990', 2006, 1001),
        (3010, 1309.95, '10/06/1990', 2004, 1002),
        (3011, 9891.88, '10/06/1990', 2006, 1001);

--1. Напишите запрос, который вывел бы таблицу со столбцами в следующем порядке: 
-- city, sname, snum, comm. (к первой или второй таблице, используя SELECT)
SELECT city, sname, snum, comm FROM sales_people;

--2.Напишите команду SELECT, которая вывела бы оценку(rating), 
-- сопровождаемую именем каждого заказчика в городе San Jose. (“заказчики”)
SELECT cname, rating FROM customers WHERE city = 'San Jose';

-- 3.Напишите запрос, который вывел бы значения snum всех продавцов из таблицы заказов 
-- без каких бы то ни было повторений. (уникальные значения в  “snum“ “Продавцы”)
SELECT DISTINCT snum FROM orders;

-- 4*.Напишите запрос, который бы выбирал заказчиков, чьи имена начинаются с буквы G. 
-- Используется оператор "LIKE": (“заказчики”)
SELECT * FROM customers WHERE cname LIKE 'G%';

-- 5. 	Напишите запрос, который может дать вам все заказы со значениями суммы выше чем $1,000. 
-- (“Заказы”, “amt”  - сумма)
SELECT * FROM orders WHERE amt > 1000.00

-- 6.	Напишите запрос который выбрал бы наименьшую сумму заказа.
-- (Из поля “amt” - сумма в таблице “Заказы” выбрать наименьшее значение)
SELECT MIN(amt) FROM orders;

-- 7. 	Напишите запрос к таблице “Заказчики”, который может показать всех заказчиков, 
-- у которых рейтинг больше 100 и они находятся не в Риме.
SELECT * FROM customers WHERE rating > 100 AND city != 'Rome';
