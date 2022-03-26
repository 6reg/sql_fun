-- @block
CREATE TABLE Users(
    id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(255) NOT NULL UNIQUE,
    bio TEXT,
    country VARCHAR(2)
);
-- @block
ALTER USER 'root' @'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
-- @block
flush privileges;

-- @block
CREATE USER 'foo' @'%' IDENTIFIED WITH mysql_native_password BY 'bar';

-- @block
FLUSH PRIVILEGES;

-- @block 
INSERT INTO Users (email, bio, country)
VALUES 
    ('holla@munda.com', 'bar', 'MX'),
    ('bonjour@monde.com', 'baz', 'FR');

-- @block 
CREATE INDEX email_index ON Users(email);CREATE INDEX email_index ON Users(email);

-- @block   
CREATE TABLE Rooms(
    id INT AUTO_INCREMENT,
    street VARCHAR(255),
    owner_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (owner_id) REFERENCES Users(id)
);

-- @block  
SELECT * FROM Users 
INNER JOIN Rooms 
ON Rooms.owner_id = Users.id;