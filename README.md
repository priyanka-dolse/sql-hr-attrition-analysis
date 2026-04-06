# sql-hr-attrition-analysis
HR Employee Attrition Analysis using PostgreSQL — identifying key drivers of employee turnover


# HR Employee Attrition Analysis
## SQL Analysis Using PostgreSQL

---

## Project Overview
Analysis of IBM HR Analytics dataset (1,470 employees) 
using PostgreSQL to identify key drivers of employee 
attrition and provide data-driven business recommendations.

This project simulates real-world HR data analysis — 
similar to work delivered professionally at DBS Bank 
where I led end-to-end analysis of regulatory HR 
reporting processes.

---

## Business Questions Answered
- What is the overall attrition rate?
- Which departments and job roles have highest attrition?
- Does overtime correlate with higher attrition?
- Which age groups are most at risk of leaving?
- How does tenure differ between leavers and stayers?
- Which departments exceed the average attrition rate?

---

## Key Findings

| Finding | Result |
|---------|--------|
| Overall attrition rate | 16.12% — above industry benchmark |
| Highest attrition department | Sales at 20.63% |
| Highest attrition job role | Sales Representative at 39.76% |
| Overtime attrition rate | 30.53% vs 10.44% non-overtime |
| Highest risk age group | Under 25 at 39.18% |
| Average tenure of leavers | 5.13 years vs 7.37 years for stayers |

---

## Key Insight
Employees working overtime are nearly **3x more likely 
to leave** than those who do not — the strongest single 
predictor of attrition in this dataset.

---

## SQL Techniques Used
- Aggregation — COUNT, SUM, AVG, MIN, MAX
- Conditional logic — CASE WHEN statements
- Type casting — ::numeric for accurate percentages
- Age group bucketing using CASE WHEN ranges
- Common Table Expressions (CTEs)
- CROSS JOIN for department vs overall comparison
- GROUP BY, ORDER BY, ROUND

---

## Files In This Repository

| File | Description |
|------|-------------|
| `hr_analysis_queries.sql` | All 11 SQL queries with business context comments |
| `findings_summary.md` | Full findings and business recommendations |
| `screenshots/` | Query result screenshots from pgAdmin |

---

## Dataset
IBM HR Analytics Employee Attrition Dataset  
Source: Kaggle  
Records: 1,470 employees | 35 variables

---

## Tools Used
- PostgreSQL
- pgAdmin 4
- VS Code
- Excel

---

## About Me
**Priyanka Dolse** — Business Analyst  
3+ years experience in banking, fintech and consulting  
MSc Management — University of Bristol (2025)  
Full right to work in the UK — Available immediately  

[LinkedIn](https://linkedin.com/in/priyankadolse)
