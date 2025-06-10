DROP SCHEMA IF EXISTS reporting CASCADE;
CREATE SCHEMA reporting;

CREATE TABLE reporting.cleaned_telecom AS
SELECT
  MD5(customerID) AS customer_id_anonymized,
  COALESCE(gender, 'Unknown') AS gender,
  COALESCE(SeniorCitizen, 0) AS senior_citizen,
  COALESCE(tenure, 0) AS tenure,
  COALESCE(InternetService, 'Unknown') AS internet_service,
  COALESCE(Churn, 'No') AS churn
FROM staging_telecom;
