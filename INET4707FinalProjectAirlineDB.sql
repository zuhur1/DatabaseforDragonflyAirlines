SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS; -- Save current state of foreign key checks
SET FOREIGN_KEY_CHECKS = 0; -- Disable foreign key checks to avoid constraint errors during setup

DROP DATABASE IF EXISTS DragonflyAirlinesDB;
CREATE DATABASE DragonflyAirlinesDB;
USE DragonflyAirlinesDB;


DROP TABLE IF EXISTS Airports;
CREATE TABLE Airports (
    AirportID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    City VARCHAR(100),
    Country VARCHAR(100)
);
INSERT INTO Airports (Name, City, Country) VALUES
('Hartsfield-Jackson Atlanta International Airport', 'Atlanta', 'United States'),
('Los Angeles International Airport', 'Los Angeles', 'United States'),
('Chicago O\'Hare International Airport', 'Chicago', 'United States'),
('Dallas/Fort Worth International Airport', 'Dallas', 'United States'),
('Denver International Airport', 'Denver', 'United States'),
('John F. Kennedy International Airport', 'New York', 'United States'),
('San Francisco International Airport', 'San Francisco', 'United States'),
('Seattle-Tacoma International Airport', 'Seattle', 'United States'),
('Orlando International Airport', 'Orlando', 'United States'),
('Miami International Airport', 'Miami', 'United States'),
('Minneapolis-Saint Paul International Airport', 'Minneapolis', 'United States');

 DROP TABLE IF EXISTS Flights;
CREATE TABLE Flights (
    FlightID INT PRIMARY KEY,
    AircraftID INT,
    RouteID INT,
    FlightNumber INT,
    Seats_Booked INT DEFAULT 0,
    Status VARCHAR(50) DEFAULT 'Space Available',
    FOREIGN KEY (AircraftID) REFERENCES Aircraft(AircraftID),
    FOREIGN KEY (RouteID) REFERENCES Route(RouteID)
);

INSERT INTO Flights (FlightID, AircraftID, RouteID, FlightNumber, Seats_Booked, Status)
VALUES
(1, 1, 1, 101, 0, 'Space Available'),
(2, 2, 2, 102, 0, 'Space Available'),
(3, 3, 3, 103, 0, 'Space Available'),
(4, 4, 4, 104, 0, 'Space Available'),
(5, 5, 5, 105, 0, 'Space Available'),
(6, 6, 6, 106, 0, 'Space Available'),
(7, 7, 7, 107, 0, 'Space Available'),
(8, 8, 8, 108, 0, 'Space Available'),
(9, 9, 9, 109, 0, 'Space Available'),
(10, 10, 10, 110, 0, 'Space Available'),
(11, 1, 11, 111, 0, 'Space Available'),
(12, 2, 12, 112, 0, 'Space Available'),
(13, 3, 13, 113, 0, 'Space Available'),
(14, 4, 14, 114, 0, 'Space Available'),
(15, 5, 15, 115, 0, 'Space Available'),
(16, 6, 16, 116, 0, 'Space Available'),
(17, 7, 17, 117, 0, 'Space Available'),
(18, 8, 18, 118, 0, 'Space Available'),
(19, 9, 19, 119, 0, 'Space Available'),
(20, 1, 20, 120, 0, 'Space Available');

Select * FROM Flights;
-- Routes table (Bridge Many-to-Many between Flights and Airports)
DROP TABLE IF EXISTS Routes;
CREATE TABLE Routes (
    RouteID INT AUTO_INCREMENT PRIMARY KEY,
    FlightID INT,
    DepartureTime DATETIME,
    ArrivalTime DATETIME ,
    OriginAirportID INT,
    DestinationAirportID INT,
    FOREIGN KEY (FlightID) REFERENCES Flights(FlightID),
    FOREIGN KEY (OriginAirportID) REFERENCES Airports(AirportID),
    FOREIGN KEY (DestinationAirportID) REFERENCES Airports(AirportID)
);

