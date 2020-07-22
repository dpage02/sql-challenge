-- 1. Listing details of each employee: 
-- employee number, last_name, first_name, sex, salary
-- joing employees and salaries on employee number 

select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from employees as e
join salaries as s on e.emp_no = s.emp_no;


-- 2. listing first name, last name, and hire date for employees who were hired in 1986

SELECT first_name,last_name,hire_date FROM employees
WHERE EXTRACT(year FROM "hire_date") = 1986;

-- 3. list the manager of each department with the following information:
-- department number, department name, manager's employee number, last name, first name 
-- join department manager and department on department number, department manager and employees on employee number

select dm.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
from dept_manager dm
join department d on dm.dept_no = d.dept_no
join employees e on dm.emp_no = e.emp_no;


-- 4. listing the department of each with the folowing information: employee number, last name, first name, and department 
-- join employees and department employee on emp number, employees and department on department number 
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees e
join dept_emp de on e.emp_no = de.emp_no
join department d on de.dep_no = d.dept_no;


-- 5. list first name, last name, sex for employees whose first name is "Hercules" and last name begins with "B"

select e.first_name, e.last_name, e.sex
from employees e
where e.first_name = 'Hercules'
and e.last_name like 'B%';


-- 6. list all employees in the sales department, including their employee number, last name, first name, and department name 
select e.emp_no, e.last_name, e.first_name, e.emp_no, d.dept_name
from employees e
join dept_emp de on e.emp_no = de.emp_no
join department d on de.dep_no = d.dept_no
where d.dept_name = 'Sales';


-- 7. List all employees in the sales and development departments, including their employee number, last name, first name, and department name 
select e.emp_no, e.last_name, e.first_name, e.emp_no, d.dept_name
from employees e
join dept_emp de on e.emp_no = de.emp_no
join department d on de.dep_no = d.dept_no
where d.dept_name = 'Sales' or d.dept_name = 'Development'
order by d.dept_name desc;

-- 8. in descending order, list the frequency count of employee last names 
select e.last_name, count(e.last_name) as "LastNameCount"
from employees e
group by e.last_name
order by "LastNameCount" desc;

