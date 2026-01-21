
## 📓 Notebook

# Healthcare Data Analyst Project

## 📌 Overview
End-to-end healthcare analytics project analyzing hospital operations and quality metrics using **Python, SQL, and Jupyter**.  
The project focuses on **readmissions, length of stay (LOS), cost drivers, and diabetes quality indicators**.


This project was built to demonstrate how healthcare data can be transformed into meaningful operational and quality metrics used by hospitals. Healthcare data is often fragmented across patients, encounters, diagnoses, and labs, making it difficult to directly evaluate outcomes such as readmissions, length of stay, and cost drivers.

To address this, I created and analyzed synthetic hospital data using Python and SQL. I structured the data into a relational model, engineered features such as length of stay and 30‑day readmission indicators, and calculated core hospital KPIs. The final analysis highlights areas of high utilization, elevated readmission risk, and variation in care outcomes, with all results documented in a reproducible Jupyter Notebook.

> All data is **synthetic** and created for project purposes.

---

## 🎯 Business Questions
- What is the 30-day hospital readmission rate?
- Which diagnoses are associated with higher readmissions?
- What is the average length of stay for inpatient encounters?
- Where are hospital charges most concentrated?
- Are diabetic patients meeting HbA1c control targets?

---


## 🎯 Business Questions — What This Project Answers

1) **What is the 30‑day hospital readmission rate?**  
   **Answer:** Yes — calculated as a KPI (overall) in `sql/kpi_queries.sql` and computed/printed in the Jupyter notebook. 

2) **Which diagnoses are associated with higher readmissions?**  
   **Answer:** Yes — derived via “readmission rate by primary diagnosis” in `sql/kpi_queries.sql` and visualized in the notebook (bar chart of top diagnoses by readmit rate).

3) **What is the average length of stay for inpatient encounters?**  
   **Answer:** Yes — computed as **Average LOS** (inpatient) in `sql/kpi_queries.sql` and summarized in the notebook. 

4) **Where are hospital charges most concentrated?**  
   **Answer:** Yes — total and average charges by encounter type are calculated in `sql/kpi_queries.sql` and plotted in the notebook (charges by type chart). 

5) **Are diabetic patients meeting HbA1c control targets?**  
   **Answer:** Yes — a diabetes quality proxy computes the **latest HbA1c per patient** and the **control rate (< 7%)** in `sql/kpi_queries.sql`; the notebook reports the percentage. 

---

## 🧰 Tech Stack
- Python (pandas, matplotlib)
- SQL (PostgreSQL-compatible)
- Jupyter Notebook
- Git & GitHub

---

## 📊 Key KPIs
- 30-day readmission rate
- Average inpatient LOS
- Cost by encounter type
- Readmission rate by primary diagnosis
- HbA1c control rate (< 7%)

---

## 📁 Project Structure
```text
notebooks/    - eda_healthcare.pynb(code executed in jupyter) → EDA and visualization  
data/         - all csv files-diagnoses.csv, encounters.csv, labs.csv, medications.csv, patients.csv → Synthetic healthcare datasets  
sql/          - kpi_queries.sql, schemas.sql  → Schema and KPI queries  
reports/      - charges_by_type.png, readmit_by_dx.png → Charts for reporting  
``

This repository includes a Jupyter notebook with all code and outputs saved(eda_healthcare.pynb).
No execution is required to view results — outputs are rendered directly on GitHub.

> All analysis was executed locally and committed with outputs.
