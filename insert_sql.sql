use employees;
select * from titles
limit 10;

INSERT INTO employees
VALUES
(
    999903,
    '1977-09-14',
    'Johnathan',
    'Creek',
    'M',
    '1999-01-01'
);
delete  from titles where emp_no=999903;
insert into titles
(
emp_no,title,from_date
) 
values 
(
999903,'Senior Engineer','1997-10-01'
);

select * from titles
order by emp_no desc;

delete  from dept_emp where emp_no=999903;

insert into dept_emp
(
	emp_no,
    dept_no,
    from_date,
    to_date
)
values
(
999903,'d005','1997-10-01','9999-01-01'
);

#inserting data into a new table
#with manual entries
create table if not exists department_dup(
 emp_no int not null,
 dept_no int not null
 );
 insert into department_dup(
 emp_no,dept_no)
 values(
 1,2
 );
 Select *  from department_dup;
 
 #with rows from another table
 create table  if not exists department_dup_cop (
 dept_no char(4) not null,
dept_name varchar(10) not null
)
select * from departments
; 
select * from department_dup_cop order by dept_no;