INSERT INTO Routes (FlightID, DepartureTime, ArrivalTime, OriginAirportID, DestinationAirportID)
VALUES
(1, '2024-01-11 08:00:00', '2024-01-11 11:15:00', 1, 2),
(2, '2024-02-12 03:00:00', '2024-02-12 07:00:00', 3, 4),
(3, '2024-02-17 01:00:00', '2024-02-17 05:00:00', 5, 6),
(4, '2024-03-19 11:00:00', '2024-03-19 13:30:00', 7, 8),
(5, '2024-03-03 12:00:00', '2024-03-03 14:00:00', 9, 10),
(6, '2024-03-04 13:00:00', '2024-03-04 19:30:00', 11, 1),
(7, '2024-03-08 14:00:00', '2024-03-08 19:00:00', 2, 3),
(8, '2024-04-21 15:00:00', '2024-04-21 18:15:00', 4, 5),
(9, '2024-05-14 01:00:00', '2024-05-14 12:45:00', 6, 7),
(10, '2024-06-19 15:00:00', '2024-06-19 23:30:00', 8, 9),
(11, '2024-07-06 08:00:00', '2024-07-06 12:00:00', 10, 11),
(12, '2024-07-01 15:00:00', '2024-07-01 21:00:00', 1, 3),
(13, '2024-08-01 08:00:00', '2024-08-01 12:00:00', 1, 2),
(14, '2024-08-20 09:00:00', '2024-08-20 13:00:00', 3, 4),
(15, '2024-09-03 08:00:00', '2024-09-03 12:00:00', 5, 6),
(16, '2024-09-04 11:00:00', '2024-09-04 13:00:00', 7, 8),
(17, '2024-10-30 12:00:00', '2024-10-30 14:00:00', 9, 10),
(18, '2024-11-29 13:00:00', '2024-11-29 15:00:00', 11, 3),
(19, '2024-12-06 14:00:00', '2024-12-06 18:00:00', 9, 4),
(20, '2024-12-08 15:00:00', '2024-12-08 17:30:00', 8, 2);


-- Passengers table
DROP TABLE IF EXISTS Passengers;
CREATE TABLE Passengers (
    PassengerID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Email VARCHAR(100) UNIQUE
);
INSERT INTO Passengers (FirstName, LastName, Email)
VALUES
('John', 'Smith', 'j.smith@email.com'),
('Jane', 'Doe', 'j.doe@email.com'),
('Michael', 'Johnson', 'm.johnson@email.com'),
('Emily', 'Davis', 'e.davis@email.com'),
('David', 'Wilson', 'd.wilson@email.com'),
('Sarah', 'Brown', 's.brown@email.com'),
('Christopher', 'Taylor', 'c.taylor@email.com'),
('Amanda', 'Anderson', 'a.anderson@email.com'),
('Matthew', 'Thomas', 'm.thomas@email.com'),
('Jessica', 'Jackson', 'j.jackson@email.com'),
('Daniel', 'White', 'd.white@email.com'),
('Laura', 'Harris', 'l.harris@email.com'),
('Andrew', 'Martin', 'a.martin@email.com'),
('Sophia', 'Garcia', 's.garcia@email.com'),
('Joshua', 'Martinez', 'j.martinez@email.com'),
('Olivia', 'Clark', 'o.clark@email.com'),
('Ryan', 'Rodriguez', 'r.rodriguez@email.com'),
('Isabella', 'Lewis', 'i.lewis@email.com'),
('Ethan', 'Lee', 'e.lee@email.com'),
('Muhammad', 'Ali', 'm.ali@email.com');

DROP TABLE IF EXISTS Reservations;
CREATE TABLE Reservations (
    ReservationID INT AUTO_INCREMENT PRIMARY KEY,
    PassengerID INT,
    FlightID INT,
    Seat VARCHAR(10),
    Class VARCHAR(20),
    FOREIGN KEY (PassengerID) REFERENCES Passengers(PassengerID),
    FOREIGN KEY (FlightID) REFERENCES Flights(FlightID)
);

INSERT INTO Reservations (PassengerID, FlightID, Seat, Class)
VALUES -- 3 random passengers per flight
(1, 1, '1A', 'Economy'), 
(2, 1, '1B', 'Economy'),  -- flight 1
(3, 1, '1C', 'Economy'),

(4, 2, '2A', 'Business'), 
(5, 2, '2B', 'Business'),  -- flight 2
(6, 2, '2C', 'First'),

