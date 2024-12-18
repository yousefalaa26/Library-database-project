CREATE DATABASE Library;

USE Library;

-- Books Table
CREATE TABLE books (
    ISBN INT PRIMARY KEY, -- Primary key
    Title VARCHAR(100) NOT NULL,
    Edition VARCHAR(100),
    Year_of_publication DATE,
    Price INT
);

-- Copies Table
CREATE TABLE Copies (
    Copy_ID INT PRIMARY KEY,
    Copy_number INT,
    available VARCHAR(10),
    Borrowing_Period INT,
    ISBN INT,
    CONSTRAINT FK_Copies_Books FOREIGN KEY (ISBN) REFERENCES books(ISBN)
);

-- Borrowere Table
CREATE TABLE Borrowere (
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
    borrowing_date DATE,
    return_date DATE,
    Borrowere_ID INT,
    Copy_ID INT,
    CONSTRAINT FK_Borrow_Borrowere FOREIGN KEY (Borrowere_ID) REFERENCES Borrowere(Brr_ID),
    CONSTRAINT FK_Borrow_Copies FOREIGN KEY (Copy_ID) REFERENCES Copies(Copy_ID)
);

-- Authorithies Table (Relationship between Author and Book)
CREATE TABLE Authorithies (
    Author_ID INT,
    ISBN INT,
    CONSTRAINT FK_Authorithies_Author FOREIGN KEY (Author_ID) REFERENCES Author(Au_ID),
    CONSTRAINT FK_Authorithies_Books FOREIGN KEY (ISBN) REFERENCES books(ISBN)
);

-- Phone_Borrowere Table
CREATE TABLE Phone_Borowere (
    Brr_Phone VARCHAR(100),
    Brr_number INT,
    CONSTRAINT FK_Phone_Borrowere FOREIGN KEY (Brr_number) REFERENCES Borrowere(Brr_ID)
);

-- Phone_Publisher Table
CREATE TABLE Phone_Publisher (
    Pub_ID INT,
    Phone_Number VARCHAR(50),
    CONSTRAINT FK_Phone_Publisher FOREIGN KEY (Pub_ID) REFERENCES Publisher(Pub_ID)
);
ALTER TABLE books 
ADD CONSTRAINT FK_books_Category
FOREIGN KEY (Cat_ID) REFERENCES Category(Cat_ID)

ALTER TABLE books
ADD CONSTRAINT FK_books_Publisher
FOREIGN KEY (Pub_ID) REFERENCES Publisher(Pub_ID)