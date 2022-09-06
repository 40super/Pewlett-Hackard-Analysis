-- Deliverable 1
SELECT employees.emp_no , employees.first_name, employees.last_name,title.title,title.from_date,title.to_date
INTO retirement_titles
FROM employees
LEFT JOIN title
ON employees.emp_no = title.emp_no
WHERE (employees.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY employees.emp_no;


SELECT re.emp_no , re.first_name , re.last_name , re.title
FROM retirement_titles AS re

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (re.emp_no) re.emp_no,
re.first_name,
re.last_name,
re.title
INTO unique_titles
FROM retirement_titles AS re
WHERE (re.to_date = '9999-01-01')
ORDER BY re.emp_no, re.to_date DESC;


SELECT COUNT(ut.title) , ut.title 
INTO retiring_titles
FROM unique_title as ut
GROUP BY ut.title
ORDER BY COUNT(ut.title) DESC;

-- Deliverable 2

SELECT DISTINCT ON (e.emp_no) e.emp_no , e.first_name, e.last_name , e.birth_date,
	de.from_date, de.to_date,
	ti.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_employee as de
ON (e.emp_no = de.emp_no)
INNER JOIN title as ti
ON (e.emp_no = ti.emp_no)
WHERE (de.to_date = '9999-01-01') AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no ;