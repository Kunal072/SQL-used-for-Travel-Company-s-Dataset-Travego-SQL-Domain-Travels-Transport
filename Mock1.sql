SELECT * FROM hr.employees;
SET GLOBAL sql_mode=(SELECT CONCAT(@@sql_mode, ',ONLY_FULL_GROUP_BY'));

select * from employees where department_id group by department_id limit 1 offset 9;

with cte as
(select *,dense_rank() over(partition by department_id) as rr from employees  limit 1 offset 9)  

select * from cte where mod(employee_id,2)=1;

WITH RankedSalaries AS (
    SELECT
        *,
        dense_rank() OVER (ORDER BY salary DESC) AS salary_rank
    FROM
        employees
)
SELECT
    *
FROM
    RankedSalaries
WHERE
    salary_rank = 2;
    
    
SET GLOBAL sql_mode=(SELECT CONCAT(@@sql_mode, ',ONLY_FULL_GROUP_BY'));

select *,max(salary) from employees  where salary<(select max(salary) from employees group by salary);

SELECT
           MAX(salary)
        FROM
            employees
        WHERE
            salary < (SELECT MAX(salary) FROM employees);
            
            select email,count(email) from employees group by email having count(email)>1;