
-- Creating the Designation table
CREATE TABLE Designations (
    DESIGNATION_ID INT PRIMARY KEY,
    Job_Title VARCHAR(255) NOT NULL,
    Job_Description TEXT,
    Education_Requirements TEXT,
    Skills TEXT
);


-- Creating the Department table
CREATE TABLE Departments (
    DPT_ID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Address VARCHAR(255)
);

-- Creating the Employee table
CREATE TABLE Employees (
    EMP_ID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Birthdate DATE NOT NULL,
    Address VARCHAR(255),
    Employment_Date DATE NOT NULL,
    Job_Title VARCHAR(255) NOT NULL,
    Contact_Details VARCHAR(255),
    DESIGNATION_ID INT,
    FOREIGN KEY (DESIGNATION_ID) REFERENCES Designations(DESIGNATION_ID)
        ON UPDATE CASCADE 
        ON DELETE SET NULL

);

-- Creating the Attendance table
CREATE TABLE Attendance (
    ID INT PRIMARY KEY,
    EMP_ID INT,
    Date_of_Attendance DATE NOT NULL,
    Time_In TIME,
    Time_Out TIME,
    Hours_Worked DECIMAL(5, 2),
    Overtime_Hours DECIMAL(5, 2),
    FOREIGN KEY (EMP_ID) REFERENCES Employees(EMP_ID)
       
);

-- Creating the Salary table
CREATE TABLE Salaries (
    EMP_ID INT,
    Salary_Amount DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (EMP_ID),
    FOREIGN KEY (EMP_ID) REFERENCES Employees(EMP_ID)
        ON UPDATE CASCADE 
        
);

-- Creating the Deduction table
CREATE TABLE Deductions (
    ID INT PRIMARY KEY,
    EMP_ID INT NOT NULL,
    Deduction_Type VARCHAR(255) NOT NULL,
    Amount_Deducted DECIMAL(10, 2) NOT NULL,
    Date_of_Deduction DATE NOT NULL,
    FOREIGN KEY (EMP_ID) REFERENCES Employees(EMP_ID)
        ON UPDATE CASCADE 
        
);

-- Creating the Leave table
CREATE TABLE Leaves (
    ID INT PRIMARY KEY,
    EMP_ID INT NOT NULL,
    Leave_Type VARCHAR(255) NOT NULL,
    Start_Date DATE NOT NULL,
    End_Date DATE NOT NULL,
    Length_of_Leave INT NOT NULL,
    FOREIGN KEY (EMP_ID) REFERENCES Employees(EMP_ID)
		ON UPDATE CASCADE 
        
);

-- Creating the Payment table
CREATE TABLE Payments (
    PAYMENT_ID INT PRIMARY KEY,
    EMP_ID INT NOT NULL,
    Payment_Date DATE NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    Mode_of_Payment VARCHAR(255) NOT NULL,
    FOREIGN KEY (EMP_ID) REFERENCES Employees(EMP_ID)
        ON UPDATE CASCADE 
        
);


