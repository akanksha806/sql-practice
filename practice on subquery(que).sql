-- drop database corredb;
create database corredb;

use corredb;

CREATE TABLE departments (
    dept_id     INT PRIMARY KEY,
    dept_name   VARCHAR(50)
);

CREATE TABLE employees (
    emp_id      INT PRIMARY KEY,
    emp_name    VARCHAR(50),
    dept_id     INT,
    salary      INT,
    job_title   VARCHAR(50),
    hire_date   DATE,
    CONSTRAINT fk_dept
        FOREIGN KEY (dept_id)
        REFERENCES departments(dept_id)
);

INSERT INTO departments (dept_id, dept_name) VALUES
(10, 'HR'),
(20, 'IT'),
(30, 'Finance'),
(40, 'Sales'),
(50, 'Marketing');


INSERT INTO employees (emp_id, emp_name, dept_id, salary, job_title, hire_date) VALUES
(101, 'Alice',   10, 40000, 'HR Executive',      '2018-03-12'),
(102, 'Bob',     20, 60000, 'Software Eng',      '2019-07-19'),
(103, 'Charlie', 20, 75000, 'Senior Dev',        '2017-01-10'),
(104, 'David',   30, 50000, 'Accountant',        '2020-11-01'),
(105, 'Eva',     30, 90000, 'Finance Manager',   '2016-06-23'),
(106, 'Frank',   40, 45000, 'Sales Rep',         '2019-02-15'),
(107, 'Grace',   40, 70000, 'Sales Manager',     '2015-09-30'),
(108, 'Hannah',  50, 48000, 'Marketing Exec',    '2021-04-18'),
(109, 'Ian',     50, 65000, 'Marketing Lead',    '2018-12-07'),
(110, 'Jack',    20, 55000, 'QA Engineer',       '2020-08-25'),
(111, 'Karen',   10, 42000, 'HR Analyst',        '2019-05-14'),
(112, 'Leo',     30, 52000, 'Auditor',            '2021-09-09'),
(113, 'Mona',    40, 48000, 'Sales Exec',        '2022-01-03'),
(114, 'Nina',    20, 80000, 'Tech Lead',         '2016-10-11'),
(115, 'Oscar',   50, 47000, 'Content Writer',    '2020-06-17'),
(116, 'Paul',    10, 39000, 'Recruiter',         '2022-07-20'),
(117, 'Queen',   30, 61000, 'Financial Analyst', '2018-02-28'),
(118, 'Rick',    40, 53000, 'Sales Analyst',     '2019-09-05'),
(119, 'Steve',   20, 67000, 'DevOps Eng',        '2017-04-14'),
(120, 'Tina',    50, 72000, 'Brand Manager',     '2016-12-01');

-- 1.find employees who earn more than the avg salary of all employees.
select * from employees where salary > (select  avg(salary) from employees); -- using subquery

-- cte  2. methode
with cte as (
select avg(salary) from employees)
select * from employees where salary>(select * from cte);

-- que2 find the employee who earn the maximum salary
select * from employees where salary = (select max(salary) from employees);

-- que 3 second highest salary (offset use nhi krna hai limit use nhi krni)
-- non aggeregate column ke sath aggeregate column use nhi krte
-- select emp_name,max(salary) from employees where salary < 90000; -- error
select max(salary) from employees where salary < 90000;

-- subquery to find the max salary then we find the second highest salary
select * from employees where salary=(select max(salary) from employees where salary<(select max(salary) from employees) );
-- where ke sath aggeregate function nhi lgta agar lgana hai to group by ke sath having hona chahiye


-- Q 4 find the employees who work in located in it finance
select * from departments where dept_name='IT' or dept_name='finance';

select * from employees where dept_id in (select dept_id  from departments where dept_name = 'IT' or dept_name='finance');

-- Q find employee whose salary is greator than all employees in the hr department.??

select * from employees where salary >all (select salary from employees where dept_id = 10);
-- same
select * from employees where salary > ( select max(salary) from employees
where dept_id=(select dept_id from departments where dept_name='HR'));

-- same

select * from employees where salary >all
 (select salary from employees as e join departments as d where e.dept_id =d.dept_id and d.dept_name);
 

 -- Q  find the 
select * from employees where salary =any(select salary from employees as e join departments as d
 where e.dept_id = d.dept_id and d.dept_name='sales');
 
 
 with cte as 
 (select d.dept_id,salary from employees as e join departments as d where e.dept_id and d.dept_name='sales')
 -- getting employees with the same salary of sales but dont belong to sales ki dept_id 
 select * from employees where salary in(select salary from cte)
 and dept_id not in (select dept_id from cte);
 
 -- corelated subquery ( very slow)
 -- Q find employees who earn more than the avg salary of their own department.
 select dept_id ,avg(salary) from employees group by dept_id;
 select emp_id ,emp_name,dept_id,salary from employees as eout 
 where salary >(select avg(salary) from employees where dept_id=eout.dept_id);
 
 -- cte
 with cte as
(select dept_id, avg(salary) as avg_salary from employees group by dept_id)

select * from employees as e join cte on e.dept_id = cte.dept_id
where e.salary > cte.avg_salary;

-- Q find the department whose avg salary is greator than the overall avg salary of all employees
select dept_id,avg(salary) from employees group by dept_id having avg(salary) >( select avg(salary) from employees);
-- Q find employees who earn more than the avg salary of the it department

-- Q find the department with the  maximum total salary.
select dept_id ,sum(salary) from employees group by dept_id having sum(salary) = (select max(salary) from employees);

   
-- using join
select dept_id , sum (salary) as total_sal from );


-- new solution
select sum(salary) as total from employees group by dept_id ;

select dept_id ,sum(salary ) as total from employees
group by dept_id having total >=all(select sum(salary) as total from employees group by dept_id);

-- find departments whose minimum salary is greator than the minimum salary of the sales department
select dept_id ,min(salary) from employees group by dept_id having min(salary) > (select min(e.salary) from employees e join departments d
on e.dept_id = d.dept_id where d.dept_name ='sales');

-- no aggeregate
select dept_id , min(salary) as minsalary from employees group by dept_id having minsalary>any 
(select salary from employees as e join departments as d where e.dept_id = d.dept_id and d.dept_name='sales');




