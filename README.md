# enterprise-data-warehouse-sqlserver
# Enterprise Data Warehouse – Manufacturing Scenario

## Overview
This project demonstrates the design of a scalable star-schema based data warehouse 
for a manufacturing environment.

The goal is to support KPI reporting such as:
- OEE (Overall Equipment Effectiveness)
- Downtime Analysis
- Production Efficiency
- Quality Rate

---

## Architecture

Staging Layer → Transformation Layer → Data Warehouse (Star Schema)

---

## Data Modeling Approach

A star schema design was implemented:

- FactProduction
- DimMachine
- DimProduct
- DimTime

The model is optimized for analytical queries and BI tools such as Power BI.

---

## ETL Strategy

- Data is loaded into staging tables
- Data cleansing and transformation applied
- Incremental load supported
- Indexing strategy applied for performance



