CREATE TABLE Guardian (
    GID INT PRIMARY KEY,
    Name VARCHAR(100),
    Gender CHAR(1),
    Age INT,
    Email VARCHAR(100),
    Phone_Number VARCHAR(15),
    RshipWith_Stud VARCHAR(50)
);

CREATE TABLE Student (
    Stu_ID INT PRIMARY KEY,
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Gender CHAR(1),
    DOB DATE,
    Phone_Number VARCHAR(15),
    Emerg_Contact VARCHAR(15),
    Address VARCHAR(255),
    Email VARCHAR(100),
    GID INT,
    FOREIGN KEY (GID) REFERENCES Guardian(GID)
);


CREATE TABLE Teacher (
    Teacher_ID INT PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Gender CHAR(1),
    Age INT,
    Email VARCHAR(100),
    Phone_Number VARCHAR(15),
    Photo BLOB,
    Specialization VARCHAR(100),
    Year INT,
    Degree VARCHAR(100),
    University VARCHAR(100)
);

CREATE TABLE TeacherGuardian (
    Teacher_ID INT,
    GID INT,
    PRIMARY KEY (Teacher_ID, GID),
    FOREIGN KEY (Teacher_ID) REFERENCES Teacher(Teacher_ID),
    FOREIGN KEY (GID) REFERENCES Guardian(GID)
);

CREATE TABLE Subject (
    Subject_ID INT PRIMARY KEY,
    SubName VARCHAR(100),
    Description TEXT,
    Credits INT,
    Prerequisites VARCHAR(255)
);



CREATE TABLE Schedule (
    Schedule_ID INT PRIMARY KEY,
    Class_ID INT,
    Day VARCHAR(10),
    Start_Time TIME,
    End_Time TIME,
    Duration INT,
    Section VARCHAR(50),
    Room_Number VARCHAR(50),
    Semester VARCHAR(10),
    FOREIGN KEY (Class_ID) REFERENCES Class(Class_ID)
);

CREATE TABLE ClassSubSchedule (
    Subject_ID INT,
    Class_ID INT,
    Schedule_ID INT,
    PRIMARY KEY (Subject_ID, Class_ID, Schedule_ID),
    FOREIGN KEY (Subject_ID) REFERENCES Subject(Subject_ID),
    FOREIGN KEY (Class_ID) REFERENCES Class(Class_ID),
    FOREIGN KEY (Schedule_ID) REFERENCES Schedule(Schedule_ID)
);

CREATE TABLE Student_Registration (
    Reg_ID INT PRIMARY KEY,
    Year INT,
    Stu_ID INT,
    FOREIGN KEY (Stu_ID) REFERENCES Student(Stu_ID)
);

CREATE TABLE Teaches (
    Teacher_ID INT,
    Subject_ID INT,
    Class_ID INT,
    PRIMARY KEY (Teacher_ID, Subject_ID, Class_ID),
    FOREIGN KEY (Teacher_ID) REFERENCES Teacher(Teacher_ID),
    FOREIGN KEY (Subject_ID) REFERENCES Subject(Subject_ID),
    FOREIGN KEY (Class_ID) REFERENCES Class(Class_ID)
);

CREATE TABLE Result (
    Result_ID INT PRIMARY KEY,
    Mark INT,
    Exam_Type VARCHAR(50),
    Grade VARCHAR(2),
    Stu_ID INT,
    Teacher_ID INT,
    Subject_ID INT,
    FOREIGN KEY (Stu_ID) REFERENCES Student(Stu_ID),
    FOREIGN KEY (Teacher_ID) REFERENCES Teacher(Teacher_ID),
    FOREIGN KEY (Subject_ID) REFERENCES Subject(Subject_ID)
);

CREATE TABLE Assignments (
    Assignment_ID INT PRIMARY KEY,
    Due_Date DATE,
    Max_Marks INT,
    Description TEXT,
    Subject_ID INT,
    Teacher_ID INT,
    FOREIGN KEY (Subject_ID) REFERENCES Subject(Subject_ID),
    FOREIGN KEY (Teacher_ID) REFERENCES Teacher(Teacher_ID)
);

CREATE TABLE Payment (
    Payment_No INT PRIMARY KEY,
    Payment_Date DATE,
    Payment_Method VARCHAR(50),
    Semester VARCHAR(10),
    Amount DECIMAL(10, 2),
    Stu_ID INT,
    FOREIGN KEY (Stu_ID) REFERENCES Student(Stu_ID)
);

