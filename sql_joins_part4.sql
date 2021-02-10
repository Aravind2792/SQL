use employees;
#aggregate functions in joins
select 
employees.gender,
avg(salaries.salary) as Avg_salary
from 
salaries
join employees
on employees.emp_no=salaries.emp_no
group by employees.gender;

#multiple joins
select 
employees.emp_no,
employees.first_name,
employees.gender,
salaries.salary,
dept_emp.from_date
from employees
join salaries
on employees.emp_no=salaries.emp_no
join dept_emp
on salaries.emp_no=dept_emp.emp_no
group by employees.first_name
order by employees.first_name ;

/* Select all managers’ first and last name, hire date, job title, start date, and department name.*/
select 
dept_manager.emp_no,
dept_manager.from_date,
dept_manager.to_date,
employees.hire_date,
employees.first_name,
employees.last_name,
titles.title,
departments.dept_name
from dept_manager
join employees
on dept_manager.emp_no=employees.emp_no
join titles
on titles.emp_no=employees.emp_no
join departments 
on departments.dept_no=dept_manager.dept_no
where titles.title='Manager';

/* How many male and how many female managers do we have in the ‘employees’ database?*/
 select employees.gender, count(employees.gender) as count
 from employees
 join titles
 on employees.emp_no=titles.emp_no
 where titles.title='Manager'
 group by employees.gender;
 
 #union 
 SELECT
    *
FROM
    (SELECT
        e.emp_no,
            e.first_name,
            e.last_name,
            NULL AS dept_no,
            NULL AS from_date
    FROM
        employees e
    WHERE
        last_name = 'Denis' UNION SELECT
        NULL AS emp_no,
            NULL AS first_name,
            NULL AS last_name,
            dm.dept_no,
            dm.from_date
    FROM
        dept_manager dm) as a
ORDER BY -a.emp_no DESC;

