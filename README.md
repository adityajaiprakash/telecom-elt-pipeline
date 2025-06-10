# Telecom ELT Pipeline (SQL-based, Containerized)

This project implements a complete **ELT pipeline** for processing and reporting on telecom churn data. It fulfills all requirements of the given problem statement using **SQL**, **PostgreSQL**, **Airflow**, and **Metabase** — fully containerized using **Docker Compose**.

---

## 📌 Features

- ✅ Ingests raw CSV data (Telecom Churn dataset)
- ✅ Loads into a PostgreSQL staging table
- ✅ Transforms the data using SQL:
  - Fills missing values with defaults
  - Anonymizes PII (`customerID`)
- ✅ Loads transformed data into a `reporting` schema
- ✅ Uses **Airflow** to orchestrate the pipeline on an hourly schedule (configurable)
- ✅ Connects **Metabase** to visualize and report on the cleaned data
- ✅ Runs on any laptop using Docker

---

## 📁 Project Structure

```
telecom-elt-pipeline/
├── data/                      # CSV data files (mounts inside PostgreSQL)
├── sql/                       # SQL scripts for ELT steps
│   ├── load_staging.sql
│   └── transform_clean.sql
├── dags/
│   └── etl_pipeline.py        # Airflow DAG definition
├── docker-compose.yml         # Containerized setup
└── README.md
```

---

## 🚀 Quickstart (on Mac or Linux)

### 1. Clone this Repository
```bash
git clone https://github.com/YOUR_USERNAME/telecom-elt-pipeline.git
cd telecom-elt-pipeline
```

### 2. Add the Dataset
Download the [Telecom Churn CSV](https://www.kaggle.com/datasets/abdullah0a/telecom-customer-churn-insights-for-analysis) and rename it:
```bash
mv ~/Downloads/telecom_customer_churn.csv ./data/telecom.csv
```

### 3. Start the Pipeline
```bash
docker-compose up --build
```

---

## 🌐 Access the Tools

| Tool     | URL                    | Credentials                |
|----------|------------------------|-----------------------------|
| Airflow  | http://localhost:8080  | `airflow / airflow`        |
| Metabase | http://localhost:3000  | First-time setup via browser |

---

## ⚙️ How the ELT Works

### 🔄 Airflow DAG (`telecom_elt`)
Runs every hour and executes:
1. `sql/load_staging.sql` – loads CSV into `staging_telecom`
2. `sql/transform_clean.sql` – cleans + anonymizes into `reporting.cleaned_telecom`

### 🧼 Data Transformations
- `customerID` → anonymized via `MD5()`
- NULL values filled using `COALESCE()`
- Output saved into a separate `reporting` schema

---

## 📊 Sample Reporting Questions for Metabase

- What percentage of customers churned?
- Churn rate by InternetService type
- Average tenure of churned vs retained customers

---

## 📬 Contact

Created by Aditya Prakash — for assessment with HG Insights.