(7, 3, '3A', 'Economy'), 
(8, 3, '3B', 'Economy'),  -- flight 3
(9, 3, '3C', 'Economy'),

(10, 4, '4A', 'Economy'), 
(11, 4, '4B', 'Economy'),  -- flight 4
(12, 4, '4C', 'Economy'),

(13, 5, '5A', 'Business'), 
(14, 5, '5B', 'Economy'), -- Flight 5
(15, 5, '5C', 'Economy'),

(16, 6, '6A', 'Economy'), 
(17, 6, '6B', 'Economy'), -- flight 6
(18, 6, '6C', 'Economy'),

(19, 7, '7A', 'First'),
(20, 7, '7B', 'Business'), -- flight 7
(1, 7, '7C', 'Economy'),

(2, 8, '8A', 'Economy'), 
(3, 8, '8B', 'Economy'),  -- flight 8
(4, 8, '8C', 'Economy'),

(5, 9, '9A', 'Business'), 
(6, 9, '9B', 'Business'), -- flight 9
(7, 9, '9C', 'Economy'),

(8, 10, '10A', 'Economy'), 
(9, 10, '10B', 'Economy'), -- flight 10
(10, 10, '10C', 'Economy'),

(11, 11, '11A', 'First'), 
(12, 11, '11B', 'Economy'), -- flight 11
(13, 11, '11C', 'Economy'),

(14, 12, '12A', 'Business'), 
(15, 12, '12B', 'Business'), -- flight 12
(16, 12, '12C', 'Business'),

(17, 13, '13A', 'Economy'), 
(18, 13, '13B', 'Economy'), -- flight 13
(19, 13, '13C', 'Economy'),

(20, 14, '14A', 'Economy'), 
(1, 14, '14B', 'Economy'), -- flight 14
(2, 14, '14C', 'Economy'),

(3, 15, '15A', 'Business'), 
(4, 15, '15B', 'Business'), -- flight 15
(5, 15, '15C', 'Economy'),

(6, 16, '16A', 'Economy'), 
(7, 16, '16B', 'Economy'), -- flight 16
(8, 16, '16C', 'Economy'),

(9, 17, '17A', 'Economy'), 
(10, 17, '17B', 'First'), -- flight 17
(11, 17, '17C', 'Economy'),

(18, 18, '18A', 'Economy'),
(15, 18, '18B', 'Business'), -- flight 18
(9, 18, '18C', 'Economy'),

(13, 19, '19A', 'Economy'),
(8, 19, '19B', 'Economy'), -- flight 19
(1, 19, '19C', 'Economy'),

(20, 20, '20A', 'First'), 
(11, 20, '20B', 'Business'), -- flight 20
(14, 20, '20C', 'Economy');




-- Luggage table 
DROP TABLE IF EXISTS Luggage;
CREATE TABLE Luggage (
    LuggageID INT AUTO_INCREMENT PRIMARY KEY,
    PassengerID INT,
    FlightID INT,
    Weight FLOAT,
    FOREIGN KEY (PassengerID) REFERENCES Passengers(PassengerID),
    FOREIGN KEY (FlightID) REFERENCES Flights(FlightID)
);

INSERT INTO Luggage (PassengerID, FlightID, Weight) VALUES
(1, 1, 10.3), 
(2, 1, 30.2), -- flight 1
(3, 1, 61.1),

(4, 2, 5.5), 
(5, 2, 18.6), -- flight 2
(6, 2, 22.7),

(7, 3, 11.4),
 (8, 3, 16.8), -- flight 3
 (9, 3, 19.5),

(10, 4, 68.0), 
(11, 4, 52.7), -- flight 4
(12, 4, 21.3),

(13, 5, 17.5), 
(14, 5, 20.0), -- flight 5
(15, 5, 18.9),

(16, 6, 40.5), 
(17, 6, 15.7), -- flight 6
(18, 6, 23.0),

(19, 7, 12.8), 
(20, 7, 24.6), -- flight 7
(1, 7, 18.4),

(2, 8, 9.8), 
(3, 8, 14.2), -- flight 8
(4, 8, 20.9),

(5, 9, 16.5), 
(6, 9, 22.1), -- flight 9
(7, 9, 13.0),

(8, 10, 11.1), 
(9, 10, 17.7), -- flight 10
(10, 10, 19.9),

