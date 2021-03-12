use employees;
delimiter $$
create function emp_info(p_first_name varchar(20),p_last_name varchar(20)) returns decimal (10,2)
DETERMINISTIC NO SQL READS SQL DATA
begin
declare v_max_salary decimal(10,2);
select 
avg(s.salary)
into v_max_salary
from employees as e
join salaries as s
on e.emp_no= s.emp_no
where e.last_name=p_last_name and e.first_name=p_first_name;
return v_max_salary;
end$$
delimiter ;

select employees.emp_info('Aruna', 'Journel');

DELIMITER $$
CREATE FUNCTION emp_info2(p_first_name varchar(255), p_last_name varchar(255)) RETURNS decimal(10,2)
DETERMINISTIC NO SQL READS SQL DATA
BEGIN
	DECLARE v_max_from_date date;
    DECLARE v_salary decimal(10,2);
SELECT
    MAX(from_date)
INTO v_max_from_date FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.first_name = p_first_name
        AND e.last_name = p_last_name;
SELECT
    s.salary
INTO v_salary FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.first_name = p_first_name
        AND e.last_name = p_last_name
        AND s.from_date = v_max_from_date;
                RETURN v_salary;
END$$
DELIMITER ;
SELECT EMP_INFO2('Aruna', 'Journel');
