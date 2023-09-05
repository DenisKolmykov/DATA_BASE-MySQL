/*
Task 02
Выведите только четные числа от 1 до 10. 
Пример: 2,4,6,8,10 
*/

CREATE FUNCTION EvenNums (n INT)
    RETURNS VARCHAR (255)

BEGIN
    DECLARE i INT DEFAULT 2;
    DECLARE res VARCHAR (255) DEFAULT '';

    IF n < 2 THEN
        SET res = 'В указанном диапазоне нет четных чисел'
    
    ELSE
        WHILE i <= n DO
            SET res = CONCAT_WS (' ', res, i);
            SET i = i + 2;
        END WHILE;
    END IF;
    RETURN res;
END;

SELECT EvenNums (10);