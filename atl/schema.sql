-- Passengers table
CREATE TABLE Passengers (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    age INTEGER NOT NULL
);

-- Airlines table
CREATE TABLE Airlines (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    concourses TEXT NOT NULL -- Comma-separated list of concourses (A, B, C, D, E, F, T)
);

-- Flights table
CREATE TABLE Flights (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    flight_number TEXT NOT NULL,
    airline_id INTEGER NOT NULL,
    departure_airport_code TEXT NOT NULL,
    arrival_airport_code TEXT NOT NULL,
    departure_datetime DATETIME NOT NULL,
    arrival_datetime DATETIME NOT NULL,
    FOREIGN KEY (airline_id) REFERENCES Airlines(id)
);

-- CheckIns table
CREATE TABLE CheckIns (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    passenger_id INTEGER NOT NULL,
    flight_id INTEGER NOT NULL,
    check_in_datetime DATETIME NOT NULL,
    FOREIGN KEY (passenger_id) REFERENCES Passengers(id),
    FOREIGN KEY (flight_id) REFERENCES Flights(id)
);

-- Sample data for Passengers
INSERT INTO Passengers (first_name, last_name, age)
VALUES ('Amelia', 'Earhart', 39);

-- Sample data for Airlines
INSERT INTO Airlines (name, concourses)
VALUES ('Delta', 'A,B,C,D,T');

-- Sample data for Flights
INSERT INTO Flights (flight_number, airline_id, departure_airport_code, arrival_airport_code, departure_datetime, arrival_datetime)
VALUES ('300', (SELECT id FROM Airlines WHERE name = 'Delta'), 'ATL', 'BOS', '2023-08-03 18:46:00', '2023-08-03 21:09:00');

-- Sample data for CheckIns
INSERT INTO CheckIns (passenger_id, flight_id, check_in_datetime)
VALUES ((SELECT id FROM Passengers WHERE first_name = 'Amelia' AND last_name = 'Earhart'),
        (SELECT id FROM Flights WHERE flight_number = '300'),
        '2023-08-03 15:03:00');

