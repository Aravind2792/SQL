use employees;
select * from emp_manager;
/* self join is to join sets  of rows on a conditions together from the same table*/
/* here joining the table who are employees are managers as well */

select distinct e1.*
from emp_manager as e1
join emp_manager as e2
on e1.emp_no=e2.manager_no;



