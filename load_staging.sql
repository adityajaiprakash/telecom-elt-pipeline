DROP TABLE IF EXISTS staging_telecom;

CREATE TABLE staging_telecom (
  customerID TEXT,
  gender TEXT,
  SeniorCitizen INT,
  tenure INT,
  InternetService TEXT,
  Churn TEXT
);

COPY staging_telecom
FROM '/data/telecom.csv'
DELIMITER ','
CSV HEADER;