(11, 11, 12.3), 
(12, 11, 15.0), -- flight 11
(13, 11, 10.8),

(14, 12, 16.4), 
(15, 12, 23.3), -- flight 12
(16, 12, 18.0),

(17, 13, 9.6), 
(18, 13, 14.8), -- flight 13
(19, 13, 20.2),

(20, 14, 13.5), 
(1, 14, 17.2), -- flight 14
(2, 14, 22.9),

(3, 15, 18.1), 
(4, 15, 10.3), -- flight 15
(5, 15, 14.7),

(6, 16, 12.9), 
(7, 16, 21.6), -- flight 16
(8, 16, 15.4),

(9, 17, 14.9), 
(10, 17, 23.4), -- Flight 17
(11, 17, 11.6),

(18, 18, 17.8),
(15, 18, 20.0), -- Flight 18
(9, 18, 10.7),

(13, 19, 12.2), 
(8, 19, 16.7), -- Flight 19
(1, 19, 18.9),

(20, 20, 22.1), 
(11, 20, 15.9), -- Flight 20
(14, 20, 19.6);

DROP TABLE IF EXISTS Employees;
CREATE TABLE Employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    HireDate DATE,
    Salary DECIMAL(10,2)
);

INSERT INTO Employees (FirstName, LastName, HireDate, Salary) VALUES
('Alice', 'Smith', '2018-01-15', 45000.00),  -- Gate Agent 1
('William', 'Johnson', '2017-03-21', 46000.00), -- Gate Agent 2
('Catherine', 'Williams', '2019-05-10', 47000.00), -- Gate Agent 3
('David', 'Brown', '2020-02-12', 48000.00),  -- Gate Agent 4
('Emma', 'Jones', '2016-06-30', 49000.00),   -- Gate Agent 5
('Frank', 'Miller', '2021-09-19', 50000.00), -- Gate Agent 6
('Grace', 'Davis', '2019-04-25', 51000.00),  -- Gate Agent 7
('Henry', 'Garcia', '2018-11-13', 52000.00), -- Gate Agent 8
('Isabella', 'Wilson', '2023-07-08', 53000.00), -- Gate Agent 9
('Jack', 'Martinez', '2019-08-01', 54000.00),   -- Gate Agent 10
('Natalie', 'Toucar', '2023-04-17',61000.00), -- Gate Agent 11, one for every airport

('Kelly', 'Taylor', '2015-10-20', 75000.00),    -- Pilot 1
('Liam', 'Hernandez', '2013-09-05', 76000.00),  -- Pilot 2
('Enzo', 'Lopez', '2024-02-11', 77000.00),       -- Pilot 3
('Nathan', 'Clark', '2016-01-03', 78000.00),    -- Pilot 4
('Olivia', 'Lewis', '2021-03-25', 79000.00),    -- Pilot 5
('Angel', 'Robinson', '2012-05-16', 80000.00),-- Pilot 6
('Quinn', 'Walker', '2018-07-29', 81000.00),    -- Pilot 7
('Rachel', 'Hall', '2014-04-10', 82000.00),     -- Pilot 8
('Samuel', 'Allen', '2013-06-12', 83000.00),    -- Pilot 9
('Tina', 'Young', '2017-08-23', 84000.00),      -- Pilot 10

('Alice', 'King', '2019-03-04', 40000.00),        -- Flight Attendant 1
('Victor', 'Scott', '2018-06-30', 41000.00),    -- Flight Attendant 2
('Wendy', 'Green', '2017-02-15', 42000.00),     -- Flight Attendant 3
('Xavier', 'Adams', '2020-05-08', 43000.00),    -- Flight Attendant 4
('Yasmine', 'Baker', '2016-10-10', 44000.00),   -- Flight Attendant 5
('Zachary', 'Gonzalez', '2018-04-18', 45000.00),-- Flight Attendant 6
('April', 'Nelson', '2021-01-29', 46000.00),    -- Flight Attendant 7
('William', 'Carter', '2019-11-07', 47000.00),      -- Flight Attendant 8
('Tanner', 'Mitchell', '2015-07-23', 48000.00),  -- Flight Attendant 9
('Derek', 'Perez', '2020-09-14', 49000.00);     -- Flight Attendant 10



