-- Create the Hotel table
CREATE TABLE Hotel (
    HotelID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Location VARCHAR(255) NOT NULL,
    StarRating INT CHECK (StarRating >= 1 AND StarRating <= 5)  -- Assuming a 5-star rating system
);

-- Create the Customer table
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Phone VARCHAR(15),
    Email VARCHAR(100) UNIQUE NOT NULL
);

-- Create the Reservation table
CREATE TABLE Reservation (
    ReservationID INT PRIMARY KEY,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    CustomerID INT,
    HotelID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (HotelID) REFERENCES Hotel(HotelID)
);

-- Create the Room table
CREATE TABLE Room (
    RoomID INT PRIMARY KEY,
    RoomNumber VARCHAR(10) NOT NULL,
    RoomType VARCHAR(50) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    HotelID INT,
    FOREIGN KEY (HotelID) REFERENCES Hotel(HotelID)
);

-- Create the Employee table
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Position VARCHAR(50) NOT NULL,
    HotelID INT,
    FOREIGN KEY (HotelID) REFERENCES Hotel(HotelID)
);

-- Create the Service table
CREATE TABLE Service (
    ServiceID INT PRIMARY KEY,
    ServiceType VARCHAR(50) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    HotelID INT,
    FOREIGN KEY (HotelID) REFERENCES Hotel(HotelID)
);
