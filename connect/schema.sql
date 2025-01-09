-- Users table
CREATE TABLE Users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    username TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL
);

-- Schools table
CREATE TABLE Schools (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    type TEXT NOT NULL,
    location TEXT NOT NULL,
    year_founded INTEGER NOT NULL
);

-- Companies table
CREATE TABLE Companies (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    industry TEXT NOT NULL,
    location TEXT NOT NULL
);

-- User-to-User connections
CREATE TABLE UserConnections (
    user1_id INTEGER NOT NULL,
    user2_id INTEGER NOT NULL,
    FOREIGN KEY (user1_id) REFERENCES Users(id),
    FOREIGN KEY (user2_id) REFERENCES Users(id),
    PRIMARY KEY (user1_id, user2_id)
);

-- User-to-School affiliations
CREATE TABLE UserSchools (
    user_id INTEGER NOT NULL,
    school_id INTEGER NOT NULL,
    start_date TEXT NOT NULL,
    end_date TEXT,
    degree TEXT,
    FOREIGN KEY (user_id) REFERENCES Users(id),
    FOREIGN KEY (school_id) REFERENCES Schools(id),
    PRIMARY KEY (user_id, school_id)
);

-- User-to-Company affiliations
CREATE TABLE UserCompanies (
    user_id INTEGER NOT NULL,
    company_id INTEGER NOT NULL,
    start_date TEXT NOT NULL,
    end_date TEXT,
    title TEXT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(id),
    FOREIGN KEY (company_id) REFERENCES Companies(id),
    PRIMARY KEY (user_id, company_id)
);

-- Sample users
INSERT INTO Users (first_name, last_name, username, password)
VALUES ('Alan', 'Garber', 'alan', 'password'),
       ('Reid', 'Hoffman', 'reid', 'password');

-- Sample school
INSERT INTO Schools (name, type, location, year_founded)
VALUES ('Harvard University', 'University', 'Cambridge, Massachusetts', 1636);

-- Sample company
INSERT INTO Companies (name, industry, location)
VALUES ('LinkedIn', 'Technology', 'Sunnyvale, California');

-- Alan's education
INSERT INTO UserSchools (user_id, school_id, start_date, end_date, degree)
VALUES (1, 1, '1973-09-01', '1976-06-01', 'BA');

-- Reid's employment
INSERT INTO UserCompanies (user_id, company_id, start_date, end_date, title)
VALUES (2, 1, '2003-01-01', '2007-02-01', 'CEO and Chairman');
