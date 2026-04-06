# HR Employee Attrition Analysis — Key Findings

# HR Employee Attrition Analysis — Key Findings & 
# Business Recommendations

**Author:** Priyanka Dolse — Business Analyst  
**Tool:** PostgreSQL  
**Dataset:** IBM HR Analytics Employee Attrition (Kaggle)  
**Records Analysed:** 1,470 employees | 35 variables  

---

## Project Overview

This project analyses employee attrition data using SQL 
to identify key drivers of employee turnover and provide 
data-driven recommendations to reduce attrition costs.

The analysis simulates the type of HR data work I 
delivered professionally at DBS Bank, where I led 
end-to-end analysis of regulatory HR reporting processes.

---

## Summary of Results

| Metric | Result |
|--------|--------|
| Overall Attrition Rate | 16.12% |
| Industry Benchmark | 10-15% |
| Highest Attrition Department | Sales (20.63%) |
| Highest Attrition Job Role | Sales Representative (39.76%) |
| Overtime Attrition Rate | 30.53% |
| Non-Overtime Attrition Rate | 10.44% |
| Highest Risk Age Group | Under 25 (39.18%) |
| Avg Tenure of Leavers | 5.13 years |
| Avg Tenure of Stayers | 7.37 years |

---

## Detailed Findings

### Finding 1 — Company Attrition Exceeds Industry Benchmark
The overall attrition rate is **16.12%**, above the 
healthy industry benchmark of 10-15%. The company is 
losing approximately 1 in 6 employees annually, which 
carries significant recruitment and training costs.

---

### Finding 2 — Sales and HR Departments Are Critical Risk Areas

| Department | Attrition Rate | Variance From Average |
|------------|---------------|----------------------|
| Sales | 20.63% | +4.51% |
| Human Resources | 19.05% | +2.93% |
| Research & Development | 13.84% | -2.28% |

Both Sales and HR exceed the company average 
significantly. R&D is the only department performing 
within a healthy range. Targeted interventions are 
needed urgently in Sales and HR.

---

### Finding 3 — Overtime Is The Strongest Predictor of Attrition

| Overtime | Total Employees | Employees Left | Attrition Rate |
|----------|----------------|----------------|----------------|
| Yes | 416 | 127 | 30.53% |
| No | 1,054 | 110 | 10.44% |

Employees working overtime are **nearly 3x more likely 
to leave** than those who do not. This is the single 
strongest attrition predictor identified in the dataset.

---

### Finding 4 — Sales Representatives Are The Highest Risk Role

| Job Role | Total | Left | Attrition Rate |
|----------|-------|------|----------------|
| Sales Representative | 83 | 33 | 39.76% |
| Laboratory Technician | 259 | 62 | 23.94% |
| Human Resources | 52 | 12 | 23.08% |
| Sales Executive | 326 | 57 | 17.48% |
| Research Scientist | 292 | 47 | 16.10% |
| Manufacturing Director | 145 | 10 | 6.90% |
| Healthcare Representative | 131 | 9 | 6.87% |
| Manager | 102 | 5 | 4.90% |
| Research Director | 80 | 2 | 2.50% |

Nearly 4 in 10 Sales Representatives are leaving. 
Combined with Sales department having the highest 
overall attrition, there is a systemic problem in 
the Sales function that requires immediate attention.

---

### Finding 5 — Young Employees Are Leaving At Alarming Rates

| Age Group | Total | Left | Attrition Rate |
|-----------|-------|------|----------------|
| Under 25 | 97 | 38 | 39.18% |
| 25-34 | 554 | 112 | 20.22% |
| 55 and above | 69 | 11 | 15.94% |
| 45-54 | 245 | 25 | 10.20% |
| 35-44 | 505 | 51 | 10.10% |

Nearly 4 in 10 employees under 25 are leaving. 
The 25-34 group also exceeds the company average. 
The company has a clear early career retention crisis 
— it is losing young talent before they reach full 
productivity.

---

### Finding 6 — Leavers Exit Early In Their Tenure

| Attrition | Avg Years At Company | Avg Years In Role |
|-----------|---------------------|-------------------|
| No (Stayed) | 7.37 years | 4.48 years |
| Yes (Left) | 5.13 years | 2.90 years |

Employees who leave do so after an average of just 
5.13 years — significantly earlier than the 7.37 year 
average for stayers. They also spend less time in their 
current role (2.90 vs 4.48 years), suggesting role 
dissatisfaction or lack of progression opportunities 
drives early departure.

---

### Finding 7 — Work Life Balance Does Not Directly Drive Attrition

| Department | Avg Work Life Balance | Attrition Rate |
|------------|-----------------------|----------------|
| R&D | 2.73 (lowest) | 13.84% (lowest) |
| Sales | 2.82 | 20.63% (highest) |
| HR | 2.92 (highest) | 19.05% |

Interestingly R&D has the lowest work life balance 
score yet the lowest attrition rate. This suggests 
work life balance alone does not predict attrition — 
other factors such as compensation, career progression, 
and job satisfaction play a more significant role.

---

## Business Recommendations

### Recommendation 1 — Immediately Review Overtime Policy
**Priority: Critical**  
The 3x attrition rate for overtime workers demands 
urgent action:
- Audit which departments and roles carry highest 
  overtime burden
- Introduce overtime caps or mandatory compensation 
  review for overtime workers
- Investigate workload distribution in Sales where 
  both overtime and attrition are likely correlated
- Consider hiring additional headcount in Sales to 
  reduce per-employee workload

### Recommendation 2 — Sales Representative Retention Programme
**Priority: Critical**  
With 39.76% attrition, Sales Representatives require 
a dedicated retention strategy:
- Conduct structured exit interviews to identify 
  root causes specific to this role
- Review commission structures and base salary 
  against market benchmarks
- Introduce clear career progression pathways from 
  Sales Representative to Sales Executive
- Consider mentoring programme pairing Senior Sales 
  Executives with new Representatives

### Recommendation 3 — Early Career Development Programme
**Priority: High**  
The Under 25 group losing 39.18% signals a lack of 
career development and engagement:
- Introduce structured graduate and junior development 
  pathways
- Implement mentoring programmes specifically for 
  employees under 25
- Review onboarding experience — leavers average 
  only 2.90 years in role suggesting early 
  disillusionment
- Consider introducing a formal career progression 
  framework with clear milestones

### Recommendation 4 — Deep Dive Into R&D Success Factors
**Priority: Medium**  
R&D maintains the lowest attrition despite having 
the lowest work life balance scores. Understanding 
what R&D does well — compensation, management style, 
career progression — could provide a blueprint for 
improving retention in Sales and HR.

---

## SQL Techniques Demonstrated

- **Aggregation:** COUNT, SUM, AVG, MIN, MAX
- **Conditional logic:** CASE WHEN statements
- **Type casting:** ::numeric for accurate percentages
- **Grouping and sorting:** GROUP BY, ORDER BY
- **Age bucketing:** CASE WHEN with BETWEEN ranges
- **Common Table Expressions (CTEs):** Multi-step 
  analysis using WITH clauses
- **CROSS JOIN:** Comparing department vs overall 
  averages in a single query
- **ROUND:** Formatting numeric output to 2 decimal 
  places

---

## Tools Used
- PostgreSQL
- pgAdmin 4
- Excel (initial data exploration)

---

## About
**Priyanka Dolse** — Business Analyst  
3+ years experience in banking, fintech and consulting  
MSc Management — University of Bristol (2025)  
Full right to work in the UK  

LinkedIn: linkedin.com/in/priyankadolse  
GitHub: github.com/priyankadolse