INSERT INTO Designations (DESIGNATION_ID, Job_Title, Job_Description, Education_Requirements, Skills) VALUES
(1, 'Software Engineer', 'Develops and maintains software applications.', 'Bachelor''s degree in Computer Science or related field', 'Java, Python, SQL'),
(2, 'HR Manager', 'Oversees human resources operations and policies.', 'Bachelor''s degree in Human Resources or related field', 'Recruitment, Employee Relations, Training'),
(3, 'Marketing Specialist', 'Creates and implements marketing strategies.', 'Bachelor''s degree in Marketing or related field', 'Digital Marketing, Social Media Management, Analytics'),
(4, 'Financial Analyst', 'Analyzes financial data and provides insights for decision-making.', 'Bachelor''s degree in Finance or related field', 'Financial Modeling, Data Analysis, Excel'),
(5, 'Operations Manager', 'Manages daily operations and ensures efficiency and productivity.', 'Bachelor''s degree in Business Administration or related field', 'Operations Management, Leadership, Problem-solving'),
(6, 'Customer Service Representative', 'Handles customer inquiries and resolves issues.', 'High school diploma or equivalent', 'Communication, Problem-solving, Patience'),
(7, 'Graphic Designer', 'Creates visual concepts and designs for various purposes.', 'Bachelor''s degree in Graphic Design or related field', 'Adobe Creative Suite, Typography, Illustration'),
(8, 'Sales Manager', 'Leads sales team and develops sales strategies.', 'Bachelor''s degree in Sales, Marketing, or related field', 'Sales Management, Negotiation, Customer Relationship Management'),
(9, 'Accountant', 'Manages financial records and prepares reports.', 'Bachelor''s degree in Accounting or related field', 'Accounting Principles, Financial Reporting, Taxation'),
(10, 'Project Manager', 'Oversees project planning, execution, and delivery.', 'Bachelor''s degree in Project Management or related field', 'Project Planning, Leadership, Risk Management'),
(11, 'Software Developer', 'Designs, develops, and tests software applications.', 'Bachelor''s degree in Computer Science or related field', 'Programming, Software Development Lifecycle, Problem-solving'),
(12, 'Data Analyst', 'Analyzes and interprets data to support decision-making.', 'Bachelor''s degree in Statistics, Economics, or related field', 'Data Analysis, Statistical Analysis, Data Visualization'),
(13, 'Quality Assurance Analyst', 'Tests software applications to ensure quality and functionality.', 'Bachelor''s degree in Computer Science or related field', 'Quality Assurance, Testing Methodologies, Bug Tracking'),
(14, 'Business Analyst', 'Analyzes business processes and identifies areas for improvement.', 'Bachelor''s degree in Business Administration, Finance, or related field', 'Business Process Modeling, Requirements Analysis, Stakeholder Management'),
(15, 'IT Support Specialist', 'Provides technical assistance and support to end-users.', 'Associate degree or equivalent experience in Information Technology', 'Technical Support, Troubleshooting, Customer Service'),
(16, 'Content Writer', 'Creates content for websites, blogs, and other platforms.', 'Bachelor''s degree in English, Journalism, or related field', 'Copywriting, Content Creation, SEO'),
(17, 'Network Administrator', 'Manages and maintains computer networks.', 'Bachelor''s degree in Information Technology or related field', 'Network Security, Cisco Systems, Troubleshooting'),
(18, 'Web Developer', 'Designs and develops websites and web applications.', 'Bachelor''s degree in Computer Science or related field', 'HTML, CSS, JavaScript, Web Development Frameworks'),
(19, 'Digital Marketing Specialist', 'Creates and implements digital marketing campaigns.', 'Bachelor''s degree in Marketing, Communications, or related field', 'SEO, SEM, Social Media Marketing'),
(20, 'Human Resources Coordinator', 'Assists with various HR functions and processes.', 'Bachelor''s degree in Human Resources, Business Administration, or related field', 'Employee Relations, Recruitment Coordination, HRIS'),
(21, 'Database Administrator', 'Manages and maintains databases.', 'Bachelor''s degree in Computer Science, Information Technology, or related field', 'Database Management, SQL, Backup and Recovery'),
(22, 'UI/UX Designer', 'Designs user interfaces and user experiences for digital products.', 'Bachelor''s degree in Design, Computer Science, or related field', 'User Experience Design, Usability Testing, Prototyping');