CREATE TABLE Library (
    Book_ID INT PRIMARY KEY,
    Title VARCHAR(255),
    ISBN VARCHAR(20),
    Author VARCHAR(100),
    Available_Copies INT
);

CREATE TABLE BorrowBooks (
    Stu_ID INT,
    Book_ID INT,
    Borrow_Date DATE,
    Return_Date DATE,
    PRIMARY KEY (Stu_ID, Book_ID),
    FOREIGN KEY (Stu_ID) REFERENCES Student(Stu_ID),
    FOREIGN KEY (Book_ID) REFERENCES Library(Book_ID)
);

-- INSERT VALUES --

INSERT INTO Teacher (Teacher_ID, First_Name, Last_Name, Gender, Age, Email, Phone_Number, Specialization, Year, Degree, University)
VALUES
    (1, 'John', 'Doe', 'M', 35, 'john.doe@example.com', '123-456-7890', 'Mathematics', 5, 'Ph.D. in Mathematics', 'University of ABC'),
    (2, 'Jane', 'Smith', 'F', 32, 'jane.smith@example.com', '987-654-3210', 'Physics', 4, 'M.Sc. in Physics', 'University of XYZ'),
    (3, 'Selamawit', 'Mulugeta', 'F', 38, 'selamawit.mulugeta@example.com', '444-555-6666', 'Physics', 8, 'M.Sc. in Physics', 'University of Gondar'),
    (4, 'Getnet', 'Kebede', 'M', 45, 'getnet.kebede@example.com', '777-888-9999', 'Mathematics', 15, 'Ph.D. in Mathematics', 'Addis Ababa University'),
    (5, 'Hana', 'Asrat', 'F', 35, 'hana.asrat@example.com', '333-444-5555', 'Chemistry', 7, 'M.Sc. in Chemistry', 'Jimma University'),
    (6, 'Mulu', 'Teferi', 'M', 50, 'mulu.teferi@example.com', '222-333-4444', 'Biology', 20, 'Ph.D. in Biology', 'Hawassa University'),
    (7, 'Betty', 'Bekele', 'F', 42, 'betty.bekele@example.com', '555-666-7777', 'History', 12, 'Ph.D. in History', 'Mekelle University'),
    (8, 'Eyob', 'Mengistu', 'M', 37, 'eyob.mengistu@example.com', '888-999-0000', 'Economics', 9, 'Ph.D. in Economics', 'University of Gondar');

INSERT INTO Guardian (GID, Name, Gender, Age, Email, Phone_Number, RshipWith_Stud)
VALUES
    (1, 'Elsa Habte', 'F', 45, 'elsa.habte@example.com', '123-456-7890', 'Mother'),
    (2, 'Solomon Berhanu', 'M', 50, 'solomon.berhanu@example.com', '987-654-3210', 'Father'),
    (3, 'Hana Alemayehu', 'F', 42, 'hana.alemayehu@example.com', '321-654-9870', 'Mother'),
    (4, 'Birhanu Desta', 'M', 47, 'birhanu.desta@example.com', '654-321-0987', 'Father'),
    (5, 'Almaz Bekele', 'F', 43, 'almaz.bekele@example.com', '555-666-7777', 'Mother'),
    (6, 'Kebede Tesfaye', 'M', 48, 'kebede.tesfaye@example.com', '777-888-9999', 'Father'),
    (7, 'Mulu Mesfin', 'F', 44, 'mulu.mesfin@example.com', '111-222-3333', 'Mother'),
    (8, 'Getachew Tadesse', 'M', 49, 'getachew.tadesse@example.com', '444-555-6666', 'Father');

INSERT INTO Student (Stu_ID, Fname, Lname, Gender, DOB, Phone_Number, Emerg_Contact, Address, Email, GID)
VALUES
    (1, 'Meron', 'Tesfaye', 'F', '2000-05-15', '123-456-7890', '111-222-3333', '456 Maple St, Addis Ababa', 'meron.tesfaye@example.com', 1),
    (2, 'Daniel', 'Assefa', 'M', '1999-08-20', '987-654-3210', '444-555-6666', '789 Oak St, Dire Dawa', 'daniel.assefa@example.com', 2),
    (3, 'Yonas', 'Bekele', 'M', '2001-11-05', '321-654-9870', '222-333-4444', '123 Pine St, Bahir Dar', 'yonas.bekele@example.com', 3),
    (4, 'Lily', 'Gebremedhin', 'F', '2002-01-25', '654-321-0987', '555-666-7777', '456 Cedar St, Mekelle', 'lily.gebremedhin@example.com', 4),
    (5, 'Mekdes', 'Kassaye', 'F', '2001-07-14', '555-666-7777', '888-999-0000', '789 Birch St, Hawassa', 'mekdes.kassaye@example.com', 5),
    (6, 'Samuel', 'Abebe', 'M', '1999-03-11', '777-888-9999', '111-333-5555', '123 Spruce St, Jimma', 'samuel.abebe@example.com', 6),
    (7, 'Saba', 'Mulugeta', 'F', '2000-09-21', '111-222-3333', '222-444-6666', '456 Fir St, Gondar', 'saba.mulugeta@example.com', 7),
    (8, 'Tesfaye', 'Wolde', 'M', '2002-12-05', '444-555-6666', '333-555-7777', '789 Cypress St, Harar', 'tesfaye.wolde@example.com', 8);

