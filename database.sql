CREATE TABLE Student (
    Student_ID INT PRIMARY KEY,
    Student_First_Name VARCHAR(50) NOT NULL,
    Student_Middle_Name VARCHAR(50),
    Student_Last_Name VARCHAR(50) NOT NULL,
    Department VARCHAR(100) NOT NULL,
    Active_Backlog INT DEFAULT 0,
    Gender ENUM('Male', 'Female', 'Other') NOT NULL,
    Year INT NOT NULL,
    Student_Image VARCHAR(255) DEFAULT NULL,
    Minors VARCHAR(255),
    Student_Email_Id VARCHAR(100) NOT NULL,
    Contact_number VARCHAR(100) NOT NULL,
    CPI DECIMAL(3,1) CHECK (CPI >= 0 AND CPI <= 10),
    SSAC_or_not ENUM('Yes', 'No'),
CONSTRAINT chk_gender CHECK (Gender IN ('Male', 'Female', 'Other')),
    CONSTRAINT chk_year CHECK (Year IN (1,2,3,4)),
CONSTRAINT chk_email_format CHECK (Student_Email_Id LIKE '%@iitgn.ac.in')
);

SELECT * FROM Student;
INSERT INTO Student (Student_ID, Student_First_Name, Student_Middle_Name, Student_Last_Name, Department, Active_Backlog, Gender, Year, Student_Email_Id, Contact_number)
VALUES
(2, 'Alice', 'M', 'Johnson', 'Electrical Engineering', 1, 'Female', 3, 'alice.johnson@iitgn.ac.in', '+91 9876543210'),
(3, 'Bob', NULL, 'Williams', 'Mechanical Engineering', 0, 'Male', 2, 'bob.williams@iitgn.ac.in', '+91 7777777777'),
(4, 'Emily', 'J', 'Brown', 'Chemical Engineering', 2, 'Female', 1, 'emily.brown@iitgn.ac.in', '+91 5555555555'),
(5, 'Michael', 'A', 'Taylor', 'Civil Engineering', 1, 'Male', 3, 'michael.taylor@iitgn.ac.in', '+91 3333333333'),
(6, 'Sophia', 'K', 'Anderson', 'Biomedical Engineering', 0, 'Female', 2, 'sophia.anderson@iitgn.ac.in', '+91 9999999999');


CREATE TABLE Opportunity (
    Opp_ID INT AUTO_INCREMENT PRIMARY KEY,
    Opp_Title VARCHAR(255) NOT NULL,
    No_of_Positions INT NOT NULL,
    Specific_Requirements_file VARCHAR(255),
    Min_CPI_req DECIMAL(2,1) NOT NULL,
    No_Active_Backlogs VARCHAR(255) NOT NULL,
    Student_year_req INT NOT NULL,
    Program_req VARCHAR(255) NOT NULL,
    Job_Description_file VARCHAR(255),
    Salary INT NOT NULL,
    POC_Email VARCHAR(255) NOT NULL,
	Company VARCHAR(255) NOT NULL,
    no_rounds INT NOT NULL,
    CONSTRAINT chk_student_year CHECK (Student_year_req IN (1,2,3,4)),
    CONSTRAINT chk_cpi_range CHECK (Min_CPI_req BETWEEN 0.0 AND 10.0),
    CONSTRAINT chk_salary CHECK (Salary >= 0)
);
SELECT * FROM Opportunity;

CREATE TABLE Round (
    Round_ID INT,
    Opp_ID INT,
    Type ENUM('Online', 'Offline') NOT NULL,
    Date DATE NOT NULL,
    Venue VARCHAR(255) NOT NULL,
    Start_Time TIME NOT NULL,
    End_Time TIME NOT NULL,
    PRIMARY KEY (Round_ID, Opp_ID),
    FOREIGN KEY (Opp_ID) REFERENCES Opportunity(Opp_ID) ON DELETE CASCADE
);
select * from Round;


CREATE TABLE Person_of_Contact (
    Poc_Email_Id VARCHAR(250) PRIMARY KEY,
    Contact_no VARCHAR(20),
    Employee_First_Name VARCHAR(50) NOT NULL,
    Employee_Middle_Name VARCHAR(50),
    Employee_Last_Name VARCHAR(50) NOT NULL,
    Employee_Designation VARCHAR(100),
    Interviewer VARCHAR(50) NOT NULL,
    Company_Name VARCHAR(255) NOT NULL,
    CONSTRAINT chk_poc_email_format CHECK (Poc_Email_Id LIKE '%@%')
);
SELECT * FROM Person_of_Contact;

CREATE TABLE CDS_USER (
	Email VARCHAR(300) PRIMARY KEY
);
INSERT INTO CDS_USER (Email) VALUES ('rutwik1440@gmail.com');


CREATE TABLE Placement (
    Placement_ID INT PRIMARY KEY,
    Placement_Medium VARCHAR(100) NOT NULL,
    Salary INT NOT NULL,
    Company_Name VARCHAR(100) NOT NULL,
    Job_Designation VARCHAR(100) NOT NULL,
    Student_First_Name VARCHAR(50) NOT NULL,
    Student_Last_Name VARCHAR(50) NOT NULL
);


CREATE TABLE Application (
    Student_ID INT,
    Opp_ID INT,
    Resume_File VARCHAR(255) NOT NULL,
	Status VARCHAR(255) NOT NULL,
    PRIMARY KEY (Student_ID, Opp_ID),
    CONSTRAINT fk_student_app FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID),
    CONSTRAINT fk_opportunity_app FOREIGN KEY (Opp_ID) REFERENCES Opportunity(Opp_ID) ON DELETE CASCADE
);

