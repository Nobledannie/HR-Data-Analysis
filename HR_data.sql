SELECT * FROM HR_data;

-- Number of employees
SELECT COUNT(*) Num_of_employees
FROM HR_data;


-- ATTRITION RATE IN %
WITH attrition_num AS 
	(SELECT COUNT(*) AS attrition_num 
	FROM HR_data 
	WHERE Attrition = 1),
	total_attrition AS (
	SELECT COUNT(*) AS total_attrition
	FROM HR_data)
	SELECT 
		ROUND((CAST(a.attrition_num AS FLOAT) / (t.total_attrition) * 100), 2) AS attrition_percentage
	FROM 
		attrition_num a,
		total_attrition t;


-- AVERAGE AGE
SELECT 
	AVG(Age) AS average_age
FROM HR_data;

-- Active Employees: Number of active employees\
SELECT COUNT(*) Active_employees
FROM HR_data
WHERE Attrition = 0;

-- Attrition by Gender
SELECT 	
	Gender,
	COUNT(*) Num_of_attrition
FROM HR_data
WHERE Attrition = 1
GROUP BY Gender
;

-- NUMBER OF ATTRITIONS BY DEPARTMENT
SELECT 
	Department,
	COUNT(*) Num_of_attritions
FROM HR_data
WHERE Attrition = 1
GROUP BY Department
ORDER BY 2 DESC;

-- Number of employees by Age group
SELECT 
	CF_age_band,
	COUNT(*) Num_of_employees
	FROM HR_data
	GROUP BY CF_age_band;

	
-- ATTRITION BY EDUCATION FIELD
SELECT 
	Education_Field,
	COUNT(*) Num_of_attritions
FROM HR_data
WHERE Attrition = 1
GROUP BY Education_Field
ORDER BY 2 DESC;

-- ATTRITION BY EDUCATION DEGREE
SELECT 
	Education,
	COUNT(*) Num_of_attritions
FROM HR_data
WHERE Attrition = 1
GROUP BY Education
ORDER BY 2 DESC;

-- ATTRITION BY JOB ROLE
SELECT 
	Job_Role,
	COUNT(*) Num_of_attritions
FROM HR_data
WHERE Attrition = 1
GROUP BY Job_Role
ORDER BY 2 DESC;


-- ATTRITION BY GENDER FOR DIFFERENT AGE GROUPS
SELECT 
	Gender,
	CF_age_band,
	COUNT(*) Num_of_attritions
FROM HR_data
WHERE Attrition = 1
GROUP BY Gender, CF_age_band;

-- ATTRITION BY Marital Status
SELECT 
	Marital_Status,
	COUNT(*) Num_of_attritions
FROM HR_data
WHERE Attrition = 1
GROUP BY Marital_Status
ORDER BY 2 DESC;

-- Job Satisfaction Rating
SELECT 
	Job_Role,
	Job_Satisfaction,
	COUNT(*)AS Rating
FROM HR_data
GROUP BY Job_Role, Job_Satisfaction
ORDER BY 1;




--- Average Income By Education Field
SELECT 
	Education_Field,
	AVG(Monthly_Income) AS Avg_Monthly_income
FROM HR_data
GROUP BY Education_Field
ORDER BY Monthly_income;

--- Attrition relating to Income by Education Degree
SELECT 
	Education,
	AVG(Monthly_Income) AS Average_Monthly_income,
	COUNT(*) Num_of_workers
FROM HR_data
WHERE Attrition = 1
GROUP BY Education
ORDER BY 3;



-- Job roles 
SELECT 
	Job_Role,
	AVG(Monthly_Income) AS Average_Monthly_income,
	COUNT(*) Num_of_workers
FROM HR_data
WHERE Attrition = 1
GROUP BY Job_Role
ORDER BY 3 DESC;