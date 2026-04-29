use employee_management;
CREATE TABLE employee_1 (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(50), 
    last_name VARCHAR(50),
    email_id VARCHAR(100),
    gender ENUM('Male', 'Female', 'Other'),
    age INT,
    hire_date DATE,
    salary INT,
    manager_id INT, 
    department VARCHAR(50),
    phone_no VARCHAR(20),
    FOREIGN KEY (manager_id) REFERENCES employee_1(emp_id)
);

select * from employee_1;

insert into employee_1 (emp_id, first_name, last_name, email_id, gender, age, hire_date, salary, manager_id, department, phone_no)
values (345, 'Nate', 'Henfre', 'nhenfre1@storify.com', 'Male', 47, '2023-09-11', 105492, null, 'Product Management', '843-37-5785'),
(750, 'Freeland', 'Spracklin', 'fspracklin4@cargocollective.com', 'Male', 21, '2024-04-10', 155204, null, 'R&D Manager', '104-82-6002'),
(296, 'Allina', 'Patmore', 'apatmore7@google.nl', 'Female', 40, '2024-08-31', 124350, null, 'HR Manager', '716-72-1407'),
(234, 'Robin', 'MacMenamy', 'rmacmenamy0@nsw.gov.au', 'Female', 22, '2025-04-06', 139111, 345, 'Research and Development', '616-58-5257'),
(674, 'Moses', 'Loughlin', 'moloughlin2@chron.com', 'Male', 50, '2024-04-20', 34920, 296, 'Support', '589-88-0014'),
(123, 'Shayla', 'Stove', 'sstove3@samsung.com', 'Female', 35, '2023-10-10', 67953, 296, 'Legal', '888-79-3482'),
(392, 'Gretel', 'Ivatts', 'givatts5@buzzfeed.com', 'Female', 32, '2023-10-26', 53768, 296, 'Human Resources', '171-52-565'),
(734, 'Allen', 'Twede', 'atwedee@eventbrite.com', 'Male', 28, '2024-01-26', 111625, 345, 'Engineering', '799-47-3972'),
(193, 'Elli', 'Sidon', 'esidon1f@istockphoto.com', 'Female', 43, '2023-08-23', 65276, 750, 'Business Development', '648-63-2852'),
(934, 'Alard', 'Clows', 'aclowsr@biglobe.ne.jp', 'Male', 26, '2025-06-02', 91279, 750, 'Business Development', '555-25-7477');

-- Key Queries and insights
-- 1. Employee Count by Department
select department, count(*) as total_employees
from employee_1
group by department;

-- 2. Average Salary by Department
select department, round(avg(salary),2) as avg_salary
from employee_1
group by department;

-- 3. Gender Distribution
select gender, count(*) as total_employee
from employee_1
group by gender;

-- 4. Gender Distribution Among Managers
select gender, count(*) as total_manager
from employee_1
where emp_id in (
select distinct manager_id
from employee_1
where manager_id is not null)
group by gender;

-- 5. Employees with Salary < 50,000
select first_name, last_name, department, salary 
from employee_1
where salary<50000;

-- 6. Employees with Salary > 100,000
select first_name, last_name, department, salary 
from employee_1
where salary>100000;

-- 7. Salary Increment for Specific Employees

UPDATE employee_1
SET salary = salary * 1.10
WHERE (first_name = 'Robin' AND last_name = 'MacMenamy')
   OR (first_name = 'Freeland' AND last_name = 'Spracklin');
   
   select * from employee_1
   where first_name in ('robin' , 'freeland');



