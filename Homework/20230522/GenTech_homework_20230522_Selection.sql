USE hr;
-- Найти департаменты в которых есть работники, зарабатывающие больше 10 000. 
-- В результате выборки формируются два поля (department_id и поле со значениями 1 или 0) (использовать оператор max)
SELECT 
	 department_id,
     MAX( 
		CASE 
			WHEN salary > 10000 
			THEN 1
			ELSE 0
		END ) AS hasBigSalary
FROM employees
GROUP BY department_id
ORDER BY department_id;

select * from employees;    

-- Найти департаменты в которых все работники зарабатывают больше 10 000. 
-- В результате выборки формируются два поля (department_id и поле со значениями 1 или 0) (использовать оператор min)
SELECT 
	 department_id,
     MIN( 
		CASE 
			WHEN salary > 10000 
			THEN 1
			ELSE 0
		END ) AS everyoneHasBigSalary
FROM employees
GROUP BY department_id
ORDER BY department_id;

-- Своими словами написать за что отвечают два эти оператора
-- оператор MIN() возвращает наименьшее значение выбранного столбца.
-- оператор MAX() возвращает наибольшее значение выбранного столбца.
-- если использовать с "GROUP BY поле_группировки", то будет выбираться min/max не по всему столбцу, а в пределах определенного значения поля_группировки
-- т.е. если мы делаем группировку по подразделению, то будет искаться min/max для каждого конкретного подразделения
-- 

