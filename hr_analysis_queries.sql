CREATE TABLE hr_data (
    Age INTEGER,
    Attrition VARCHAR(10),
    BusinessTravel VARCHAR(50),
    DailyRate INTEGER,
    Department VARCHAR(50),
    DistanceFromHome INTEGER,
    Education INTEGER,
    EducationField VARCHAR(50),
    EmployeeCount INTEGER,
    EmployeeNumber INTEGER,
    EnvironmentSatisfaction INTEGER,
    Gender VARCHAR(10),
    HourlyRate INTEGER,
    JobInvolvement INTEGER,
    JobLevel INTEGER,
    JobRole VARCHAR(100),
    JobSatisfaction INTEGER,
    MaritalStatus VARCHAR(20),
    MonthlyIncome INTEGER,
    MonthlyRate INTEGER,
    NumCompaniesWorked INTEGER,
    Over18 VARCHAR(5),
    OverTime VARCHAR(10),
    PercentSalaryHike INTEGER,
    PerformanceRating INTEGER,
    RelationshipSatisfaction INTEGER,
    StandardHours INTEGER,
    StockOptionLevel INTEGER,
    TotalWorkingYears INTEGER,
    TrainingTimesLastYear INTEGER,
    WorkLifeBalance INTEGER,
    YearsAtCompany INTEGER,
    YearsInCurrentRole INTEGER,
    YearsSinceLastPromotion INTEGER,
    YearsWithCurrManager INTEGER
);

SELECT COUNT(*) FROM hr_data;

-- Q1 - how many employees are in each department?
SELECT 
    Department,
    COUNT(*) AS employee_count
FROM hr_data
GROUP BY Department
ORDER BY employee_count DESC;

-- Q2 - what is the overall employee attrition rate?
SELECT 
    ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) 
    / COUNT(*)::numeric, 2) AS attrition_rate_percent
FROM hr_data;



-- Q3 - which department has the highest attrition rate?
SELECT 
    Department,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) 
    / COUNT(*)::numeric, 2) AS attrition_rate_percent
FROM hr_data
GROUP BY Department
ORDER BY attrition_rate_percent DESC;


-- Q4 - what is the average monthly income by departments?

SELECT 
    Department,
    ROUND(AVG(MonthlyIncome), 2) AS avg_monthly_income,
    MIN(MonthlyIncome) AS min_income,
    MAX(MonthlyIncome) AS max_income
FROM hr_data
GROUP BY Department
ORDER BY avg_monthly_income DESC;

-- Q5 - is there a relationship between overtime and attrition?

 SELECT 
    OverTime,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) 
    / COUNT(*)::numeric, 2) AS attrition_rate_percent
FROM hr_data
GROUP BY OverTime
ORDER BY attrition_rate_percent DESC;

-- Q6 - which job role has the highest attrition 
SELECT 
    JobRole,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) 
    / COUNT(*), 2) AS attrition_rate_percent
FROM hr_data
GROUP BY JobRole
ORDER BY attrition_rate_percent DESC;



-- Q7 - Average years at company for employees who left vs stayed?
SELECT 
    Attrition,
    ROUND(AVG(YearsAtCompany), 2) AS avg_years_at_company,
    ROUND(AVG(YearsInCurrentRole), 2) AS avg_years_in_role
FROM hr_data
GROUP BY Attrition;

-- Q8 -  which age group has the highest attrition rate?
SELECT 
    CASE 
        WHEN Age < 25 THEN 'Under 25'
        WHEN Age BETWEEN 25 AND 34 THEN '25-34'
        WHEN Age BETWEEN 35 AND 44 THEN '35-44'
        WHEN Age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55 and above'
    END AS age_group,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) 
    / COUNT(*), 2) AS attrition_rate_percent
FROM hr_data
GROUP BY age_group
ORDER BY attrition_rate_percent DESC;

-- Q9 - what percentage of high performance are leaving?
SELECT 
    PerformanceRating,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) 
    / COUNT(*), 2) AS attrition_rate_percent
FROM hr_data
GROUP BY PerformanceRating
ORDER BY PerformanceRating DESC;

-- Q10 - which department has the lowest average work life balance?
SELECT 
    Department,
    ROUND(AVG(WorkLifeBalance), 2) AS avg_work_life_balance,
    COUNT(*) AS total_employees
FROM hr_data
GROUP BY Department
ORDER BY avg_work_life_balance ASC;


-- Q11 - Departments with above average attrition rates
WITH department_attrition AS (
    SELECT 
        Department,
        ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) 
        / COUNT(*), 2) AS attrition_rate_percent
    FROM hr_data
    GROUP BY Department),
overall_attrition AS (
    SELECT 
        ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) 
        / COUNT(*), 2) AS overall_rate
    FROM hr_data)
SELECT 
    d.Department,
    d.attrition_rate_percent,
    o.overall_rate,
    ROUND(d.attrition_rate_percent - o.overall_rate, 2) AS variance_from_average
FROM department_attrition d
CROSS JOIN overall_attrition o
WHERE d.attrition_rate_percent > o.overall_rate
ORDER BY variance_from_average DESC;
