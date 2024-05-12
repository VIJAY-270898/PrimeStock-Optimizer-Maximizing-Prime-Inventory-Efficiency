USE CKASS;
-- created a Table -itemss

CREATE TABLE itemss (
    item_id INT PRIMARY KEY,
    item_type VARCHAR(100),
    item_category VARCHAR(100),
    square_footage DECIMAL(10, 2)
);

-- Inserting values 

INSERT INTO itemss (item_id, item_type, item_category, square_footage)
VALUES
    (1374, 'prime_eligible', 'mini refrigerator', 68.00),
    (4245, 'not_prime', 'standing lamp', 26.40),
    (2452, 'prime_eligible', 'television', 85.00),
    (3255, 'not_prime', 'side table', 22.60),
    (1672, 'prime_eligible', 'laptop', 8.50);
    