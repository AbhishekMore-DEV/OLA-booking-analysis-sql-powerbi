# OLA Booking Analysis | SQL & Power BI

## Project Overview
This project focuses on analyzing OLA ride booking data using SQL, PostgreSQL, and Power BI to generate meaningful business insights related to ride trends, customer behavior, cancellations, revenue, and ratings.

The project simulates a real-world data analyst workflow including:
- Data Importing
- Data Cleaning
- SQL Analysis
- Business Problem Solving
- Dashboard Creation
- Insight Generation

---

# Objectives
The main objectives of this project are:

- Analyze ride booking patterns
- Identify cancellation trends
- Evaluate customer and driver ratings
- Measure revenue performance
- Compare vehicle type performance
- Build interactive dashboards for business insights

---

# Tech Stack
- SQL
- PostgreSQL
- pgAdmin 4
- Power BI
- CSV Dataset

---

# Dataset Information
The dataset contains ride booking details for OLA rides.

### Columns Included:
- Date
- Time
- Booking ID
- Booking Status
- Customer ID
- Vehicle Type
- Pickup Location
- Drop Location
- V_TAT
- C_TAT
- Cancelled Rides by Customer
- Cancelled Rides by Driver
- Incomplete Rides
- Incomplete Rides Reason
- Booking Value
- Payment Method
- Ride Distance
- Driver Ratings
- Customer Rating

---

# Database Setup

## Create Database

```sql
CREATE DATABASE ola_analysis;
```

---

## Create Table

```sql
CREATE TABLE bookings (
    date TIMESTAMP,
    time TIME,
    booking_id VARCHAR(20),
    booking_status VARCHAR(50),
    customer_id VARCHAR(20),
    vehicle_type VARCHAR(50),
    pickup_location VARCHAR(100),
    drop_location VARCHAR(100),
    v_tat NUMERIC,
    c_tat NUMERIC,
    canceled_rides_by_customer TEXT,
    canceled_rides_by_driver TEXT,
    incomplete_rides VARCHAR(10),
    incomplete_rides_reason TEXT,
    booking_value INT,
    payment_method VARCHAR(50),
    ride_distance INT,
    driver_ratings NUMERIC,
    customer_rating NUMERIC
);
```

---

# Data Import Process
1. Open pgAdmin
2. Create database and table
3. Import CSV file using Import/Export feature
4. Enable:
   - Header = Yes
   - Format = CSV
5. Set:
   - NULL String = null

---

# SQL Analysis Performed

## 1. Retrieve all successful bookings

```sql
SELECT *
FROM bookings
WHERE booking_status = 'Success';
```

---

## 2. Find average ride distance for each vehicle type

```sql
SELECT
    vehicle_type,
    ROUND(AVG(ride_distance), 2) AS avg_ride_distance
FROM bookings
GROUP BY vehicle_type;
```

---

## 3. Get total cancelled rides by customers

```sql
SELECT COUNT(*) AS cancelled_by_customers
FROM bookings
WHERE booking_status = 'Canceled by Customer';
```

---

## 4. Top 5 customers with highest rides

```sql
SELECT
    customer_id,
    COUNT(booking_id) AS total_rides
FROM bookings
GROUP BY customer_id
ORDER BY total_rides DESC
LIMIT 5;
```

---

## 5. Rides cancelled by drivers due to personal issues

```sql
SELECT COUNT(*) AS driver_cancelled_rides
FROM bookings
WHERE canceled_rides_by_driver = 'Personal & Car related issue';
```

---

## 6. Maximum and minimum driver ratings for Prime Sedan

```sql
SELECT
    MAX(driver_ratings) AS max_driver_rating,
    MIN(driver_ratings) AS min_driver_rating
FROM bookings
WHERE vehicle_type = 'Prime Sedan';
```

---

## 7. Retrieve all rides paid using UPI

```sql
SELECT *
FROM bookings
WHERE payment_method = 'UPI';
```

---

## 8. Average customer rating by vehicle type

```sql
SELECT
    vehicle_type,
    ROUND(AVG(customer_rating), 2) AS avg_customer_rating
FROM bookings
GROUP BY vehicle_type;
```

---

## 9. Total booking value of successful rides

```sql
SELECT
    SUM(booking_value) AS total_successful_booking_value
FROM bookings
WHERE booking_status = 'Success';
```

---

## 10. List incomplete rides with reasons

```sql
SELECT
    booking_id,
    incomplete_rides_reason
FROM bookings
WHERE incomplete_rides = 'Yes';
```

---

# Power BI Dashboard

The Power BI dashboard was created to visualize key ride booking insights.

## Dashboard Insights
- Ride Volume Over Time
- Booking Status Breakdown
- Top Vehicle Types by Ride Distance
- Revenue by Payment Method
- Customer vs Driver Ratings
- Cancellation Reasons Analysis
- Top Customers by Booking Value
- Ride Distance Distribution

---

# Key Business Insights
- Identified the most preferred vehicle categories
- Measured overall booking success rate
- Analyzed major cancellation reasons
- Evaluated customer satisfaction trends
- Compared payment methods by revenue contribution
- Discovered top-performing ride locations

---

# Project Structure

```text
OLA-Booking-Analysis/
│
├── dataset/
│   └── bookings.csv
│
├── sql/
│   └── OLA_BOOKING_ANALYSIS.sql
│
├── powerbi/
│   └── OLA_Dashboard.pbix
│
└── README.md
```

---

# Learning Outcomes
Through this project, I learned:
- PostgreSQL database management
- Data importing and cleaning
- Writing SQL queries for business analysis
- Data aggregation and KPI analysis
- Power BI dashboard development
- Business insight generation

---

# Future Improvements
- Add advanced SQL queries using CTEs and Window Functions
- Build interactive KPI dashboards
- Perform customer segmentation analysis
- Add Python for data preprocessing and visualization

---

# Author
Abhishek More

Aspiring Data Analyst skilled in SQL, PostgreSQL, Power BI, and Data Analytics.

