-- View to combine patient details with their encounter information.
-- Joins patients and encounters on the patient ID to provide a single view of patient and encounter data.
CREATE VIEW dbo.vw_patient_encounters AS
SELECT 
    p.Id AS PatientID,
    p.FIRST,
    p.LAST,
    p.GENDER,
    p.BIRTHDATE,
    e.Id AS EncounterID,
    e.[START] AS EncounterStart,
    e.[STOP] AS EncounterEnd,
    e.[BASE_ENCOUNTER_COST],
    e.[TOTAL_CLAIM_COST],
    e.[PAYER_COVERAGE],
    e.ORGANIZATION,
    e.PROVIDER,
    e.PAYER
FROM dbo.patients p
INNER JOIN dbo.encounters e
    ON p.Id = e.PATIENT;
GO

-- View to summarize encounter cost information by payer.
-- Calculates the number of encounters, average claim cost, and total claim cost for each payer.
CREATE VIEW dbo.vw_encounter_cost_summary AS
SELECT 
    e.PAYER,
    COUNT(*) AS TotalEncounters,
    ROUND(AVG(e.[TOTAL_CLAIM_COST]), 2) AS AvgClaimCost,
    ROUND(SUM(e.[TOTAL_CLAIM_COST]), 2) AS TotalClaimCost
FROM dbo.encounters e
GROUP BY e.PAYER;
GO

-- View to aggregate the total number of claims per patient.
CREATE VIEW dbo.vw_claims_summary AS
SELECT 
    PATIENTID,
    COUNT(*) AS TotalClaims
FROM dbo.claims
GROUP BY PATIENTID;
GO

-- View to summarize medication cost data for each patient.
-- Provides counts of medications along with average and total cost figures.
CREATE VIEW dbo.vw_medication_cost_summary AS
SELECT 
    PATIENT,
    COUNT(*) AS TotalMedications,
    ROUND(AVG([TOTALCOST]), 2) AS AvgMedicationCost,
    ROUND(SUM([TOTALCOST]), 2) AS TotalMedicationCost
FROM dbo.medications
GROUP BY PATIENT;
GO

-- Query to return overall record counts from key tables.
-- This gives a quick snapshot of the total patients, encounters, claims, and medications.
SELECT 
    (SELECT COUNT(*) FROM dbo.patients) AS TotalPatients,
    (SELECT COUNT(*) FROM dbo.encounters) AS TotalEncounters,
    (SELECT COUNT(*) FROM dbo.claims) AS TotalClaims,
    (SELECT COUNT(*) FROM dbo.medications) AS TotalMedications;
GO

-- Retrieves the top 10 patients by total encounter claim cost.
-- Aggregates the claim costs from the patient-encounter view and orders the results in descending order.
SELECT TOP 10 
    pe.PatientID,
    pe.FIRST,
    pe.LAST,
    ROUND(SUM(pe.TOTAL_CLAIM_COST), 2) AS TotalEncounterCost
FROM dbo.vw_patient_encounters pe
GROUP BY pe.PatientID, pe.FIRST, pe.LAST
ORDER BY TotalEncounterCost DESC;
GO

-- Displays the encounter cost summary details, ordered by the total claim cost.
SELECT *
FROM dbo.vw_encounter_cost_summary
ORDER BY TotalClaimCost DESC;
GO

-- Combines patient details with their claims and medication summaries.
-- Uses LEFT JOINs so that all patients are included even if they have no claims or medications.
SELECT 
    p.Id AS PatientID,
    p.FIRST,
    p.LAST,
    cs.TotalClaims,
    md.TotalMedications,
    md.TotalMedicationCost
FROM dbo.patients p
LEFT JOIN dbo.vw_claims_summary cs ON p.Id = cs.PATIENTID
LEFT JOIN dbo.vw_medication_cost_summary md ON p.Id = md.PATIENT;
GO
