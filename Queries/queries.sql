SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';

-- Retirement eligibility
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Number of employees retiring
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT departments.dept_name,
     dept_manager.emp_no,
     dept_manager.from_date,
     dept_manager.to_date
FROM departments
INNER JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no;

SELECT retirement_info.emp_no,
    retirement_info.first_name,
retirement_info.last_name,
    dept_emp.to_date
    FROM retirement_info
    LEFT JOIN dept_emp
    ON retirement_info.emp_no = dept_emp.emp_no;
	
SELECT (retirement_info.emp_no,
    retirement_info.first_name,
    retirement_info.last_name,
dept_emp.to_date
INTO current_emp
FROM retirement_info
LEFT JOIN dept_emp
ON retirement_info.emp_no = dept_emp.emp_no
WHERE dept_emp.to_date = ('9999-01-01');)

SELECT COUNT(current_emp.emp_no), dept_emp.dept_no
FROM current_emp
LEFT JOIN dept_emp
ON current_emp.emp_no = dept_emp.emp_no
GROUP BY dept_emp.dept_no;
ORDER BY de.dept_no;

SELECT emp_no,
    first_name,
last_name,
    gender
    INTO emp_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT employees.emp_no,
    employees.first_name,
    employees.last_name,
    employees.gender,
    salaries.salary,
    dept_emp.to_date
    INTO emp_info
FROM employees
INNER JOIN salaries
ON (employees.emp_no = salaries.emp_no)
INNER JOIN dept_emp
ON (employees.emp_no = dept_emp.emp_no)
WHERE (employees.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
     AND (employees.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
      AND (dept_emp.to_date = '9999-01-01');
	  
SELECT  dept_manager.dept_no,
        departments.dept_name,
        dept_manager.emp_no,
        current_emp.last_name,
        current_emp.first_name,
        dept_manager.from_date,
        dept_manager.to_date
INTO manager_info
FROM dept_manager
    INNER JOIN departments
        ON (dept_manager.dept_no = departments.dept_no)
    INNER JOIN current_emp
        ON (dept_manager.emp_no = current_emp.emp_no);
		
SELECT current_emp.emp_no,
current_emp.first_name,
current_emp.last_name,
departments.dept_name
INTO dept_info
FROM current_emp
INNER JOIN dept_emp
ON (current_emp.emp_no = dept_emp.emp_no)
INNER JOIN departments
ON (dept_emp.dept_no = departments.dept_no);

SELECT retirement_info.emp_no,
retirement_info.first_name,
retirement_info.last_name,
dept_info.dept_name
INTO sales_info
FROM retirement_info
LEFT JOIN dept_info
ON (retirement_info.emp_no = dept_info.emp_no)
WHERE dept_name = 'Sales'