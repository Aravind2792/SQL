use employees;
select @@global.sql_mode;
set @@global.sql_mode := replace(@@global.sql_mode, 'ONLY_FULL_GROUP_BY', '');

/* sql joins with where*/
select e.emp_no,e.first_name,e.last_name,e.hire_date,t.title
from employees as e
inner join titles as t
on e.emp_no=t.emp_no
where e.last_name='Markovitch' and e.first_name='Margareta';

/*sql joins with cross join*/
select dm.*, d.*
from departments_dup as d
cross join dept_manager_dup as dm
on d.dept_no=dm.dept_no;

select e.*, d.*
from employees as e
cross join departments_dup as d
where emp_no<10011
ORDER BY e.emp_no, d.dept_name;





