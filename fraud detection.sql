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

--8)Among transactions with low device trust scores, what percentage are fraudulent — 
--- and how does it compare across trust levels?
SELECT
  CASE
    WHEN device_trust_score BETWEEN 25 AND 50 THEN 'Bin 1 - Low Trust'
    WHEN device_trust_score BETWEEN 51 AND 75 THEN 'Bin 2 - Medium Trust'
    WHEN device_trust_score BETWEEN 76 AND 99 THEN 'Bin 3 - High Trust'
  END AS trust_bin,
  COUNT(*) AS total_transactions,
  SUM(is_fraud::int) AS fraud_count,
  ROUND(100.0 * SUM(is_fraud::int) / COUNT(*), 2) AS fraud_rate_pct,
  ROUND(100.0 * SUM(SUM(is_fraud::int)) OVER (ORDER BY SUM(is_fraud::int) DESC)
    / SUM(SUM(is_fraud::int)) OVER (), 2) AS cumulative_fraud_pct
FROM fraud
GROUP BY trust_bin
ORDER BY fraud_rate_pct DESC;
--9)Contribution of High Velocity transaction user in fraud rate

SELECT
  ROUND(100.0 * 
    SUM(CASE WHEN velocity_last_24h >= 5 THEN is_fraud::int ELSE 0 END)
    / NULLIF(SUM(is_fraud::int), 0), 2) AS high_velocity_fraud_share_pct
FROM fraud;