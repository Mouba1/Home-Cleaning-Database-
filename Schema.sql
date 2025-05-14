CREATE DATABASE HomeCleaningDB;
USE HomeCleaningDB;        

CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    FullName VARCHAR(100),
    Address VARCHAR(255),
    PhoneNumber VARCHAR(20),
    EmailAddress VARCHAR(100)
    );
    

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    FullName VARCHAR(100),
    PhoneNumber VARCHAR(20),
    Role VARCHAR(50),
    Availability VARCHAR(255)
);

CREATE TABLE Services (
    ServiceID INT PRIMARY KEY AUTO_INCREMENT,
    ServiceName VARCHAR(100),
    Description TEXT,
    Price DECIMAL(10, 2)
);

CREATE TABLE Appointment (
    AppointmentID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    EmployeeID INT,
    ServiceID INT,
    Date DATE,
    Time TIME,
    Status ENUM('Scheduled', 'Completed', 'Cancelled'),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (ServiceID) REFERENCES Service(ServiceID)
);

CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,
    AppointmentID INT,
    PaymentMethod VARCHAR(50),
    Amount DECIMAL(10, 2),
    DatePaid DATE,
    FOREIGN KEY (AppointmentID) REFERENCES Appointment(AppointmentID)
);