
-- 30-day readmission rate
SELECT ROUND(100.0 * AVG(CASE WHEN readmitted_within_30d THEN 1 ELSE 0 END), 2) AS readmission_rate_pct
FROM encounters;

-- Average length of stay (LOS)
SELECT ROUND(AVG(length_of_stay_days),2) AS avg_los_days
FROM encounters
WHERE encounter_type = 'Inpatient';

-- Charges by encounter type
SELECT encounter_type, ROUND(AVG(total_charges),2) AS avg_charges, ROUND(SUM(total_charges),2) AS total_charges
FROM encounters
GROUP BY encounter_type
ORDER BY total_charges DESC;

-- Readmission rate by primary diagnosis
WITH pri AS (
  SELECT d.encounter_id, d.patient_id, d.icd_code, d.description
  FROM diagnoses d
  WHERE d.priority = 'P'
)
SELECT p.description AS primary_dx, ROUND(100.0 * AVG(CASE WHEN e.readmitted_within_30d THEN 1 ELSE 0 END),2) AS readmit_rate_pct,
       COUNT(*) AS encounters
FROM pri p
JOIN encounters e ON e.encounter_id = p.encounter_id
GROUP BY p.description
ORDER BY readmit_rate_pct DESC
LIMIT 10;

-- Diabetes quality proxy: latest A1c per patient and control rate (<7.0%)
WITH a AS (
  SELECT patient_id, lab_value, collected_datetime,
         ROW_NUMBER() OVER (PARTITION BY patient_id ORDER BY collected_datetime DESC) AS rn
  FROM labs
  WHERE lab_name = 'HbA1c'
)
SELECT ROUND(100.0 * AVG(CASE WHEN lab_value < 7.0 THEN 1 ELSE 0 END),2) AS a1c_control_rate_pct
FROM a WHERE rn = 1;