INSERT INTO Subject (Subject_ID, SubName, Description, Credits, Prerequisites)
VALUES
    (1, 'Database Systems', 'Introduction to relational databases and SQL', 3, 'None'),
    (2, 'Algebra', 'Fundamentals of algebraic concepts', 3, 'None'),
    (3, 'Physics I', 'Basic principles of physics', 4, 'None'),
    (4, 'Ethics in Engineering', 'Ethical considerations in engineering practices', 2, 'None')
    (5, 'Organic Chemistry', 'Study of organic compounds and reactions', 4, 'None'),
    (6, 'Cell Biology', 'Introduction to cell structure and function', 3, 'None'),
    (7, 'Modern History', 'History from the 18th century to present', 3, 'None'),
    (8, 'Microeconomics', 'Principles of microeconomics', 3, 'None');

INSERT INTO Class (Class_ID, Class_Level, Capacity, Room_Number, Section)
VALUES
    (1, '10th Grade', 30, '101', 'A'),
    (2, '11th Grade', 25, '102', 'B'),
    (3, '12th Grade', 20, '103', 'A'),
    (4, '9th Grade', 35, '104', 'B'),
    (5, '8th Grade', 40, '105', 'A'),
    (6, '7th Grade', 45, '106', 'B'),
    (7, '6th Grade', 50, '107', 'A'),
    (8, '5th Grade', 55, '108', 'B');

INSERT INTO Schedule (Schedule_ID, Class_ID, Day, Start_Time, End_Time, Duration, Section, Room_Number, Semester)
VALUES
    (1, 1, 'Monday', '08:00:00', '10:00:00', 120, 'A', '101', 'Spring 2023'),
    (2, 2, 'Tuesday', '09:00:00', '11:00:00', 120, 'B', '102', 'Spring 2023'),
    (3, 1, 'Wednesday', '10:00:00', '12:00:00', 120, 'A', '101', 'Spring 2023'),
    (4, 2, 'Thursday', '11:00:00', '13:00:00', 120, 'B', '102', 'Spring 2023'),
    (5, 3, 'Friday', '12:00:00', '14:00:00', 120, 'A', '103', 'Spring 2023'),
    (6, 4, 'Monday', '08:00:00', '10:00:00', 120, 'B', '104', 'Spring 2023'),
    (7, 5, 'Tuesday', '09:00:00', '11:00:00', 120, 'A', '105', 'Spring 2023'),
    (8, 6, 'Wednesday', '10:00:00', '12:00:00', 120, 'B', '106', 'Spring 2023');

INSERT INTO ClassSubSchedule (Subject_ID, Class_ID, Schedule_ID)
VALUES
    (1, 1, 1),
    (3, 2, 2),
    (2, 1, 3),
    (4, 2, 4),
    (5, 3, 5),
    (6, 4, 6),
    (7, 5, 7),
    (8, 6, 8);


INSERT INTO Student_Registration (Reg_ID, Year, Stu_ID)
VALUES
    (1, 2023, 1),
    (2, 2023, 2),
    (3, 2023, 3),
    (4, 2023, 4),
    (5, 2023, 5),
    (6, 2023, 6),
    (7, 2023, 7),
    (8, 2023, 8);


INSERT INTO Teaches (Teacher_ID, Subject_ID, Class_ID)
VALUES
    (1, 1, 1),
    (2, 3, 2),
    (3, 1, 1),
    (4, 2, 2),
    (5, 3, 3),
    (6, 4, 4),
    (7, 5, 5),
    (8, 6, 6);