DROP TABLE IF EXISTS GateAgent;
CREATE TABLE GateAgents (
    GateAgentID INT AUTO_INCREMENT PRIMARY KEY,
    EmployeeID INT,
    AirportID INT UNIQUE,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (AirportID) REFERENCES Airports(AirportID)
);
INSERT INTO GateAgents (EmployeeID, AirportID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11,11);

DROP TABLE IF EXISTS FlightAttendants;
CREATE TABLE FlightAttendants (
    FlightAttendantID INT AUTO_INCREMENT PRIMARY KEY,
    EmployeeID INT UNIQUE,
    YearsOfExperience INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);
INSERT INTO FlightAttendants (EmployeeID, YearsOfExperience) VALUES
(22, 3),
(23, 5),
(24, 7),
(25, 2),
(26, 6),
(27, 4),
(28, 3),
(29, 15),
(30, 8),
(31, 6);

DROP TABLE IF EXISTS Pilots;
CREATE TABLE Pilots (
    PilotID INT AUTO_INCREMENT PRIMARY KEY,
    EmployeeID INT,
    MilesFlown FLOAT,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);
INSERT INTO Pilots (EmployeeID, MilesFlown) VALUES
(12, 1200000.50),
(13, 1350000.75),
(14, 1105000.25),
(15, 1450000.00),
(16, 1520000.30),
(17, 1600000.60),
(18, 1180000.40),
(19, 2750000.20),
(20, 1400000.10),
(21, 1650000.80);

DROP TABLE IF EXISTS FlightCrew; -- 2 pilots and 2 flight attendants for every flight 
CREATE TABLE FlightCrew (
    AssignmentID INT AUTO_INCREMENT PRIMARY KEY,
    FlightID INT,
    PilotOneID INT,
    PilotTwoID INT,
    FlightAttendantOneID INT,
    FlightAttendantTwoID INT,
    FOREIGN KEY (FlightID) REFERENCES Flights(FlightID) ON DELETE CASCADE,
    FOREIGN KEY (PilotOneID) REFERENCES Employees(EmployeeID) ON DELETE CASCADE,
	FOREIGN KEY (PilotTwoID) REFERENCES Employees(EmployeeID) ON DELETE CASCADE, -- pilots are ids 12-21 in the employee db
    FOREIGN KEY (FlightAttendantOneID) REFERENCES Employees(EmployeeID) ON DELETE CASCADE, -- attendants are ids 22-31 in the employee db
    FOREIGN KEY (FlightAttendantTwoID) REFERENCES Employees(EmployeeID) ON DELETE CASCADE
);

INSERT INTO FlightCrew (FlightID, PilotOneID, PilotTwoID, FlightAttendantOneID, FlightAttendantTwoID)
VALUES 
(1, 12, 11, 22, 26), -- each flight flight id has a random combination of 2 pilots and 2 attendants
(2, 18, 13, 30, 23),
(3, 11, 12, 31, 24),
(4, 11, 16, 25, 28),
(5, 20, 21, 29, 30),
(6, 16, 15, 31, 27),
(7, 13, 14, 28, 29),
(8, 15, 18, 26, 27),
(9, 19, 17, 30, 22),
(10, 21, 13, 29, 31),
(11, 12, 13, 23, 30),
(12, 17, 19, 28, 24),
(13, 16, 14, 30, 27),
(14, 15, 12, 25, 26),
(15, 14, 20, 27, 29),
(16, 18, 14, 31, 24),
(17, 20, 12, 31, 25),
(18, 19, 13, 23, 27),
(19, 14, 15, 77, 22),
(20, 20, 17, 22, 30);



DROP TABLE IF EXISTS Payments;
CREATE TABLE Payments (
    PaymentID INT AUTO_INCREMENT PRIMARY KEY,
    PassengerID INT,
    Amount DECIMAL(10, 2), -- Payment amount
    PaymentDate DATE,
    FOREIGN KEY (PassengerID) REFERENCES Passengers(PassengerID) ON DELETE CASCADE
);

