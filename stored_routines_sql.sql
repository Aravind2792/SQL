use employees;
drop procedure if exists employee_sr;

delimiter $$
create procedure employee_sr()
begin
 select avg(salary) from salaries
 limit 100;
 end$$
 delimiter ;
 
 call employees.employee_sr();
 
 /*Create a procedure called ‘emp_info’ that uses as 
 parameters the first and the last name of an individual, and returns their employee number.*/
 
 delimiter $$
 create procedure emp_info(in p_first_name varchar(20),in p_last_name varchar(20),out p_emp_no integer)
 begin
 select e.emp_no
 into p_emp_no #using into for specifying the output parameter
 from employees e
 where e.first_name=p_first_name and e.last_name=p_last_name; #connecting the input args with internal elements
 end$$
 delimiter ;
 
 select distinct first_name,last_name from employees;
call employees.emp_info('Parto', 'Bamford'); #this wont run as this SR accepts 
#three argument, 2 for inputs and 1 for output so one output variable has to be created, see below

/* Create a variable, called ‘v_emp_no’, where you will store the 
output of the procedure you created in the last exercise.
Call the same procedure, inserting the values ‘Aruna’ and ‘Journel’ as a first and last name respectively.
Finally, select the obtained output.*/

set @v_emp_no=0; #setting the variable to zero
call employees.emp_info('Parto', 'Bamford',@v_emp_no); #assigning the variable to emp_info SR
select @v_emp_no; #calling the emp_info variable

