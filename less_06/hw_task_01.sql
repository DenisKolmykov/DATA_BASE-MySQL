/* 
Task 01
Создайте функцию, которая принимает количество секунд и форматирует их 
в количество дней, часов, минут, секунд. 
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
*/

CREATE FUNCTION FormatSec (sec INT)
    RETURNS VARCHAR (50)

BEGIN
    DECLARE d INT;
    DECLARE h INT;
    DECLARE m INT;
    DECLARE s INT;

    d := sec / 86400;
    h := (sec - d * 86400) / 3600;

    s := MOD(sec / 60);
    m : = MOD(((sec - s) / 60), 60);

    RETURN CONCAT(
        d, ' days ',
        h, ' hours ',
        m, ' minutes ',
        s, ' seconds'
    );
END;

SELECT FormatSec (123456);
