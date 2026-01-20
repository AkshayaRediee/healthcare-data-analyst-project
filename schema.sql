
-- relational schema
CREATE TABLE patients (
  patient_id INT PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  sex CHAR(1),
  race VARCHAR(30),
  dob DATE,
  zip_code CHAR(5)
);

CREATE TABLE encounters (
  encounter_id INT PRIMARY KEY,
  patient_id INT REFERENCES patients(patient_id),
  encounter_type VARCHAR(20),
  admit_datetime TIMESTAMP,
  discharge_datetime TIMESTAMP,
  length_of_stay_days INT,
  discharge_disposition VARCHAR(20),
  total_charges NUMERIC(12,2),
  readmitted_within_30d BOOLEAN
);

CREATE TABLE diagnoses (
  encounter_id INT REFERENCES encounters(encounter_id),
  patient_id INT REFERENCES patients(patient_id),
  icd_code VARCHAR(10),
  description VARCHAR(120),
  priority CHAR(1)
);

CREATE TABLE labs (
  encounter_id INT REFERENCES encounters(encounter_id),
  patient_id INT REFERENCES patients(patient_id),
  lab_name VARCHAR(40),
  lab_value NUMERIC(8,2),
  unit VARCHAR(12),
  collected_datetime TIMESTAMP
);

CREATE TABLE medications (
  encounter_id INT REFERENCES encounters(encounter_id),
  patient_id INT REFERENCES patients(patient_id),
  medication_name VARCHAR(80),
  route VARCHAR(20)
);