INSERT INTO Payments (PassengerID, Amount, PaymentDate)
SELECT r.PassengerID, 
       CASE 
           WHEN r.Class = 'Economy' THEN 200.00
           WHEN r.Class = 'Business' THEN 500.00
           WHEN r.Class = 'First' THEN 700.00
       END AS Amount,
       rt.DepartureTime AS PaymentDate
FROM Reservations r
JOIN Flights f ON r.FlightID = f.FlightID
JOIN Routes rt ON f.RouteID = rt.RouteID;



DROP TABLE IF EXISTS Aircraft;
CREATE TABLE Aircraft (
    AircraftID INT AUTO_INCREMENT PRIMARY KEY,
    AircraftType VARCHAR(50),
    PassengerCapacity INT
);

INSERT INTO Aircraft (AircraftType, PassengerCapacity)
VALUES 
('Boeing 737', 180),
('Airbus A320', 160),
('Boeing 777', 300),
('Airbus A380', 555),
('Boeing 787', 242),
('Airbus A350', 280),
('Boeing 767', 230),
('Airbus A330', 280),
('Embraer E175', 88),
('Bombardier', 200);

DROP TABLE IF EXISTS MaintenanceRequest;
CREATE TABLE MaintenanceRequest (
    RequestID INT AUTO_INCREMENT PRIMARY KEY,
    AircraftID INT, 
    RequestDate DATE, 
    Status VARCHAR(50), 
    FOREIGN KEY (AircraftID) REFERENCES Aircraft(AircraftID) ON DELETE CASCADE
);
-- Maintenance Requests
INSERT INTO MaintenanceRequest (AircraftID, RequestDate, Status)
VALUES
(1, '2024-01-01', 'Pending'),
(2, '2024-02-03', 'Completed'),
(3, '2024-03-05', 'In Progress'),
(4, '2024-04-07', 'Pending'),
(5, '2024-05-09', 'Completed'),
(6, '2024-06-10', 'Waiting for inspection'),
(7, '2024-07-12', 'Completed'),
(8, '2024-08-14', 'In Progress'),
(9, '2024-09-16', 'Waiting for inspection'),
(10, '2024-10-18', 'Completed');

DROP TABLE IF EXISTS Service;
CREATE TABLE Service (
    ServiceID INT AUTO_INCREMENT PRIMARY KEY,
    RequestID INT , --
    ServiceDate DATE,
    FOREIGN KEY (RequestID) REFERENCES MaintenanceRequest(RequestID) ON DELETE CASCADE
);
-- Services for Maintenance Requests
INSERT INTO Service (RequestID, ServiceDate)
VALUES
(1, '2024-11-05'),
(2, '2024-11-06'),
(3, '2024-11-08'),
(4, '2024-11-10'),
(5, '2024-11-11'),
(6, '2024-11-13'),
(7, '2024-11-15'),
(8, '2024-11-17'),
(9, '2024-11-19'),
(10, '2024-11-20');

DROP TABLE IF EXISTS FlightHistory;
CREATE TABLE FlightHistory(
	FlightHistoryID INT PRIMARY KEY AUTO_INCREMENT,
    FlightID INT,
    ExpectedDeparture DATETIME,
    ActualDeparture DATETIME,
    OriginAirportID INT,
    DestinationAirportID INT,
    FOREIGN KEY (FlightID) REFERENCES Flights(FlightID),
    FOREIGN KEY (OriginAirportID) REFERENCES Airports(AirportID),
    FOREIGN KEY (DestinationAirportID) REFERENCES Airports(AirportID)
);

