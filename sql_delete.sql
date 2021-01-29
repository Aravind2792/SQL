use employees; # indicating mysql to use this database for the queries

#safe delete option
delete from employees
where emp_no=999903;
select * from employees where emp_no=999903;
/*notice that in in DDL options deletec cascade options will be enabled,which means that all the tables with repsect
 to emp_no 999903 will be deleted */
 
#creating a new table from an existing table departments
drop table if exists department_dup;
 create table  if not exists department_dup (
 dept_no char(4) not null,
dept_name varchar(20) not null
)
select * from departments
; 

#notice that delete statement has been inserted without where condition so that entire table will be deleted 
#now for an unsafe deletion
delete from department_dup;
select * from department_dup;
rollback; 
select * from department_dup;

