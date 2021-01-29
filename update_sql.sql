use employees; # indicating mysql to use this database for the queries

update departments
set 
dept_name='Data analysis'
where 
dept_no='d010'; # updates the row dept_name with Data analysis instead of Business Analysis
commit; #commits the changes as auto-committ has been disabled
select* from departments order by dept_name asc; 
