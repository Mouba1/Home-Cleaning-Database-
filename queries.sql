USE HomeCleaningDB;
SELECT * FROM Customer;
SELECT * FROM Employee;
SELECT * FROM Services;
SELECT * FROM Appointment;
SELECT * FROM Payment;
SELECT * FROM Appointment
WHERE Status = 'Scheduled';
SELECT * FROM Appointment
WHERE Status = 'Completed';

SELECT 
    a.AppointmentID,
    c.FullName AS CustomerName,
    e.FullName AS EmployeeName,
    s.ServiceName,
    a.Date,
    a.Time,
    a.Status
FROM Appointment a
JOIN Customer c ON a.CustomerID = c.CustomerID
JOIN Employee e ON a.EmployeeID = e.EmployeeID
JOIN Services s ON a.ServiceID = s.ServiceID;

SELECT 
    c.FullName AS CustomerName,
    SUM(p.Amount) AS TotalPaid
FROM Payment p
JOIN Appointment a ON p.AppointmentID = a.AppointmentID
JOIN Customer c ON a.CustomerID = c.CustomerID
GROUP BY c.CustomerID;

SELECT 
    s.ServiceName,
    s.Price,
    COUNT(a.AppointmentID) AS TimesBooked
FROM Services s
LEFT JOIN Appointment a ON s.ServiceID = a.ServiceID
GROUP BY s.ServiceID;