INSERT INTO FlightHistory (FlightID, ExpectedDeparture, ActualDeparture, OriginAirportID, DestinationAirportID)
VALUES 
(1, '2024-01-11 08:00:00', '2024-01-11 08:05:00', 1, 2),
(2, '2024-02-12 03:00:00', '2024-02-12 04:10:00', 3, 4),
(3, '2024-02-17 01:00:00', '2024-02-17 01:15:00', 5, 6),
(4, '2024-03-19 11:00:00', '2024-03-19 11:10:00', 7, 8),
(5, '2024-03-03 12:00:00', '2024-03-03 12:00:00', 9, 10),
(6, '2024-03-04 13:00:00', '2024-03-04 13:10:00', 11, 1),
(7, '2024-03-08 14:00:00', '2024-03-08 14:05:00', 2, 3),
(8, '2024-04-21 15:00:00', '2024-04-21 16:10:00', 4, 5),
(9, '2024-05-14 01:00:00', '2024-05-14 03:20:00', 6, 7),
(10, '2024-06-19 15:00:00', '2024-06-19 19:15:00', 8, 9),
(11, '2024-07-06 08:00:00', '2024-07-06 08:05:00', 10, 11),
(12, '2024-07-01 15:00:00', '2024-07-01 15:05:00', 1, 3),
(13, '2024-08-01 08:00:00', '2024-08-01 08:15:00', 1, 2),
(14, '2024-08-20 09:00:00', '2024-08-20 09:10:00', 3, 4),
(15, '2024-09-03 08:00:00', '2024-09-03 08:05:00', 5, 6),
(16, '2024-09-04 11:00:00', '2024-09-04 11:10:00', 7, 8),
(17, '2024-10-30 12:00:00', '2024-10-30 12:20:00', 9, 10),
(18, '2024-11-29 13:00:00', '2024-11-29 14:15:00', 11, 3),
(19, '2024-12-06 14:00:00', '2024-12-06 15:05:00', 9, 4),
(20, '2024-12-08 15:00:00', '2024-12-08 15:10:00', 8, 2);


DROP TABLE IF EXISTS Reviews;
CREATE TABLE Reviews (
    ReviewID INT PRIMARY KEY AUTO_INCREMENT,
    FlightID INT,
    Rating INT, -- passenger rating of the flight 1-10
    Comments VARCHAR(100),
    PassengerID INT,
    FOREIGN KEY (FlightID) REFERENCES Flights(FlightID),
    FOREIGN KEY (PassengerID) REFERENCES Passengers(PassengerID)
);

INSERT INTO Reviews (FlightID, Rating, Comments, PassengerID)
VALUES 
(1, 10, 'Smooth flight!', 1),
(2, 8, 'Comfortable', 5),
(3, 4, 'Seats too small', 9),
(4, 9, 'Great crew serivce !', 11),

(5, 3, 'Delayed and uncomfortable.', 14),
(6, 7, 'Good overall', 17),
(7, 10, 'Flight was fantastic', 20),
(8, 8, 'Good food', 4),
(9, 8, 'Okay flight', 7),
(10, 7, 'Friendly crew, nice snacks.', 8),
(11, 10, 'Best flight I have had in years!', 11),

(12, 4, 'Slightly disappointing.', 15),
(13, 7, 'Efficient boarding process.', 18),
(14, 5, 'Noisy flight', 1),
(15, 9, 'Great media on the plane', 5),
(16, 8, 'Good Dinner', 8),
(17, 8, 'Clean bathrooms', 9),

(18, 4, 'Long delay', 15),
(19, 6, 'Nice staff', 8),
(20, 10, 'Perfect experience', 14);


-- (alieu) trigger 
-- before insert on passenger table, given the passenger first and last name
-- make the table insert the email automatically

DROP TRIGGER IF EXISTS set_passenger_email;
DELIMITER //

CREATE TRIGGER set_passenger_email
BEFORE INSERT ON Passengers
FOR EACH ROW
BEGIN
	IF NEW.Email IS NULL OR NEW.Email = '' THEN
    SET NEW.Email = CONCAT(NEW.FirstName, '.', NEW.LastName, '@email.com');
    END IF;
END //
DELIMITER;

-- Trigger 2. Update the payment table every time a reservation is made sumaya trigger
-- 1 reservation = 1 new payment 
DROP TRIGGER IF EXISTS PaymentInsertAfterReservation;
CREATE TRIGGER PaymentInsertAfterReservation
AFTER INSERT ON Reservations
FOR EACH ROW
BEGIN
    INSERT INTO Payments (PassengerID, Amount, PaymentDate)
    SELECT 
        NEW.PassengerID,
        CASE 
            WHEN NEW.Class = 'Economy' THEN 200.00
            WHEN NEW.Class = 'Business' THEN 500.00
            WHEN NEW.Class = 'First' THEN 700.00
        END AS Amount,
        rt.DepartureTime AS PaymentDate
    FROM Flights f
    JOIN Routes rt ON f.RouteID = rt.RouteID
    WHERE f.FlightID = NEW.FlightID;