INSERT INTO Departments (DPT_ID, Name, Address) VALUES
(1, 'Marketing', '123 Marketing Street'),
(2, 'Finance', '456 Finance Avenue'),
(3, 'Human Resources', '789 HR Lane'),
(4, 'Information Technology', '101 IT Boulevard'),
(5, 'Operations', '234 Operations Drive'),
(6, 'Sales', '567 Sales Road'),
(7, 'Customer Service', '890 Customer Service Circle'),
(8, 'Research and Development', '123 R&D Avenue'),
(9, 'Accounting', '456 Accounting Lane'),
(10, 'Production', '789 Production Street'),
(11, 'Quality Assurance', '101 QA Road'),
(12, 'Legal', '234 Legal Lane'),
(13, 'Administration', '567 Admin Street'),
(14, 'Supply Chain', '890 Supply Chain Road'),
(15, 'Public Relations', '123 PR Lane'),
(16, 'Facilities Management', '456 Facilities Drive'),
(17, 'Engineering', '789 Engineering Avenue'),
(18, 'Logistics', '101 Logistics Street'),
(19, 'Training and Development', '234 Training Lane'),
(20, 'Safety and Compliance', '567 Safety Road'),
(21, 'Health and Wellness', '890 Health Avenue'),
(22, 'Customer Success', '123 Customer Success Lane');

INSERT INTO Employees (EMP_ID, Name, Birthdate, Address, Employment_Date, Job_Title, Contact_Details) VALUES
(1, 'John Doe', '1990-05-15', '123 Main Street, Cityville', '2020-01-01', 'Software Engineer', 'john.doe@example.com'),
(2, 'Jane Smith', '1985-08-20', '456 Elm Street, Townsville', '2018-03-15', 'Marketing Manager', 'jane.smith@example.com'),
(3, 'Michael Johnson', '1987-12-10', '789 Oak Street, Villagetown', '2015-06-30', 'Financial Analyst', 'michael.johnson@example.com'),
(4, 'Emily Brown', '1992-04-25', '101 Pine Street, Hamletville', '2019-09-10', 'HR Specialist', 'emily.brown@example.com'),
(5, 'David Martinez', '1988-10-05', '234 Maple Street, Citytown', '2017-02-20', 'Network Administrator', 'david.martinez@example.com'),
(6, 'Sarah Wilson', '1991-07-18', '567 Cedar Street, Countyville', '2016-08-05', 'Sales Representative', 'sarah.wilson@example.com'),
(7, 'Matthew Taylor', '1986-03-30', '890 Birch Street, Villageton', '2014-05-12', 'Operations Manager', 'matthew.taylor@example.com'),
(8, 'Amanda Lee', '1993-09-12', '123 Pineapple Street, Townetown', '2020-11-28', 'Customer Service Representative', 'amanda.lee@example.com'),
(9, 'Christopher White', '1989-01-28', '456 Cherry Street, Citytown', '2018-04-15', 'Software Developer', 'christopher.white@example.com'),
(10, 'Jessica Garcia', '1990-06-20', '789 Grape Street, Countyville', '2016-07-01', 'Marketing Coordinator', 'jessica.garcia@example.com'),
(11, 'Ryan Clark', '1984-11-15', '101 Banana Street, Villagetown', '2015-03-10', 'Financial Planner', 'ryan.clark@example.com'),
(12, 'Melissa Lopez', '1987-05-08', '234 Orange Street, Hamletville', '2019-08-20', 'HR Manager', 'melissa.lopez@example.com'),
(13, 'Kevin Adams', '1992-08-22', '567 Lemon Street, Cityville', '2017-01-05', 'Network Engineer', 'kevin.adams@example.com'),
(14, 'Rachel Turner', '1991-04-12', '890 Lime Street, Townsville', '2016-05-30', 'Sales Manager', 'rachel.turner@example.com'),
(15, 'Daniel Hernandez', '1988-12-04', '123 Grapefruit Street, Villageton', '2014-09-15', 'Operations Coordinator', 'daniel.hernandez@example.com'),
(16, 'Ashley Scott', '1993-07-26', '456 Watermelon Street, Countyville', '2020-10-10', 'Customer Support Specialist', 'ashley.scott@example.com'),
(17, 'Justin Ward', '1985-02-18', '789 Kiwi Street, Townetown', '2018-02-01', 'Software Tester', 'justin.ward@example.com'),
(18, 'Lauren Baker', '1990-06-08', '101 Mango Street, Citytown', '2016-04-20', 'Marketing Director', 'lauren.baker@example.com'),
(19, 'Erica Hill', '1986-11-02', '234 Peach Street, Hamletville', '2019-07-15', 'HR Assistant', 'erica.hill@example.com'),
(20, 'Brandon Nelson', '1991-03-16', '567 Plum Street, Villagetown', '2015-10-30', 'Network Technician', 'brandon.nelson@example.com'),
(21, 'Kelsey Ramirez', '1988-09-09', '890 Strawberry Street, Cityville', '2017-04-05', 'Sales Associate', 'kelsey.ramirez@example.com'),
(22, 'Tyler Cooper', '1994-01-31', '123 Blueberry Street, Townsville', '2020-12-20', 'Operations Analyst', 'tyler.cooper@example.com');



