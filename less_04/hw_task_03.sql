/*
Даны 2 таблицы, созданные следующим образом:
create table test_a (id number, data varchar2(1));
create table test_b (id number);
insert into test_a(id, data) values
(10, 'A'),
(20, 'A'),
(30, 'F'),
(40, 'D'),
(50, 'C');
insert into test_b(id) values
(10),
(30),
(50);
Напишите запрос, который вернет строки из таблицы test_a, 
id которых нет в таблице test_b, НЕ используя ключевого слова NOT.
*/

CREATE TABLE test_a (id NUMBER, data VARCHAR2(1));
INSERT INTO test_a (id, data) VALUES
(10, 'A'),
(20, 'A'),
(30, 'F'),
(40, 'D'),
(50, 'C');

CREATE TABLE test_b (id NUMBER);
INSERT INTO test_b(id) VALUES
(10),
(30),
(50);

SELECT * FROM test_a
UNION
SELECT * FROM test_b