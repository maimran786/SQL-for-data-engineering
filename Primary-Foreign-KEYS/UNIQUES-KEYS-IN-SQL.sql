-- Primary Keys

CREATE TABLE students (
  id int PRIMARY KEY,
  name varchar(50),
  age int,
  gender varchar(10)
);

-- Foreign Keys

-- For example

CREATE TABLE courses (
	course_id int,
	course_name varchar(20)
);

ALTER TABLE courses add CONSTRAINT pk_courses PRIMARY KEY(course_id); 

CREATE TABLE students01 (
  id int PRIMARY KEY,
  name varchar(50),
  age int,
  gender varchar(10),
  course_id int,
  FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- Composite Key

CREATE TABLE employees (
  employee_id int,
  department_id int,
  name varchar(50),
  age int,
  gender varchar(10),
  PRIMARY KEY (employee_id, department_id)
);

-- Unique Key

CREATE TABLE employees01 (
  employee_id int,
  email varchar(50) UNIQUE,
  phone varchar(20),
  ssn varchar(15),
  PRIMARY KEY (employee_id)
);

-- Candidate Key

CREATE TABLE employees02 (
  employee_id int,
  email varchar(50),
  phone varchar(20),
  ssn varchar(15),
  PRIMARY KEY (employee_id),
  UNIQUE (email),
  UNIQUE (phone),
  UNIQUE (ssn)
);

-- Super Key

CREATE TABLE sales (
  sales_id int,
  product_id int,
  customer_id int,
  sales_date date,
  sales_amount decimal(10,2),
  PRIMARY KEY (sales_id),
  UNIQUE (product_id, customer_id, sales_date)
);

-- Alternate Key

CREATE TABLE students02 (
  id int,
  roll_no int,
  name varchar(50),
  age int,
  gender varchar(10),
  PRIMARY KEY (id),
  UNIQUE (roll_no)
);



