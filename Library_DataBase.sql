CREATE DATABASE Library;

USE Library;

-- Books Table
CREATE TABLE books (
    ISBN INT PRIMARY KEY, -- Primary key
    Title VARCHAR(100) NOT NULL,
    Edition VARCHAR(100),
    Year_of_publication DATE,
    Price INT,
    Cat_ID INT,
    Pub_ID INT,
    CONSTRAINT FK_books_Category FOREIGN KEY (Cat_ID) REFERENCES Category(Cat_ID),
    CONSTRAINT FK_books_Publisher FOREIGN KEY (Pub_ID) REFERENCES Publisher(Pub_ID)
);

-- Copies Table
CREATE TABLE Copies (
    Copy_ID INT PRIMARY KEY,
    Copy_number INT,
    available VARCHAR(100),
    Borrowing_Period INT,
    ISBN INT,
    CONSTRAINT FK_Copies_Books FOREIGN KEY (ISBN) REFERENCES books(ISBN)
);

-- Borrower Table
CREATE TABLE Borrower (
    Brr_ID INT PRIMARY KEY,
    Brr_Name VARCHAR(100) NOT NULL,
    Brr_address VARCHAR(100)
);

-- Category Table
CREATE TABLE Category (
    Cat_ID INT PRIMARY KEY,
    Cat_Name VARCHAR(100) NOT NULL
);

-- Author Table
CREATE TABLE Author (
    Au_ID INT PRIMARY KEY,
    First_Name VARCHAR(100),
    Mid_Name VARCHAR(100),
    Last_Name VARCHAR(100)
);

-- Publisher Table
CREATE TABLE Publisher (
    Pub_ID INT PRIMARY KEY,
    Pub_Name VARCHAR(100),
    Pub_Address VARCHAR(100)
);

-- Borrow Table
CREATE TABLE Borrow (
    Borrow_ID INT PRIMARY KEY AUTO_INCREMENT,
    borrowing_date DATE,
    return_date DATE,
    Borrower_ID INT,
    Copy_ID INT,
    CONSTRAINT FK_Borrow_Borrower FOREIGN KEY (Borrower_ID) REFERENCES Borrower(Brr_ID),
    CONSTRAINT FK_Borrow_Copies FOREIGN KEY (Copy_ID) REFERENCES Copies(Copy_ID)
);

-- Authorities Table (Relationship between Author and Book)
CREATE TABLE Authorities (
    Author_ID INT,
    ISBN INT,
    CONSTRAINT FK_Authorities_Author FOREIGN KEY (Author_ID) REFERENCES Author(Au_ID),
    CONSTRAINT FK_Authorities_Books FOREIGN KEY (ISBN) REFERENCES books(ISBN),
    PRIMARY KEY (Author_ID, ISBN)
);

-- Phone_Borrower Table
CREATE TABLE Phone_Borrower (
    Brr_Phone VARCHAR(50),
    Brr_ID INT,
    CONSTRAINT FK_Phone_Borrower FOREIGN KEY (Brr_ID) REFERENCES Borrower(Brr_ID)
);

-- Phone_Publisher Table
CREATE TABLE Phone_Publisher (
    Pub_ID INT,
    Phone_Number VARCHAR(50),
    CONSTRAINT FK_Phone_Publisher FOREIGN KEY (Pub_ID) REFERENCES Publisher(Pub_ID)
);
-- Insert into Category
INSERT INTO Category (Cat_ID, Cat_Name) VALUES
(1, 'Fiction'),
(2, 'Non-Fiction'),
(3, 'Science'),
(4, 'History');

-- Insert into Publisher
INSERT INTO Publisher (Pub_ID, Pub_Name, Pub_Address) VALUES
(1, 'Penguin Random House', '123 Publisher Lane'),
(2, 'HarperCollins', '456 Harper Avenue'),
(3, 'Macmillan', '789 Macmillan Street'),
(4, 'Simon & Schuster', '101 Simon Road');

-- Insert into Books
INSERT INTO books (ISBN, Title, Edition, Year_of_publication, Price, Cat_ID, Pub_ID) VALUES
(1001, 'To Kill a Mockingbird', '1st', 1960, 300, 1, 1),
(1002, 'Sapiens: A Brief History of Humankind', '1st', 2011, 500, 2, 2),
(1003, 'A Brief History of Time', '2nd', 1988, 400, 3, 3),
(1004, 'The Art of War', '3rd', -500, 200, 4, 4);

-- Insert into Copies
INSERT INTO Copies (Copy_ID, Copy_number, available, Borrowing_Period, ISBN) VALUES
(1, 1, 'TRUE', 14, 1001),
(2, 2, 'FALSE', 14, 1001),
(3, 1, 'TRUE', 30, 1002),
(4, 1, 'TRUE', 30, 1003),
(5, 1, 'TRUE', 14, 1004);

-- Insert into Borrower
INSERT INTO Borrower (Brr_ID, Brr_Name, Brr_address) VALUES
(1, 'John Doe', '123 Main Street'),
(2, 'Jane Smith', '456 Oak Avenue'),
(3, 'Emily Johnson', '789 Maple Road'),
(4, 'Michael Brown', '101 Pine Lane');

-- Insert into Phone_Borrower
INSERT INTO Phone_Borrower (Brr_Phone, Brr_ID) VALUES
('555-1234', 1),
('555-5678', 2),
('555-9101', 3),
('555-1122', 4);

-- Insert into Borrow
INSERT INTO Borrow (Borrow_ID, borrowing_date, return_date, Borrower_ID, Copy_ID) VALUES
(1, '2024-12-01', '2024-12-15', 1, 2),
(2, '2024-12-05', '2024-12-19', 3, 3);

-- Insert into Author
INSERT INTO Author (Au_ID, First_Name, Mid_Name, Last_Name) VALUES
(1, 'Harper', NULL, 'Lee'),
(2, 'Yuval', 'Noah', 'Harari'),
(3, 'Stephen', NULL, 'Hawking'),
(4, 'Sun', NULL, 'Tzu');

-- Insert into Authorities (relationship between Authors and Books)
INSERT INTO Authorities (Author_ID, ISBN) VALUES
(1, 1001),
(2, 1002),
(3, 1003),
(4, 1004);

-- Insert into Phone_Publisher
INSERT INTO Phone_Publisher (Pub_ID, Phone_Number) VALUES
(1, '800-123-4567'),
(2, '800-789-1234'),
(3, '800-456-7890'),
(4, '800-321-6547');
