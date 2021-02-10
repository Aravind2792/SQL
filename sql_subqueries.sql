use employees;
/*Extract the information about all department managers 
who were hired between the 1st of January 1990 and the 1st of January 1995.*/
select first_name,emp_no,hire_date from employees
where hire_date between '1990-01-01' and '1995-01-01'and
emp_no # use the column which matches with the column name in the subquery
in(
select emp_no from dept_manager); #remember to use sub-queries within parenthesis

#using joins
select employees.first_name,employees.emp_no,employees.hire_date
from employees
join dept_manager
on employees.emp_no=dept_manager.emp_no
where employees.hire_date  between '1990-01-01' and '1995-01-01';
