use university_db;

-- Create Students table
CREATE TABLE Students (
    student_id VARCHAR(10) PRIMARY KEY,  -- Unique student identifier
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(15),
    enrollment_date DATE NOT NULL
);

-- Create Departments table
CREATE TABLE Departments (
    department_id VARCHAR(10) PRIMARY KEY,  -- Unique department identifier
    department_name VARCHAR(100) NOT NULL,
    department_head VARCHAR(100) -- Head of the department
);

-- Create Courses table
CREATE TABLE Courses (
    course_id VARCHAR(10) PRIMARY KEY,  -- Unique course identifier
    course_name VARCHAR(100) NOT NULL,
    course_description TEXT,
    department_id VARCHAR(10),
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

-- Create Instructors table
CREATE TABLE Instructors (
    instructor_id VARCHAR(10) PRIMARY KEY,  -- Unique instructor identifier
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    department_id VARCHAR(10),
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(15),
    hire_date DATE NOT NULL,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

-- Create Enrollments table (M:N relationship between Students and Courses)
CREATE TABLE Enrollments (
    enrollment_id VARCHAR(10) PRIMARY KEY,  -- Unique enrollment identifier
    student_id VARCHAR(10),
    course_id VARCHAR(10),
    enrollment_date DATE NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- Create Grades table (to store grades for enrollments)
CREATE TABLE Grades (
    grade_id VARCHAR(10) PRIMARY KEY,  -- Unique grade identifier
    enrollment_id VARCHAR(10),
    grade VARCHAR(5),  -- A, B+, C, etc.
    grade_date DATE NOT NULL,
    FOREIGN KEY (enrollment_id) REFERENCES Enrollments(enrollment_id)
);