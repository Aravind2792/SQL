use employees;
#creating tables for joins
select * from departments_dup;
#dropping the name column
alter table departments_dup
drop name;
#changing the dept_no and dept_name as null values
alter table departments_dup
change column dept_no dept_no char(4) null;
alter table departments_dup
change column dept_name dept_name char(40) null;
select * from departments_dup;

INSERT INTO departments_dup (dept_name)
VALUES('Public Relations');

delete from departments_dup 
where dept_no='d002';

insert into departments_dup 
(dept_no) values
('d010'),('d011'); 
select * from departments_dup;

#2. creating dept_manager_dup
create table if not exists dept_manager_dup(
emp_no int(11) NULL,
  dept_no char(4) NULL,
  from_date date  NULL,
  to_date date  NULL)
  select * from dept_manager;
  select * from dept_manager_dup;
  
  insert into dept_manager_dup(
  emp_no,from_date)
  values
  (999904, '2017-01-01'),
  (999905, '2017-01-01'),
  (999906, '2017-01-01'),
  (999907, '2017-01-01');
DELETE FROM dept_manager_dup
WHERE
dept_no = 'd001';  
INSERT INTO departments_dup 
(dept_name)
VALUES
('Public Relations');
DELETE FROM departments_dup
WHERE
dept_no = 'd002'; 
#final tables
select * from departments_dup order by dept_no ;
select * from dept_manager_dup order by dept_no ;

#inner join 
select dp.dept_no,dp.dept_name,dm.emp_no
from departments_dup as dp #with the aliases
inner join  dept_manager_dup as dm #with the aliases
on dp.dept_no=dm.dept_no;
/* notice that null values were not considered during inner joins*/
/* also d002 and d003 from department_manager_dup were not joined  and d010 and d011 from vice versa tables*/
#another example
select dept_manager_dup.emp_no,dept_manager_dup.dept_no,employees.first_name,employees.last_name,employees.hire_date
from 
dept_manager_dup
inner join 
employees
on
dept_manager_dup.emp_no=employees.emp_no; #mention only the matching cols

#handling duplicates
select * from employees;
insert into departments_dup
(dept_no,dept_name)
values
('d009','Cust'),('d009','Cust');

select * from departments_dup order by dept_no;
#normal inner join
select departments_dup.dept_no, dept_manager_dup.emp_no,dept_manager_dup.from_date
from departments_dup
inner join dept_manager_dup
on departments_dup.dept_no=dept_manager_dup.dept_no;
/* notice that there are duplicate rows*/
/* to eliminate this use group by*/
select departments_dup.dept_no, dept_manager_dup.emp_no,dept_manager_dup.from_date
from departments_dup
inner join dept_manager_dup
on departments_dup.dept_no=dept_manager_dup.dept_no
group by emp_no;


