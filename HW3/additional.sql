-- Task 1: Count the number of documents for each user
SELECT users.id, users.firstname, users.lastname, COUNT(media.id) AS document_count
FROM users
LEFT JOIN media ON users.id = media.user_id
WHERE RIGHT(media.filename, 4) = '.doc' OR RIGHT(media.filename, 5) = '.docx' OR RIGHT(media.filename, 5) = '.html'
GROUP BY users.id, users.firstname, users.lastname;

-- Task 2: Count the likes for the documents of each user
SELECT users.id, users.firstname, users.lastname, COUNT(likes.id) AS like_count
FROM users
LEFT JOIN media ON users.id = media.user_id
LEFT JOIN likes ON media.id = likes.media_id
WHERE RIGHT(media.filename, 4) = '.doc' OR RIGHT(media.filename, 5) = '.docx' OR RIGHT(media.filename, 5) = '.html'
GROUP BY users.id, users.firstname, users.lastname;
