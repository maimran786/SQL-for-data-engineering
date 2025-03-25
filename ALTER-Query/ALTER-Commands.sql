-- ALTER Query

-- Create a table

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(50),
    age INTEGER
);

-- Insert data into the table

INSERT INTO users (name, email, age) VALUES
    ('John Doe', 'john@example.com', 25),
    ('Jane Doe', 'jane@example.com', 30),
    ('Bob Smith', 'bob@example.com', 40);

-- Altering a table's column name

ALTER TABLE users RENAME COLUMN email TO user_email;

-- Adding a new column to a table

ALTER TABLE users ADD COLUMN phone VARCHAR(20);

-- Modifying an existing column's data type

ALTER TABLE users ALTER COLUMN age TYPE SMALLINT;

-- Deleting a column from a table

ALTER TABLE users DROP COLUMN phone;

SELECT * FROM users