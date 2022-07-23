-- Use Dictinct with Orderby to remove duplicate rows
-- Employee_Database_Challenge
-- Output notices that there are duplicates
SELECT
DISTINCT ON (e.emp_no)
e.emp_no,
e.first_name,
e.last_name,
ti.title,
ti.from_date,
ti.to_date
INTO unique_titles
FROM employees as e
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31') AND
(ti.to_date = '9999-01-01')
ORDER BY emp_no ASC, to_date DESC;

SELECT * FROM unique_titles;

-- Retrieve number of employees by their most recent job title
SELECT COUNT (title), title 
INTO retiring_titles
FROM unique_titles
GROUP BY (title)
ORDER BY count DESC;

SELECT 
DISTINCT ON (emp_no)
e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
ti.title
INTO mentorship_eligibilty
FROM employees as e
INNER JOIN department_employee as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (ti.to_date = '9999-01-01') AND
(birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no ASC,to_date DESC;