INSERT INTO Attendance (ID, EMP_ID, Date_of_Attendance, Time_In, Time_Out, Hours_Worked, Overtime_Hours) VALUES
(1, 1, '2024-04-01', '09:00:00', '17:00:00', 8, 0),
(2, 1, '2024-04-02', '09:30:00', '17:30:00', 8, 0),
(3, 2, '2024-04-01', '08:45:00', '16:45:00', 8, 0),
(4, 2, '2024-04-02', '08:30:00', '16:30:00', 8, 0),
(5, 3, '2024-04-01', '08:15:00', '16:15:00', 8, 0),
(6, 3, '2024-04-02', '08:00:00', '16:00:00', 8, 0),
(7, 4, '2024-04-01', '09:15:00', '17:15:00', 8, 0),
(8, 4, '2024-04-02', '09:30:00', '17:30:00', 8, 0),
(9, 5, '2024-04-01', '09:00:00', '17:00:00', 8, 0),
(10, 5, '2024-04-02', '09:15:00', '17:15:00', 8, 0),
(11, 6, '2024-04-01', '08:45:00', '16:45:00', 8, 0),
(12, 6, '2024-04-02', '08:30:00', '16:30:00', 8, 0),
(13, 7, '2024-04-01', '09:00:00', '17:00:00', 8, 0),
(14, 7, '2024-04-02', '09:30:00', '17:30:00', 8, 0),
(15, 8, '2024-04-01', '08:15:00', '16:15:00', 8, 0),
(16, 8, '2024-04-02', '08:00:00', '16:00:00', 8, 0),
(17, 9, '2024-04-01', '09:30:00', '17:30:00', 8, 0),
(18, 9, '2024-04-02', '09:15:00', '17:15:00', 8, 0),
(19, 10, '2024-04-01', '09:00:00', '17:00:00', 8, 0),
(20, 10, '2024-04-02', '09:30:00', '17:30:00', 8, 0),
(21, 11, '2024-04-01', '08:45:00', '16:45:00', 8, 0),
(22, 11, '2024-04-02', '08:30:00', '16:30:00', 8, 0);


INSERT INTO Salaries (EMP_ID, Salary_Amount) VALUES
(1, 50000),
(2, 55000),
(3, 60000),
(4, 52000),
(5, 58000),
(6, 53000),
(7, 57000),
(8, 54000),
(9, 59000),
(10, 51000),
(11, 56000),
(12, 52000),
(13, 58000),
(14, 55000),
(15, 60000),
(16, 53000),
(17, 57000),
(18, 54000),
(19, 59000),
(20, 51000),
(21, 56000),
(22, 52000);

