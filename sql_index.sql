use employees;

select * from employees
where hire_date<='2000-01-01';

create index i_hire_date on employees(hire_date);
select * from employees
where hire_date<='2000-01-01';

create index i_first_last_name on employees(first_name,last_name);
select * from 
employees 
where first_name='Parto' and last_name='Bamford';

alter table employees
drop index i_hire_date;

/*Select all records from the ‘salaries’ table of people whose salary is higher than $89,000 per annum.
Then, create an index on the ‘salary’ column of that table, 
and check if it has sped up the search of the same SELECT statement.*/

select * from
salaries
where salary>89000;

create index i_salary on salaries(salary);
select * from
salaries
where salary>89000;

alter table salaries
drop index i_salary;



