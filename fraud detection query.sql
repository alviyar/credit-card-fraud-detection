select * from fraud
-- 1)What is the overall fraud rate (percentage of fraudulent transactions) in the dataset?
select
round(100*sum("is_fraud")/count(*),numer,2) as fraud_rate_percentage
from fraud

--2)Which merchant categories have the highest fraud rate?
SELECT 
    merchant_category,
    COUNT(*) AS total_transactions,
    SUM(is_fraud) AS fraud_count,
    ROUND(100.0 * SUM(is_fraud) / COUNT(*), 2) AS fraud_rate
FROM fraud
GROUP BY merchant_category
ORDER BY fraud_rate DESC;

--3)What is the average transaction amount for fraudulent vs non-fraudulent transactions?
SELECT 
    is_fraud,
    round(AVG(amount)::numeric,2) AS avg_amount
FROM fraud
GROUP BY is_fraud;

--4)At which transaction hours does fraud occur most frequently?
SELECT 
    transaction_hour,
    SUM(is_fraud) AS fraud_count
FROM fraud
GROUP BY transaction_hour
ORDER BY fraud_count DESC;

--5)Is fraud more common during late-night hours (12 AM – 5 AM) compared to the rest of the day?
SELECT 
    CASE 
        WHEN transaction_hour BETWEEN 0 AND 5 THEN 'Late Night (0-5)'
        ELSE 'Rest of Day (6-23)'
    END AS time_period,
    
    COUNT(*) AS total_transactions,
    SUM(is_fraud) AS fraud_count,
    
    ROUND(100.0 * SUM(is_fraud) / COUNT(*), 2) AS fraud_rate
FROM fraud
GROUP BY time_period
ORDER BY fraud_rate DESC;

--6)How does fraud frequency differ between foreign and non-foreign transactions?
select
case 
when foreign_transaction=1 then 'Foreign Transaction'
else 'Non-foreign Transaction'
end as transaction_type,

count(*) as total_transcation,
sum(is_fraud) as fraud_count,

round(100*sum(is_fraud)/count(*),2) as fraud_rate
from fraud
group by transaction_type
order by fraud_rate desc;

--7)What is the fraud rate when there is a location mismatch compared to when there is not?
select
case 
when foreign_transact=1 then 'Foreign Transaction'
else 'Non-foreign Transaction'
end as transaction_type,

count(*) as total_transcation,
sum(is_fraud) as fraud_count,

round(100*sum(is_fraud)/count(*),2) as fraud_rate
from fraud
group by transaction_type
order by fraud_rate desc;
What is the fraud rate when both foreign_transaction and location_mismatch occur together?

--8)Which age group has the highest fraud rate?

Among transactions with low device trust scores, what percentage are fraudulent?

Do transactions with high velocity in the last 24 hours show higher fraud rates?

Which merchant categories contribute the highest total fraud amount (not just fraud count)?

Identify the top 5 highest-value fraudulent transactions.

Rank merchant categories based on fraud rate using window functions.

Create custom risk segments (High / Medium / Low) using device_trust_score, velocity_last_24h, and foreign_transaction. Which segment has the highest fraud rate?