INSERT INTO Deductions (ID, EMP_ID, Deduction_Type, Amount_Deducted, Date_of_Deduction) VALUES
(1, 1, 'Tax', 200, '2024-04-01'),
(2, 2, 'Insurance', 150, '2024-04-02'),
(3, 3, 'Pension', 180, '2024-04-03'),
(4, 4, 'Tax', 190, '2024-04-04'),
(5, 5, 'Insurance', 160, '2024-04-05'),
(6, 6, 'Pension', 170, '2024-04-06'),
(7, 7, 'Tax', 180, '2024-04-07'),
(8, 8, 'Insurance', 140, '2024-04-08'),
(9, 9, 'Pension', 200, '2024-04-09'),
(10, 10, 'Tax', 210, '2024-04-10'),
(11, 11, 'Insurance', 170, '2024-04-11'),
(12, 12, 'Pension', 220, '2024-04-12'),
(13, 13, 'Tax', 220, '2024-04-13'),
(14, 14, 'Insurance', 180, '2024-04-14'),
(15, 15, 'Pension', 230, '2024-04-15'),
(16, 16, 'Tax', 230, '2024-04-16'),
(17, 17, 'Insurance', 190, '2024-04-17'),
(18, 18, 'Pension', 240, '2024-04-18'),
(19, 19, 'Tax', 240, '2024-04-19'),
(20, 20, 'Insurance', 200, '2024-04-20'),
(21, 21, 'Pension', 250, '2024-04-21'),
(22, 22, 'Tax', 250, '2024-04-22');

INSERT INTO Leaves (ID, EMP_ID, Leave_Type, Start_Date, End_Date, Length_of_Leave) VALUES
(1, 1, 'Vacation', '2024-05-01', '2024-05-03', 3),
(2, 2, 'Sick Leave', '2024-05-02', '2024-05-02', 1),
(3, 3, 'Maternity Leave', '2024-05-05', '2024-05-15', 11),
(4, 4, 'Vacation', '2024-05-07', '2024-05-10', 4),
(5, 5, 'Sick Leave', '2024-05-11', '2024-05-12', 2),
(6, 6, 'Paternity Leave', '2024-05-14', '2024-05-15', 2),
(7, 7, 'Vacation', '2024-05-17', '2024-05-20', 4),
(8, 8, 'Sick Leave', '2024-05-21', '2024-05-21', 1),
(9, 9, 'Maternity Leave', '2024-05-22', '2024-06-01', 11),
(10, 10, 'Vacation', '2024-05-24', '2024-05-28', 5),
(11, 11, 'Sick Leave', '2024-05-29', '2024-05-29', 1),
(12, 12, 'Paternity Leave', '2024-05-31', '2024-06-01', 2),
(13, 13, 'Vacation', '2024-06-03', '2024-06-07', 5),
(14, 14, 'Sick Leave', '2024-06-08', '2024-06-09', 2),
(15, 15, 'Maternity Leave', '2024-06-10', '2024-06-20', 11),
(16, 16, 'Vacation', '2024-06-13', '2024-06-16', 4),
(17, 17, 'Sick Leave', '2024-06-17', '2024-06-17', 1),
(18, 18, 'Paternity Leave', '2024-06-20', '2024-06-21', 2),
(19, 19, 'Vacation', '2024-06-23', '2024-06-26', 4),
(20, 20, 'Sick Leave', '2024-06-27', '2024-06-27', 1),
(21, 21, 'Maternity Leave', '2024-06-28', '2024-07-08', 11),
(22, 22, 'Vacation', '2024-07-01', '2024-07-05', 5);
-- Add more entries as needed

