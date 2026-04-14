SELECT * FROM project_customer_segmentation.customer;

-- 1.How is the shopping distribution according to gender?--
SELECT gender, COUNT(*) AS total_shopping
FROM project_customer_segmentation.customer
GROUP BY gender;

-- 2.Which gender did we sell more products to?--
SELECT gender, sum(quantity) as total_products
FROM project_customer_segmentation.customer
GROUP BY gender;

-- 3.Which gender generated more revenue?--
SELECT gender, sum(quantity*price) as revenue
FROM project_customer_segmentation.customer
GROUP BY gender;

-- 4.Distribution of purchase categories relative to other columns?--
SELECT category,gender,count(*) as total
FROM project_customer_segmentation.customer
GROUP BY category,gender;

-- 5.How is the shopping distribution according to age?--
SELECT 
CASE
     WHEN age < 20 THEN 'TEEN'
     WHEN age BETWEEN 20 AND 40 THEN 'ADULT'
	 WHEN age BETWEEN 40 AND 60 THEN 'MIDDLE AGE'
     ELSE 'SENIOR'
END AS age_group,
count(*) as total
FROM project_customer_segmentation.customer
GROUP BY age_group;

-- 6.Which age cat did we sell more products to?--
SELECT
CASE
	 WHEN age < 20 THEN 'TEEN'
     WHEN age BETWEEN 20 AND 40 THEN 'ADULT'
	 WHEN age BETWEEN 40 AND 60 THEN 'MIDDLE AGE'
     ELSE 'SENIOR'
END AS age_group,gender,
COUNT(quantity) as total_products
FROM project_customer_segmentation.customer
GROUP BY age_group,gender;

-- 7.Which age cat generated more revenue?--
SELECT
CASE
	 WHEN age < 20 THEN 'TEEN'
     WHEN age BETWEEN 20 AND 40 THEN 'ADULT'
	 WHEN age BETWEEN 40 AND 60 THEN 'MIDDLE AGE'
     ELSE 'SENIOR'
END AS age_group,
COUNT(quantity*price) as revenue
FROM project_customer_segmentation.customer
GROUP BY age_group
order by revenue DESC;

-- 8.Distribution of purchase categories relative to other columns?--
SELECT category, gender, SUM(quantity) AS total_products
FROM project_customer_segmentation.customer
GROUP BY category, gender;

-- 9. Does the payment method have a relation with other columns?--
SELECT payment_method, gender, sum(quantity*price) AS revenue
FROM project_customer_segmentation.customer
GROUP BY payment_method, gender;

-- 10.How is the distribution of the payment method?--
SELECT payment_method,count(*) as total
FROM project_customer_segmentation.customer
GROUP BY payment_method;
