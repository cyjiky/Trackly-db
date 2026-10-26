--- SELECT --- 

SELECT * FROM users;

SELECT name, nickname, email, timezone FROM users 
    WHERE timezone = 'Europe/Kyiv';

SELECT name, nickname, phone_number, email, timezone FROM users
	WHERE phone_number IS NOT NULL AND LENGTH(phone_number) > 8;

--- INSERT --- 

INSERT INTO users (name, nickname, password, email) VALUES 
	('USER', 'user1', 'hashed_password_6', 'user@example.com');

INSERT INTO users (nickname, password, email) VALUES 
	('new_user', 'hashed_password_3', 'new_user@example.com');

INSERT INTO users (name, nickname, password, email) VALUES 
	('Viky', '_viky_', 'hashed_password_8', 'viky_@example.com');

--- UPDATE --- 

UPDATE users
	SET email = '_viky_@example.com'
	WHERE name = 'Viky';

UPDATE users
    SET name = 'Anonym'
    WHERE name IS NULL;

--- DELETE --- 

DELETE FROM users
    WHERE name = 'Viky';

DELETE FROM users 
    WHERE phone_number IS NULL;
