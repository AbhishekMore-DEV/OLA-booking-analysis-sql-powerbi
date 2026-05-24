-- =========================================================
-- PROJECT: ola-booking-analysis-sql-powerbi
-- DATABASE: PostgreSQL
-- =========================================================

-- =========================================================
-- CREATE TABLE
-- =========================================================

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

-- =========================================================
-- DATA PREVIEW
-- =========================================================

SELECT *
FROM bookings;

-- =========================================================
-- DATA CLEANING
-- =========================================================

-- Check total number of rows

SELECT COUNT(*) AS total_bookings
FROM bookings;

-- Check NULL values

SELECT *
FROM bookings
WHERE booking_id IS NULL
OR booking_status IS NULL
OR customer_id IS NULL
OR vehicle_type IS NULL
OR pickup_location IS NULL
OR drop_location IS NULL
OR booking_value IS NULL;


-- Delete NULL values

DELETE 
FROM bookings
WHERE booking_id IS NULL
OR booking_status IS NULL
OR customer_id IS NULL
OR vehicle_type IS NULL
OR pickup_location IS NULL
OR drop_location IS NULL
OR booking_value IS NULL;


-- =========================================================
-- DATA EXPLORATION
-- =========================================================

-- Total number of bookings
SELECT COUNT(*) AS total_bookings FROM bookings;

-- Total number of unique customers
SELECT COUNT(DISTINCT customer_id) AS total_customers
FROM bookings;

-- Available vehicle types
SELECT DISTINCT vehicle_type 
FROM bookings;

-- Total bookings by vehicle type
SELECT vehicle_type, COUNT(*) AS total_bookings
FROM bookings GROUP BY vehicle_type;  

-- =========================================================
-- BUSINESS PROBLEMS & ANALYSIS
-- =========================================================

-- Q1. Retrieve all successful bookings

SELECT * FROM bookings WHERE Booking_Status = 'Success';

-- =========================================================

-- Q.2. Find the average ride distance for each vehicle type:

SELECT Vehicle_Type, ROUND(AVG(Ride_Distance)) as avg_distance FROM bookings GROUP BY
Vehicle_Type;

-- =========================================================

-- Q.3. Get the total number of cancelled rides by customers:

SELECT COUNT(*) FROM bookings WHERE Booking_Status = 'Canceled by Customer';

-- =========================================================

-- Q.4. List the top 5 customers who booked the highest number of rides:

SELECT Customer_ID, COUNT(Booking_ID) as total_rides FROM bookings GROUP BY
Customer_ID ORDER BY total_rides DESC LIMIT 5;

-- =========================================================

-- Q.5. Get the number of rides cancelled by drivers due to personal and car-related issues:

SELECT COUNT(*) FROM bookings WHERE canceled_rides_by_driver = 'Personal & Car related issue';

-- =========================================================

-- Q.6. Find the maximum and minimum driver ratings for Prime Sedan bookings:

SELECT MAX(Driver_Ratings) as max_rating, MIN(Driver_Ratings) as min_rating FROM
bookings WHERE Vehicle_Type = 'Prime Sedan';

=========================================================

-- Q.7. Retrieve all rides where payment was made using UPI:

SELECT * FROM bookings WHERE Payment_Method = 'UPI';

-- =========================================================

-- Q.8. Find the average customer rating per vehicle type:

SELECT Vehicle_Type, ROUND(AVG(Customer_Rating),1) as avg_customer_rating FROM bookings
GROUP BY Vehicle_Type;

-- =========================================================

-- Q.9. Calculate the total booking value of rides completed successfully:

SELECT SUM(Booking_Value) as total_successful_value FROM bookings WHERE
Booking_Status = 'Success';

-- =========================================================

-- Q.10. List all incomplete rides along with the reason:

SELECT Booking_ID, Incomplete_Rides_Reason FROM bookings WHERE Incomplete_Rides =
'Yes';

-- =========================================================
-- END OF PROJECT
-- =========================================================
