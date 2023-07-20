-- Создание базы данных "mobile_phones_db"
CREATE DATABASE IF NOT EXISTS mobile_phones_db;

-- Использование базы данных "mobile_phones_db"
USE mobile_phones_db;

-- Создание таблицы "mobile_phones"
CREATE TABLE IF NOT EXISTS mobile_phones (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    manufacturer VARCHAR(100),
    price DECIMAL(10, 2),
    quantity INT
);
-- Заполнение таблицы данными
INSERT INTO mobile_phones (name, manufacturer, price, quantity)
VALUES
    ('Galaxy S10', 'Samsung', 10000, 3),
    ('Galaxy S20', 'Samsung', 20000, 2),
    ('iPhone 12', 'Apple', 15000, 4),
    ('Galaxy S9', 'Samsung', 18000, 1),
    ('iPhone 11', 'Apple', 22000, 7),
    ('Galaxy S21', 'Samsung', 30000, 3);

-- Вывод названия, производителя и цены для товаров, количество которых превышает 2
SELECT name, manufacturer, price
FROM mobile_phones
WHERE quantity > 2;

-- Вывод всего ассортимента товаров марки "Samsung"
SELECT *
FROM mobile_phones
WHERE manufacturer = 'Samsung';

-- Дополнительные запросы:

-- Товары, в которых есть упоминание "Iphone"
SELECT *
FROM mobile_phones
WHERE name LIKE '%Iphone%';

-- Товары, в которых есть упоминание "Galaxy"
SELECT *
FROM mobile_phones
WHERE name LIKE '%Galaxy%';

-- Товары, в которых есть цифры
SELECT *
FROM mobile_phones
WHERE name REGEXP '[0-9]';

-- Товары, в которых есть цифра "8"
SELECT *
FROM mobile_phones
WHERE name REGEXP '8';

-- Информация о телефонах, где суммарная цена больше 100 000 и меньше 145 000
SELECT *
FROM mobile_phones
WHERE price * quantity > 100000 AND price * quantity < 145000;