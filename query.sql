use project;

SELECT * FROM credit_clean;

-- Group the customers based on their income type and find the average of their annual income.
SELECT type_income, ROUND(AVG(annual_income),2) AS average_income
FROM credit_clean GROUP BY type_income ORDER BY average_income;

-- Find the female owners of cars and property.
SELECT Ind_ID, GENDER, Annual_income, Type_Income, EDUCATION, AGE_YEARS FROM credit_clean  
WHERE GENDER='F' and Car_Owner='Y' and Propert_Owner='Y';

-- Find the male customers who are staying with their families.
SELECT Ind_ID, GENDER, Annual_income, Type_Income, EDUCATION, AGE_YEARS FROM credit_clean
WHERE GENDER='M' and family_members=1;

-- Please list the top five people having the highest income.
SELECT * FROM credit_clean 
ORDER BY annual_income DESC LIMIT 5; 

-- How many married people are having bad credit?
SELECT COUNT(*) as customer_count FROM credit_clean 
WHERE marital_status IN ('Married','civil marriage') and label=1;


-- What is the highest education level and what is the total count?
SELECT * FROM (SELECT education, count(*) AS count FROM credit_clean
GROUP BY education) x WHERE x.education='Academic degree';


-- Between married males and females, who is having more bad credit?
SELECT GENDER, label, count(*) AS count FROM credit_clean
WHERE marital_status IN ('Married','civil marriage') and label=1
GROUP BY GENDER ORDER BY COUNT(*) DESC;