INSERT INTO Payments (PAYMENT_ID, EMP_ID, Payment_Date, Amount, Mode_of_Payment) VALUES
(1, 1, '2024-05-01', 1500, 'Direct Deposit'),
(2, 2, '2024-05-02', 1600, 'Check'),
(3, 3, '2024-05-03', 1700, 'Cash'),
(4, 4, '2024-05-04', 1800, 'Direct Deposit'),
(5, 5, '2024-05-05', 1900, 'Check'),
(6, 6, '2024-05-06', 2000, 'Cash'),
(7, 7, '2024-05-07', 2100, 'Direct Deposit'),
(8, 8, '2024-05-08', 2200, 'Check'),
(9, 9, '2024-05-09', 2300, 'Cash'),
(10, 10, '2024-05-10', 2400, 'Direct Deposit'),
(11, 11, '2024-05-11', 2500, 'Check'),
(12, 12, '2024-05-12', 2600, 'Cash'),
(13, 13, '2024-05-13', 2700, 'Direct Deposit'),
(14, 14, '2024-05-14', 2800, 'Check'),
(15, 15, '2024-05-15', 2900, 'Cash'),
(16, 16, '2024-05-16', 3000, 'Direct Deposit'),
(17, 17, '2024-05-17', 3100, 'Check'),
(18, 18, '2024-05-18', 3200, 'Cash'),
(19, 19, '2024-05-19', 3300, 'Direct Deposit'),
(20, 20, '2024-05-20', 3400, 'Check'),
(21, 21, '2024-05-21', 3500, 'Cash'),
(22, 22, '2024-05-22', 3600, 'Direct Deposit');


/* To show all the values in attendace table*/

Select * from Attendance;

/* To show all the values in Deductions table*/

Select * from Deductions;

/* To show all the values in Departments table*/

Select * from Departments;

/* To show all the values in Designations table*/

Select * from Designations;

/* To show all the values in Employees table*/

Select * from Employees;


/* To show all the values in Leaves table*/
Select * from Leaves;

/* To show all the values in Payments table*/

Select * from Payments;

/* To show all the values in Salaries table*/

Select * from Salaries;


ALTER TABLE Deductions
ADD CONSTRAINT deduction_amount_non_negative CHECK (Amount_Deducted >= 0);

ALTER TABLE Payments
ADD CONSTRAINT payment_amount_positive CHECK (Amount > 0);

ALTER TABLE Attendance
ADD CONSTRAINT hours_worked_non_negative CHECK (Hours_Worked >= 0);


SELECT e.Name AS Employee_Name, e.Job_Title, a.Hours_Worked AS HoursWorked
FROM Employees e
LEFT JOIN Attendance a ON e.EMP_ID = a.EMP_ID;

SELECT e.Name AS Employee_Name, s.Salary_Amount, COALESCE(SUM(d.Amount_Deducted), 0) AS Total_Deductions
FROM Employees e
INNER JOIN Salaries s ON e.EMP_ID = s.EMP_ID
LEFT JOIN Deductions d ON e.EMP_ID = d.EMP_ID
GROUP BY e.EMP_ID, e.Name, s.Salary_Amount;

SELECT e.Name AS Employee_Name, l.Leave_Type, l.Length_of_Leave
FROM Employees e
INNER JOIN Leaves l ON e.EMP_ID = l.EMP_ID;

SELECT e.Name AS Employee_Name, a.Date_of_Attendance, a.Time_In, a.Time_Out, a.Hours_Worked, a.Overtime_Hours
FROM Employees e
INNER JOIN Attendance a ON e.EMP_ID = a.EMP_ID;

SELECT e.Name AS Employee_Name, p.Payment_Date, p.Amount
FROM Employees e
INNER JOIN Payments p ON e.EMP_ID = p.EMP_ID;


SELECT e.Name AS Employee_Name, a.Date_of_Attendance, a.Time_In, a.Time_Out, a.Hours_Worked, a.Overtime_Hours
FROM Employees e
INNER JOIN Attendance a ON e.EMP_ID = a.EMP_ID;

SELECT e.Name AS Employee_Name, d.Deduction_Type, d.Amount_Deducted, d.Date_of_Deduction
FROM Employees e
INNER JOIN Deductions d ON e.EMP_ID = d.EMP_ID;

SELECT e.Name AS Employee_Name, l.Leave_Type, l.Start_Date, l.End_Date, l.Length_of_Leave
FROM Employees e
INNER JOIN Leaves l ON e.EMP_ID = l.EMP_ID;