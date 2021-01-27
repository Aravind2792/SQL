use employees;
select first_name,last_name from employees.employees;
select dept_no from departments;
select * from departments;
select * from employees where first_name='denis';
select * from employees where first_name='denis' and gender='m';
select * from employees where first_name='denis' or gender='m';
select * from employees where gender='f' and (first_name='Kellie' or first_name='aruna');
select * from employees where first_name in('Kellie','Aruna','Mark');
select * from employees where first_name not in ('Kellie','Aruna','Mark');
select * from employees where first_name like ('mark%');
select * from employees where hire_date like ('2000-%');
select * from employees where emp_no like('1000_');

select * from employees where first_name like ('%jack%');
select * from employees where first_name not like('jack%');


