-- Ingredients table
CREATE TABLE Ingredients (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,
    price_per_unit REAL NOT NULL
);

-- Donuts table
CREATE TABLE Donuts (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,
    gluten_free BOOLEAN NOT NULL,
    price REAL NOT NULL
);

-- Donut Ingredients table
CREATE TABLE DonutIngredients (
    donut_id INTEGER NOT NULL,
    ingredient_id INTEGER NOT NULL,
    FOREIGN KEY (donut_id) REFERENCES Donuts(id),
    FOREIGN KEY (ingredient_id) REFERENCES Ingredients(id),
    PRIMARY KEY (donut_id, ingredient_id)
);

-- Customers table
CREATE TABLE Customers (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

-- Orders table
CREATE TABLE Orders (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    customer_id INTEGER NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(id)
);

-- Order Items table
CREATE TABLE OrderItems (
    order_id INTEGER NOT NULL,
    donut_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(id),
    FOREIGN KEY (donut_id) REFERENCES Donuts(id),
    PRIMARY KEY (order_id, donut_id)
);

-- Sample ingredients
INSERT INTO Ingredients (name, price_per_unit)
VALUES ('Cocoa', 5.00),
       ('Sugar', 2.00),
       ('Flour', 1.00),
       ('Buttermilk', 3.00),
       ('Sprinkles', 4.00);

-- Sample donuts
INSERT INTO Donuts (name, gluten_free, price)
VALUES ('Belgian Dark Chocolate', 0, 4.00),
       ('Back-To-School Sprinkles', 0, 4.00);

-- Ingredients for Belgian Dark Chocolate
INSERT INTO DonutIngredients (donut_id, ingredient_id)
VALUES (1, 1), -- Cocoa
       (1, 3), -- Flour
       (1, 4), -- Buttermilk
       (1, 2); -- Sugar

-- Ingredients for Back-To-School Sprinkles
INSERT INTO DonutIngredients (donut_id, ingredient_id)
VALUES (2, 3), -- Flour
       (2, 4), -- Buttermilk
       (2, 2), -- Sugar
       (2, 5); -- Sprinkles

-- Sample customer
INSERT INTO Customers (first_name, last_name)
VALUES ('Luis', 'Singh');

-- Sample order
INSERT INTO Orders (customer_id)
VALUES (1);

-- Order items
INSERT INTO OrderItems (order_id, donut_id, quantity)
VALUES (1, 1, 3), -- 3 Belgian Dark Chocolate
       (1, 2, 2); -- 2 Back-To-School Sprinkles
