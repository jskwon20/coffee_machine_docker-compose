CREATE DATABASE IF NOT EXISTS coffee_machine CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE coffee_machine;

CREATE TABLE IF NOT EXISTS menus (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    coffee_beans INT NOT NULL,
    water INT NOT NULL,
    milk INT NOT NULL,
    price INT NOT NULL
);

CREATE TABLE IF NOT EXISTS inventory (
    id INT PRIMARY KEY AUTO_INCREMENT,
    coffee_beans INT NOT NULL DEFAULT 1000,
    milk INT NOT NULL DEFAULT 1000,
    water INT NOT NULL DEFAULT 1000,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    menu_id INT NOT NULL,
    quantity INT NOT NULL DEFAULT 1,
    total_price INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (menu_id) REFERENCES menus(id)
);

CREATE TABLE IF NOT EXISTS billing (
    id INT PRIMARY KEY AUTO_INCREMENT,
    cash_register INT NOT NULL DEFAULT 100000,
    total_sales INT NOT NULL DEFAULT 0,
    inventory_cost INT NOT NULL DEFAULT 0,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 초기 데이터
INSERT INTO menus (id, name, coffee_beans, water, milk, price) VALUES
(1, 'Espresso', 30, 30, 0, 3000),
(2, 'Latte', 20, 100, 150, 4000),
(3, 'Cappuccino', 20, 100, 150, 4500);

INSERT INTO inventory (coffee_beans, milk, water) VALUES (1000, 1000, 1000);
INSERT INTO billing (cash_register, total_sales, inventory_cost) VALUES (100000, 0, 0);
