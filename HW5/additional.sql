-- 1. Get friends of the user with id=1. Here we are looking at both the initiator and target of the friend request, 
-- and selecting the other user as the friend, because if either the initiator or target is the user with id=1, 
-- the other one is their friend.
SELECT 
    CASE 
        WHEN initiator_user_id = 1 THEN target_user_id
        WHEN target_user_id = 1 THEN initiator_user_id
    END AS friend_id
FROM 
    friend_requests 
WHERE 
    (initiator_user_id = 1 OR target_user_id = 1) AND status = 'approved';

-- 2. Create a view of all messages involving user with id=1. We use a CASE statement to determine whether the message 
-- was sent or received by the user.
CREATE VIEW user_1_messages AS 
SELECT 
    id, 
    CASE 
        WHEN from_user_id = 1 THEN 'sent' 
        WHEN to_user_id = 1 THEN 'received' 
    END AS direction, 
    body, 
    created_at 
FROM 
    messages 
WHERE 
    from_user_id = 1 OR to_user_id = 1;

-- 3. Get a list of media files for a user with the number of likes. We join the media and likes tables and group by media file.
SELECT 
    m.filename, 
    COUNT(l.id) AS likes_count 
FROM 
    media m 
LEFT JOIN 
    likes l ON m.id = l.media_id 
WHERE 
    m.user_id = 1 
GROUP BY 
    m.filename;

-- 4. Get the number of groups for each user. We simply count the number of rows in the users_communities table for each user.
SELECT 
    user_id, 
    COUNT(community_id) AS community_count 
FROM 
    users_communities 
GROUP BY 
    user_id;

-- 5. Create a view of users who are not older than 20. We select from the profiles and users tables where the difference 
-- between the current year and the year of birth is less than 20.
CREATE VIEW young_users AS 
SELECT 
    u.firstname, 
    u.lastname, 
    p.hometown, 
    p.gender 
FROM 
    profiles p
JOIN
    users u ON u.id = p.user_id
WHERE 
    YEAR(CURDATE()) - YEAR(p.birthday) < 20;

-- 6. Get the number of messages sent by each user and rank them. We count the number of messages from each user and use DENSE_RANK 
-- to rank them by the number of sent messages.
SELECT 
    u.firstname, 
    u.lastname, 
    COUNT(m.id) AS messages_sent, 
    DENSE_RANK() OVER (ORDER BY COUNT(m.id) DESC) AS rank 
FROM 
    messages m
JOIN
    users u ON u.id = m.from_user_id
GROUP BY 
    m.from_user_id;

-- 7. Get all messages, sort them by the time they were sent, and calculate the difference in sending time between adjacent messages.
-- We use the LAG function to get the time the previous message was sent.
SELECT 
    m.id,
    m.body,
    m.created_at, 
    TIMESTAMPDIFF(MINUTE, LAG(m.created_at) OVER (ORDER BY m.created_at), m.created_at) AS minutes_since_last_message 
FROM 
    messages m;
