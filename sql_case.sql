#case statements
use employees;
/*obtain a result set containing the employee number,
 first name, and last name of all employees with a number higher than 109990.
 Create a fourth column in the query, indicating whether this employee
 is also a manager, according to the data provided in the dept_manager table, or a regular employee*/
 
 select employees.first_name,employees.last_name,employees.emp_no,
 case
  when dept_manager.emp_no is not null then 'Manager'
  else 'Employee'
 end as is_manager 
 from employees 
 left join dept_manager 
 on employees.emp_no=dept_manager.emp_no
 where employees.emp_no>109990
 order by employees.emp_no;
 
/*Extract a dataset containing the following information 
about the managers: employee number, first name, and last name. 
Add two columns at the end – one showing the difference between the maximum and minimum 
\salary of that employee, and another one saying whether this salary raise was higher than $30,000 or NOT.
If possible, provide more than one solution. 
*/
select s.emp_no,e.first_name,e.last_name,
max(s.salary) -min(s.salary) as salary_diff,
case 
  when max(s.salary) -min(s.salary) >30000 then 'Salary was raised by more then $30,000'
  when max(s.salary) -min(s.salary) <80000 then 'Salary was raised by less then $80,000'
 else 'Salary was raised by more then $30,000'
end as salary_raise
from employees as e
right join salaries as s 
on e.emp_no=s.emp_no
group by s.emp_no; 

#using if
select s.emp_no,e.first_name,e.last_name,
max(s.salary) -min(s.salary) as salary_diff,
    IF((MAX(s.salary) - MIN(s.salary) > 30000) & (MAX(s.salary)-MIN(s.salary) < 80000) , 
    'Salary was raised by more then $30,000', 
    'Salary was NOT raised by more then $30,000') AS salary_increase 
from employees as e
right join salaries as s 
on e.emp_no=s.emp_no
group by s.emp_no
order by salary_diff desc; 
