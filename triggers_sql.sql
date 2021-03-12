use employees;
drop trigger  if exists employee_date;
delimiter $$
create trigger employee_date
before insert on employees
for each row
begin
if new.hire_date!= date_format(sysdate(),'%Y-%m-%d') then
set new.hire_date= date_format(sysdate(),'%Y-%m-%d');
end if;
end $$
delimiter ;

INSERT employees VALUES ('999904', '1970-01-31', 'John', 'Johnson', 'M', '2025-01-01');  
SELECT  
    *  
FROM  
    employees
ORDER BY emp_no DESC;

