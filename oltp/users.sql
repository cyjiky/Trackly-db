--- SELECT --- 

SELECT * FROM users;

SELECT name, nickname, phone_number, email
	FROM users
	ORDER BY id 
	LIMIT 3;

SELECT name, nickname, phone_number, email, timezone FROM users
	WHERE phone_number IS NOT NULL AND LENGTH(phone_number) > 8;

SELECT name, nickname 
	FROM users
	WHERE id = 2;
	
--- INSERT --- 

INSERT INTO users (
	name, nickname, phone_number, password, email
) VALUES
	(Null, 'User_nickname_1', '+1234567', 'hashed_password', 'user1@example.com'),
	(Null, 'User_nickname_2', Null, 'hashed_password', 'user2@example.com'),
	('User3', 'User_nickname_3', '018349439', 'hashed_password', 'user3@example.com');

--- UPDATE --- 

UPDATE users
	SET name = 'User_name_updated'
	WHERE id = 1 AND name IS NULL;

UPDATE users
	SET timezone = 'Europe/Kyiv'
	WHERE id = 2;

UPDATE users
	SET phone_number = '029876234'
	WHERE id = 2 AND phone_number IS NULL;

SELECT * FROM users;

--- DELETE --- 

DELETE FROM users
	WHERE name is NULL;

DELETE FROM users 
    WHERE phone_number IS NULL;