INSERT INTO Result (Result_ID, Mark, Exam_Type, Grade, Stu_ID, Teacher_ID, Subject_ID)
VALUES
    (1, 85, 'Final', 'A', 1, 1, 1),
    (2, 78, 'Final', 'B+', 2, 2, 3),
    (3, 90, 'Midterm', 'A-', 3, 3, 1),
    (4, 82, 'Midterm', 'B', 4, 4, 2),
    (5, 75, 'Final', 'C+', 5, 5, 3),
    (6, 88, 'Final', 'B+', 6, 6, 4),
    (7, 93, 'Midterm', 'A', 7, 7, 5),
    (8, 77, 'Midterm', 'C+', 8, 8, 6);

INSERT INTO Assignments (Assignment_ID, Due_Date, Max_Marks, Description, Subject_ID, Teacher_ID)
VALUES
    (1, '2023-05-31', 100, 'Design and implement a database schema', 1, 1),
    (2, '2023-04-30', 80, 'Solve linear equations and matrices', 2, 2),
    (3, '2023-06-15', 90, 'Research and write about quantum mechanics', 3, 4),
    (4, '2023-07-20', 85, 'Analyze historical events from 1800 to 1900', 7, 7),
    (5, '2023-08-25', 75, 'Create a microeconomic model', 8, 8),
    (6, '2023-09-10', 95, 'Study the effects of pollutants on cell structure', 6, 6),
    (7, '2023-10-05', 80, 'Explain organic chemical reactions', 5, 5),
    (8, '2023-11-30', 85, 'Implement advanced algebraic equations', 2, 3);


INSERT INTO Payment (Payment_No, Payment_Date, Payment_Method, Semester, Amount, Stu_ID)
VALUES
    (1, '2023-01-15', 'Bank Transfer', 'Spring 2023', 500.00, 1),
    (2, '2023-08-20', 'Credit Card', 'Fall 2023', 350.00, 2),
    (3, '2023-02-15', 'Bank Transfer', 'Spring 2023', 450.00, 3),
    (4, '2023-03-20', 'Credit Card', 'Spring 2023', 300.00, 4),
    (5, '2023-04-25', 'Cash', 'Spring 2023', 400.00, 5),
    (6, '2023-05-30', 'Bank Transfer', 'Spring 2023', 350.00, 6),
    (7, '2023-06-15', 'Credit Card', 'Spring 2023', 500.00, 7),
    (8, '2023-07-20', 'Cash', 'Spring 2023', 450.00, 8);


INSERT INTO Library (Book_ID, Title, ISBN, Author, Available_Copies)
VALUES
    (1, 'Introduction to Database Systems', '978-0131873254', 'C.J. Date', 5),
    (2, 'Physics for Scientists and Engineers', '978-1316647120', 'Raymond A. Serway', 3),
    (3, 'Advanced Mathematics', '978-0470646083', 'Erwin Kreyszig', 4),
    (4, 'Organic Chemistry', '978-0073527343', 'Francis Carey', 2),
    (5, 'Modern History', '978-0199350486', 'John Merriman', 5),
    (6, 'Cell Biology', '978-0878939640', 'Bruce Alberts', 3),
    (7, 'Microeconomics', '978-0073519478', 'Robert Pindyck', 6),
    (8, 'Quantum Mechanics', '978-1107189638', 'David J. Griffiths', 4);

INSERT INTO BorrowBooks (Stu_ID, Book_ID, Borrow_Date, Return_Date)
VALUES
    (1, 1, '2023-02-01', '2023-02-28'),
    (2, 2, '2023-03-15', '2023-04-15'),
    (3, 3, '2023-03-01', '2023-03-29'),
    (4, 4, '2023-04-15', '2023-05-13'),
    (5, 5, '2023-05-01', '2023-05-30'),
    (6, 6, '2023-06-10', '2023-07-08'),
    (7, 7, '2023-07-20', '2023-08-17'),
    (8, 8, '2023-08-15', '2023-09-12');



-- CONSTRAINTS --

ALTER TABLE Guardian ADD CHECK (AGE > 18 );

ALTER TABLE Student ADD CONSTRAINT U_Phone_Number UNIQUE (Phone_Number);

-- VIEW --

CREATE VIEW BorrowedBooksView AS
SELECT
    b.Book_ID,
    b.Title,
    b.ISBN,
    b.Author,
    s.Stu_ID,
    CONCAT(s.Fname, ' ', s.Lname) AS Student_Name,
    bb.Borrow_Date,
    bb.Return_Date
FROM
    BorrowBooks bb
JOIN
    Library b ON bb.Book_ID = b.Book_ID
JOIN
    Student s ON bb.Stu_ID = s.Stu_ID;

SELECT * FROM BorrowedBooksView;

