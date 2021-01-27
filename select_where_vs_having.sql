use employees;
select *,count(emp_no) as emp_no_count from dept_emp where from_date > '2000-01-01' group by emp_no having count(emp_no)>1;

/*Limit function*/
select * from dept_emp
limit 100;