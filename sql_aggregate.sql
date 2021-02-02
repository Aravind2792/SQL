use employees;

#to determine the number of departments
select count(dept_name) from departments;
#to determine the number of unique departments
select count(distinct dept_name) from departments;

#sum
# find the sum of all salaries
select sum(salary) from salaries;
select * from employees;
#What is the total amount of money spent on salaries for all contracts starting after the 1st of January 1997?
select sum(salary) from salaries  where from_date > '1997-01-01';

# minimum
#what is the minimum salary received by the employee
select min(salary),emp_no from salaries group by emp_no order by min(salary) asc  ;
#what is the maximum salary received by the employee
select max(salary),emp_no from salaries;

#Average
#What is the average annual salary paid to employees who started after the 1st of January 1997?
select avg(salary),emp_no from salaries group by emp_no order by avg(salary) desc;

#round
/*Round the average amount of money spent on salaries for all contracts 
that started after the 1st of January 1997 to a precision of cents.*/
select round(avg(salary),2) from salaries where from_date> '1999-01-01';

drop table departments_dup;
create table if not exists departments_dup(
 dept_no char(4),
dept_name varchar(20),
name varchar(20))
select * from departments;

insert into departments_dup(
dept_no,dept_name,name)
values (null,null,null);

#if null

select * from departments_dup;
select dept_no,ifnull(dept_name,'na')as dept_name
from departments_dup;

#coalesce
/* colesce replaces the null value column with not null value column, in this case, the name (NULL) column values 
was replaced with dept_name (NOT NULL) column values*/
select dept_no,dept_name,coalesce(dept_name,name,'N/A') as name 
from departments_dup;

#also coalesce can also create a column with a stationary data
select *,coalesce('Test data') as extracolumn 
from departments_dup;