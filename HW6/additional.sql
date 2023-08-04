-- Stored Procedure to select 5 users for a particular user satisfying at least one criteria
DELIMITER $$
CREATE PROCEDURE find_users(IN user_id INT)
BEGIN
    -- Selecting users from the same city
    SELECT * FROM profiles 
    WHERE hometown = (SELECT hometown FROM profiles WHERE user_id = user_id)
    LIMIT 5;

    -- Selecting users from the same community
    SELECT * FROM users_communities
    WHERE community_id IN (SELECT community_id FROM users_communities WHERE user_id = user_id)
    LIMIT 5;

    -- Selecting friends of friends
    SELECT * FROM friend_requests 
    WHERE initiator_user_id IN (SELECT target_user_id FROM friend_requests WHERE initiator_user_id = user_id)
    LIMIT 5;
END $$
DELIMITER ;

-- Function to calculate popularity score of a user based on number of friends
DELIMITER $$
CREATE FUNCTION popularity_score(user_id INT) RETURNS INT
BEGIN
    DECLARE score INT;

    SELECT COUNT(*) INTO score
    FROM friend_requests
    WHERE (initiator_user_id = user_id OR target_user_id = user_id) AND status = 'approved';

    RETURN score;
END $$
DELIMITER ;

-- Function to greet user based on current time
DELIMITER $$
CREATE FUNCTION hello() RETURNS VARCHAR(15)
BEGIN
    DECLARE hour INT;
    SET hour = HOUR(CURTIME());

    IF hour BETWEEN 6 AND 11 THEN
        RETURN 'Доброе утро';
    ELSEIF hour BETWEEN 12 AND 17 THEN
        RETURN 'Добрый день';
    ELSEIF hour BETWEEN 18 AND 23 THEN
        RETURN 'Добрый вечер';
    ELSE
        RETURN 'Доброй ночи';
    END IF;
END $$
DELIMITER ;

-- Creating logs table of Archive type
CREATE TABLE logs
(
    created_at TIMESTAMP,
    table_name VARCHAR(50),
    primary_key_id BIGINT,
) ENGINE = ARCHIVE;

-- Creating trigger for users table
CREATE TRIGGER users_after_insert AFTER INSERT ON users
FOR EACH ROW
INSERT INTO logs (created_at, table_name, primary_key_id)
VALUES (NEW.created_at, 'users', NEW.id);

-- Creating trigger for communities table
CREATE TRIGGER communities_after_insert AFTER INSERT ON communities
FOR EACH ROW
INSERT INTO logs (created_at, table_name, primary_key_id)
VALUES (NEW.created_at, 'communities', NEW.id);

-- Creating trigger for messages table
CREATE TRIGGER messages_after_insert AFTER INSERT ON messages
FOR EACH ROW
INSERT INTO logs (created_at, table_name, primary_key_id)
VALUES (NEW.created_at, 'messages', NEW.id);
