-- 1. Create the categories table with categoryID as the primary key
CREATE TABLE categories (
    categoryID INT AUTO_INCREMENT PRIMARY KEY,
    categoryName VARCHAR(50) NOT NULL
);

-- 2. Insert categories into the categories table
INSERT INTO categories (categoryName) 
VALUES 
('Electronics'), 
('Furniture'), 
('Clothing'), 
('Groceries'), 
('Toys');

-- 3. Create the customer table with customerID as the primary key
CREATE TABLE customer (
    customerID INT AUTO_INCREMENT PRIMARY KEY,
    customerName VARCHAR(50) NOT NULL,
    email VARCHAR(50),
    phoneNumber VARCHAR(11),
    customerAddress VARCHAR(20),
    dateCreated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 4. Insert customer records into the customer table
INSERT INTO customer (customerName, email, phoneNumber, customerAddress) 
VALUES
('John Doe', 'johndoe@email.com', '1234567890', 'Kisii'),
('Jane Smith', 'janesmith@email.com', '0987654321', 'Nairobi'),
('Tom Brown', 'tombrown@email.com', '1112223333', 'Mombasa');

-- 5. Update customer addresses to 'Lavington' for customerID 1 and 2
UPDATE customer 
SET customerAddress = 'Lavington' 
WHERE customerID IN (1, 2);

-- 6. Delete category with categoryID = 2 from the categories table
DELETE FROM categories 
WHERE categoryID = 2;

-- 7. Retrieve all columns and rows from the categories table
SELECT * FROM categories;

-- 8. Create the bills table with BillID as the primary key and foreign keys for CategoryID and CustomerID
CREATE TABLE bills (
    BillID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryID INT,
    CustomerID INT,
    BillDate DATE NOT NULL,
    DueDate DATE NOT NULL,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    Status VARCHAR(20) DEFAULT 'Unpaid',
    DateCreated TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (CategoryID) REFERENCES categories(categoryID),
    FOREIGN KEY (CustomerID) REFERENCES customer(customerID)
);

-- 9. Insert bill records into the bills table
INSERT INTO bills (CategoryID, CustomerID, BillDate, DueDate, TotalAmount, Status) 
VALUES
(1, 1, '2024-10-01', '2024-10-15', 150.75, 'Unpaid'),
(3, 2, '2024-10-05', '2024-10-20', 200.50, 'Paid'),
(4, 3, '2024-10-10', '2024-10-25', 100.00, 'Unpaid');

-- 10. Update the status of the bill with BillID = 1 to 'Paid'
UPDATE bills 
SET Status = 'Paid' 
WHERE BillID = 1;
