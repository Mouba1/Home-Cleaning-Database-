
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

INSERT INTO Customers (FullName, Address, PhoneNumber, EmailAddress)
VALUES
('Ram Belkis', '1285 Washington Ave Bx, NY', '645-908-9074', 'Belkis34@gmail.com'),
('Arafat Bawee', '456 E 145th St Bx, NY', '655-908-8900', 'Arafatb@gmail.com'),
('Chareef Dinho', '454 Fulton St Bk,NY', '347-670-9086', 'Shareef123@yahoo.com'),
('Mubarak Wakaso', '300 Adam St BK,NY', '786-098-4098', 'mubaraksl@gmail.com'),
('Robert Nelson', '5 Pearls Pl BK,NY', '718-908-6789', 'Robball@gmail.com'),
('Kendall August', '2650 Webster Ave', '917-908-5901', 'Kensu34@gmail.com'),
('Dan Holliman', '5 W 131sst St Ny,NY', '212-872-3120', 'Dan904@hotmail.com');


INSERT INTO Employees (FullName, PhoneNumber, Role, Availability)
VALUES
('Jose Fernandez', '917-908-9083', 'Floor Warden', 'Weekends'),
('Heisy Hernandez', '347-098-1276', 'Floor Brigate', 'Mon-Thurs'),
('Francis Vic', '646-907-6542', 'Supervisor', 'Weekends'),
('Gregg Matos', '718-252-2200', 'Floor Warden', 'Weekdays'),
('Elvis Frank ', '347-901-1137', 'Floor Warden', 'Weekdays'),
('Victor paul ', '646-870-7821', 'EAP Brigate', 'Thurs-Fri'),
('Sumanu Hodio', '347-238-3401', 'Fire Brigate', 'Weekends'),
('Jose Martinez', '212-342-5110', 'BES', 'Wed-Fri');

INSERT INTO Services (ServiceName, Description, Price)
VALUES
('Regular Cleaning', 700 ),
('Basic Cleaning', 900 ),
('Standard Cleaning', 2000 ),
('Deep Cleaning', 4000 );



INSERT INTO Appointment (AppointmentID, CustomerID, EmployeeID, ServiceID, Date, Time, Status)
VALUES

(1, 3, 4, 2, '2024-01-15', '10:00:00', 'completed'),
(2, 4, 1, 5, '2025-01-12', '12:00:00', 'completed'),
(3, 5, 3, 6, '2025-02-16', '13:00:00', 'cancelled'),
(4, 6, 2, 4, '2025-01-25', '16:00:00', 'completed'),
(5, 1, 7, 1, '2025-02-14', '08:00:00', 'completed'),
(6, 2, 8, 3, '2025-03-10', '17:00:00', 'completed'),
(7, 7, 5, 7, '2025-06-19', '12:00:00', 'scheduled'),
(8, 8, 6, 8, '2025-06-20', '12:00:00', 'scheduled');

INSERT INTO Payment (AppointmentID, PaymentMethod, Amount, DatePaid)
VALUES
(1, 1, 'Credit Card', 2000, '2025-02-15'),
(2, 2, 'debit Card', 2000, '2025-02-20'),
(3, 3, 'debit Card', 900,  '25-02-20'),
(4, 4, 'paypal', 700, '2025-06-19'),
(5, 5, 'cash', 4000, '2025-04-20');


