CREATE TABLE Cars 
(
    id NUMBER 
       NOT NULL 
       PRIMARY KEY 
       AUTO_INCREMENT,
    mark VARCHAR2(10)
    cost INT
);

INSERT INTO Cars (mark, cost) VALUES
('Audi', 52642),
('Mersedes', 57127),
('Skoda', 9000),
('Volvo', 29000),
('Bentley', 350000),
('Citroen', 21000),
('Hummer', 41400),
('Volkswagen', 21600);

/* 1. Создайте представление, в которое попадут автомобили стоимостью до 25 000 долларов */
CREATE VIEW Cheap_cars AS
SELECT *
FROM Cars
WHERE cost < 25000;

SELECT * FROM Cheap_cars;

/* 2. Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов 
(используя оператор ALTER VIEW) */
ALTER VIEW Cheap_cars AS
SELECT *
FROM Cars
WHERE cost < 30000;

SELECT * FROM Cheap_cars;

/* 3. Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди” (аналогично) */
CREATE VIEW Some_cars AS
SELECT *
FROM Cars
WHERE mark IN ('Skoda',  'Audi') ;

SELECT * FROM Some_cars;
