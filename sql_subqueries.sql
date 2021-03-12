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


/* Assign employee number 110022 as manager to all employees from 10001 to 10020*/
select employees.emp_no,dept_emp.dept_no as dept_code, 
(select dept_emp.emp_no
from dept_emp
where emp_no=110022) as manager_ID
from employees
join dept_emp
on employees.emp_no=dept_emp.emp_no
where employees.emp_no<=10020
group by employees.emp_no
order by employees.emp_no;


select A.* from
(select employees.emp_no,dept_emp.dept_no,
(select emp_no from dept_emp
where emp_no=110022) as manager_ID
from employees
join dept_emp
on employees.emp_no=dept_emp.emp_no
where employees.emp_no <= 10020
group by employees.emp_no
order by employees.emp_no) as A
union 
select B.* from
(select employees.emp_no,dept_emp.dept_no,
(select emp_no from dept_emp
where emp_no=110039) as manager_ID
from employees
join dept_emp
on employees.emp_no=dept_emp.emp_no
where employees.emp_no between 10020 and 10040
group by employees.emp_no
order by employees.emp_no) as B;


/*create a table called “emp_manager” 
(emp_no – integer of 11, not null; dept_no – CHAR of 4, null; manager_no – integer of 11, not null). 
*/
drop table if exists emp_manager;
create table if not exists emp_manager(
emp_no int not null,
dept_no char(4) not null,
manager_no int not null);

select * from employees
where emp_no <=10020;

select dept_no from dept_manager;






