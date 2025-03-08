-- Create the People Table
CREATE TABLE IF NOT EXISTS people (
    Id INT PRIMARY KEY NOT NULL,
    Name TEXT NOT NULL,
    Age INT NOT NULL,
    Job TEXT NOT NULL
);

-- Create the Income Table
CREATE TABLE IF NOT EXISTS income (
    Job TEXT PRIMARY KEY NOT NULL,
    Income INT NOT NULL
);

-- Insert Data into People Table
INSERT INTO people(Id, Name, Age, Job) VALUES
(1, 'Alan', 11, 'Unemployed'),
(2, 'Bob', 22, 'Gamer'),
(3, 'Chuck', 33, 'Farmer'),
(4, 'Dave', 44, 'Painter'),
(5, 'Ed', 55, 'Writer'),
(6, 'Fred', 66, 'Writer'),
(7, 'Greg', 77, 'Writer'),
(8, 'Hank', 88, 'Retired'),
(9, 'Ike', 99, 'Retired');

-- Insert Data into Income Table
INSERT INTO income(Job, Income) VALUES
('None', 0),
('Farmer', 200000),
('Painter', 100000),
('Writer', 50000),
('Retired', 0),
('Baker', 80000);

-- Part 1: Select all from the income table where income is greater than 100000
SELECT * FROM income
WHERE Income > 100000;

-- Part 2: Select all people from the people table where Job is either 'Farmer', 'Writer', or 'Baker'
SELECT * FROM people
WHERE Job IN ('Farmer', 'Writer', 'Baker');

-- Part 3: Select all people where Job is in a subquery that finds jobs with income > 100000
SELECT * FROM people
WHERE Job IN (
    SELECT Job
    FROM income
    WHERE Income > 100000
);

-- Part 4: Subquery to select names from people where they earn more than 50000
SELECT Name
FROM people
WHERE Job IN (
    SELECT Job
    FROM income
    WHERE Income > 50000
);
