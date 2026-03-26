USE HealthCareData;


-- 1. Total Patients

select 
	COUNT(Distinct Patient_ID) as TotalPatients
FROM patients;


-- 2. Total Doctors

Select
	COUNT(Distinct Doctor_ID) as TotalDoctors
from doctors;


-- 3. Total Visits

Select 
	COUNT(*) as TotalVisits
from visits;


-- 4. Avg Age of Patients

Select 
	ROUND(Avg(Age),2) As AvgPatientAge
From patients;


-- 5. Top 5 Diagnosed conditions 

select Top 5 Diagnosis,
	COUNT(*) as DiagnosisCount
from visits
Group by diagnosis
order by DiagnosisCount ASC;


-- 6. Follow-Up Rate

select
ROUND(
	(SUM(CASE WHEN follow_Up_Required = 1 THEN 1 ELSE 0 END))*100
	/ COUNT(*),2) As FollowUpRate
From visits;


-- 7. Treatment Cost Per Visit (Avg.)

Select 
Round(
	AVG(Treatment_cost),2) As TreatmentAvgCost
from treatments


-- 8. Total Lab Test Conducted 

Select 
	COUNT(*) As TotalLabTest
from labresults;


-- 9. Percentage of Abnormal Lab Results

Select 
ROUND(
	(SUM(CASE WHEN Test_Result = 'Abnormal' THEN 1 ELSE 0 END)*100)
	/ Count(*),2) As AbnormalLabResult
from labresults;


-- 10. Doctors Workload (Avg patients per Doctor)

Select 
ROUND(
	Count(DISTINCT Patient_ID)*1.0
	/ 
	Count(DISTINCT Doctor_ID), 2) As AvgPatientPerDoctor
from visits


-- 11. Total Revenue- SUM(Treatment Cost) + SUM(Visit Charges)
 