/*
1.	Вывести на экран, сколько машин каждого цвета  для машин марок BMW и LADA
2.	Вывести на экран марку авто(количество) и количество авто не этой марки.
пример:
100 машин, их них: 
20 - BMW и 80 машин другой марки ,  
AUDI - 30 и 70 машин другой марки, 
LADA - 15, 85 авто другой марки
*/

CREATE TABLE AUTO 
(       
	REGNUM VARCHAR(10) PRIMARY KEY, 
	MARK VARCHAR(10), 
	COLOR VARCHAR(15),
	RELEASEDT DATE, 
	PHONENUM VARCHAR(15)
);

INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES  (111114,'LADA', 'КРАСНЫЙ', date'2008-01-01', '9152222221'),
        (111115,'VOLVO', 'КРАСНЫЙ', date'2013-01-01', '9173333334'),
        (111116,'BMW', 'СИНИЙ', date'2015-01-01', '9173333334'),
        (111121,'AUDI', 'СИНИЙ', date'2009-01-01', '9173333332'),
        (111122,'AUDI', 'СИНИЙ', date'2011-01-01', '9213333336'),
        (111113,'BMW', 'ЗЕЛЕНЫЙ', date'2007-01-01', '9214444444'),
        (111126,'LADA', 'ЗЕЛЕНЫЙ', date'2005-01-01', null),
        (111117,'BMW', 'СИНИЙ', date'2005-01-01', null),
        (111119,'LADA', 'СИНИЙ', date'2017-01-01', '9213333331');

-- 1.Вывести на экран, сколько машин каждого цвета  для машин марок BMW и LADA
SELECT MARK, COLOR, COUNT(*) AS count
FROM AUTO
WHERE MARK IN ('BMW', 'LADA')
GROUP BY COLOR;

-- 2.Вывести на экран марку авто(количество) и количество авто не этой марки.
SELECT MARK, COUNT(MARK) AS COUNT_MARK, COUNT(*) - COUNT(MARK) AS NOT_MARK
FROM AUTO
GROUP BY MARK;

