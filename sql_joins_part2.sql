#left join
/* results in o/p where all the columns which are matching between these two tables and cols which are in left
table ie., employees*/
use employees;
select employees.emp_no,employees.first_name,employees.last_name,dept_manager_dup.dept_no,dept_manager_dup.from_date
from employees
left join dept_manager_dup
on 
employees.emp_no=dept_manager_dup.emp_no
order by employees.emp_no asc;

/* now keeping dept_manager_dup as left table*/
select dept_manager_dup.dept_no,dept_manager_dup.from_date,dept_manager_dup.emp_no,employees.first_name
from dept_manager_dup
left join employees
on 
employees.emp_no=dept_manager_dup.emp_no
order by dept_manager_dup.emp_no desc;

#right join
select dept_manager_dup.dept_no,dept_manager_dup.from_date,dept_manager_dup.emp_no,employees.first_name
from employees
right join dept_manager_dup
on 
employees.emp_no=dept_manager_dup.emp_no
order by dept_manager_dup.emp_no desc;

