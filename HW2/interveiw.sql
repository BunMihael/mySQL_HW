-- Используя оператор ALTER TABLE, установите внешний ключ в одной из таблиц (clients-posts)

ALTER TABLE posts
ADD CONSTRAINT fk_user_id
FOREIGN KEY (user_id)
REFERENCES clients (id);

-- Без оператора JOIN, верните заголовок публикации, 
-- текст с описанием, идентификатор клиента, опубликовавшего публикацию и логин данного клиента.

SELECT p.title, p.full_text, p.user_id, c.login
FROM posts p, clients c
WHERE p.user_id = c.id;

-- Выполните поиск по публикациям, автором которых является клиент "Mikle".

SELECT *
FROM posts
WHERE user_id IN (SELECT id FROM clients WHERE login = 'Mikle');