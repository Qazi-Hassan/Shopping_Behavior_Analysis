

``` sql
    CREATE DATABASE shopping_behavior;
USE shopping_behavior;

CREATE TABLE shopping_behavior_updated (
    customer_id INT PRIMARY KEY,
    age INT,
    gender VARCHAR(10),
    item_purchased VARCHAR(50),
    category VARCHAR(50),
    purchase_amount_usd DECIMAL(10,2),
    location VARCHAR(50),
    size VARCHAR(10),
    color VARCHAR(30),
    season VARCHAR(20),
    review_rating DECIMAL(3,1),
    subscription_status VARCHAR(10),
    shipping_type VARCHAR(50),
    discount_applied VARCHAR(5),
    promo_code_used VARCHAR(5),
    previous_purchases INT,
    payment_method VARCHAR(20),
    frequency_of_purchases VARCHAR(20)
);

```

select * from shopping_behavior_updated limit 5;


-- SQL Queries for Data Analysis

-- 1️ Total Revenue Generated
SELECT SUM(purchase_amount_usd) AS total_revenue 
FROM shopping_behavior_updated;
-- This gives the total amount spent by all customers.

-- 2️ Revenue by Category
SELECT category, SUM(purchase_amount_usd) AS revenue 
FROM shopping_behavior_updated 
GROUP BY category 
ORDER BY revenue DESC;
-- Finds the most profitable product categories.

-- 3 Top 5 Best-Selling Items
SELECT item_purchased, COUNT(*) AS total_purchases 
FROM shopping_behavior_updated 
GROUP BY item_purchased 
ORDER BY total_purchases DESC 
LIMIT 5;
-- Shows the most purchased items.


-- 4 Customer Segmentation by Purchase Frequency
SELECT frequency_of_purchases, COUNT(customer_id) AS customer_count 
FROM shopping_behavior_updated 
GROUP BY frequency_of_purchases 
ORDER BY customer_count DESC;
-- Segments customers based on how often they shop.


-- 5 Average Purchase Amount by Gender
SELECT gender, AVG(purchase_amount_usd) AS avg_spending 
FROM shopping_behavior_updated 
GROUP BY gender;
-- Finds out which gender spends more on average.

-- 6 Impact of Discounts on Revenue
SELECT discount_applied, COUNT(*) AS num_purchases, SUM(purchase_amount_usd) AS total_spent 
FROM shopping_behavior_updated
GROUP BY discount_applied;
-- Analyzes how discounts affect total sales.

-- 7 Subscription vs Non-Subscription Customers
SELECT subscription_status, COUNT(customer_id) AS customer_count, 
       SUM(purchase_amount_usd) AS total_spending 
FROM shopping_behavior_updated
GROUP BY subscription_status;
-- Finds out whether subscribers spend more than non-subscribers.


-- 8 Most Popular Payment Methods
SELECT payment_method, COUNT(*) AS usage_count 
FROM shopping_behavior_updated
GROUP BY payment_method 
ORDER BY usage_count DESC;
-- Identifies the most used payment method.

-- 9 Seasonal Sales Trends
SELECT season, SUM(purchase_amount_usd) AS total_sales 
FROM shopping_behavior_updated
GROUP BY season 
ORDER BY total_sales DESC;
-- Finds out which season generates the most revenue.


-- 10 Customer demographics
SELECT age, gender, location, COUNT(*) 
FROM shopping_behavior_updated 
GROUP BY age, gender, location;
-- finds out customers demography.
-- End of project --