END $$

-- milo trigger
DROP TRIGGER IF EXISTS AfterMaintenanceRequestUpdate;
CREATE TRIGGER AfterMaintenanceRequestUpdate
AFTER UPDATE ON MaintenanceRequest
FOR EACH ROW
BEGIN
    INSERT INTO Service (RequestID, ServiceDate)
    VALUES (NEW.RequestID, NOW());
END $$

DELIMITER ;



-- trigger 4: Zuhur

DELIMITER $$
CREATE TRIGGER UpdateSeatsAndCheckCapacity 
AFTER INSERT ON Reservations
FOR EACH ROW
BEGIN
    DECLARE seat_capacity INT;
    DECLARE seats_booked INT;

    SELECT A.PassengerCapacity
    INTO seat_capacity
    FROM Aircraft A
    JOIN Flights F ON A.AircraftID = F.AircraftID
    WHERE F.FlightID = NEW.FlightID;

    SELECT Seats_Booked
    INTO seats_booked
    FROM Flights
    WHERE FlightID = NEW.FlightID;

    UPDATE Flights
    SET Seats_Booked = Seats_Booked + 1
    WHERE FlightID = NEW.FlightID;

    IF seats_booked + 1 = seat_capacity THEN
        UPDATE Flights
        SET Status = 'Fully Booked'
        WHERE FlightID = NEW.FlightID;
    END IF;
END$$



-- Queries: 
-- query 1: finding the average satisfaction rating per customer (Sumaya)


DROP VIEW IF EXISTS AvgPassengerSatisfaction;
CREATE VIEW AvgPassengerSatisfaction AS
SELECT 
    p.FirstName,
    AVG(r.Rating) AS AvgSatisfaction
FROM 
    Passengers p
LEFT JOIN 
    Reviews r ON p.PassengerID = r.PassengerID
GROUP BY 
    p.FirstName
ORDER BY 
    AvgSatisfaction DESC;

SELECT * FROM AvgPassengerSatisfaction;


-- Query 2: Determining the 5 months with lowest revenue (Alieu)


DROP VIEW IF EXISTS LowestRevenueMonths;
CREATE VIEW LowestRevenueMonths AS
SELECT 
    DATE_FORMAT(PaymentDate, '%Y-%m') AS Month, 
    SUM(Amount) AS TotalRevenue
FROM Payments
GROUP BY DATE_FORMAT(PaymentDate, '%Y-%m')
ORDER BY TotalRevenue ASC 
LIMIT 5;

SELECT * FROM LowestRevenueMonths;



-- query 3 : (Zuhur) percentegent of flights that depart within 15 mintues of time

DROP VIEW IF EXISTS DepartureStatusSummary;
CREATE VIEW DepartureStatusSummary AS
SELECT 
    CASE
        WHEN TIMESTAMPDIFF(MINUTE, ExpectedDeparture, ActualDeparture) <= 15 THEN 'On Time'
        ELSE 'Delayed'
    END AS DepartureStatus,
    COUNT(*) AS TotalFlights,
    (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM FlightHistory)) AS Percentage
FROM FlightHistory
GROUP BY DepartureStatus;

SELECT * FROM DepartureStatusSummary;




-- query 4: average ticket price (Milo)


DROP VIEW IF EXISTs AverageTicketPrice;
CREATE VIEW AverageTicketPrice AS
SELECT 
    AVG(
        CASE 
            WHEN Class = 'Economy' THEN 200.00
            WHEN Class = 'Business' THEN 500.00
            WHEN Class = 'First' THEN 700.00
        END
    ) AS AverageTicketPrice
FROM Reservations;

SELECT * FROM AverageTicketPrice;



-- stored procedure 
-- 1. Creating a Stored Procedure to Retrieve a Student by Full Name.
DROP PROCEDURE IF EXISTS GetPassengerbyName;
DELIMITER //
CREATE PROCEDURE GetPassengerbyName(IN PassengerName VARCHAR(50))
BEGIN
    SELECT * FROM Passengers 
    WHERE CONCAT(FirstName, ' ', LastName) = PassengerName;
END //
DELIMITER ;
DELIMITER $$

-- procedure test:
CALL GetPassengerbyName('Jane Doe');

SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS;




