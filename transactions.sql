--- Queries about the transactions 


--- Transactions for the last 7 days 
SELECT 
   COUNT(tx_from) AS nb_transaction
FROM dex."trades" 
WHERE block_time > now() - interval '7 day'
AND category = 'DEX'

--- Transactions for the last 24 hours 
SELECT 
   COUNT(tx_from) AS nb_transaction
FROM dex."trades" 
WHERE block_time > now() - interval '1 day'
AND category = 'DEX'

--- Market shares by transaction for the last 7 days 
SELECT 
   project
   ,COUNT(tx_from) AS nb_transaction
FROM dex."trades" 
WHERE block_time > now() - interval '7 day'
AND category = 'DEX'
GROUP BY project 
ORDER BY 2 DESC 

--- Daily average amount per transaction for the last year 
SELECT 
    DATE_TRUNC('day', block_time) AS day 
    ,SUM(usd_amount)/COUNT(tx_from) AS avg_amount_per_transaction
FROM dex."trades"
WHERE block_time > now() - interval '1 year'
AND category = 'DEX'
GROUP BY day
ORDER BY day

--- Average amount per transaction for the last year and week 
WITH 

year_data AS(
    SELECT 
        project 
        ,SUM(usd_amount)/COUNT(tx_from) AS avg_amount_per_tx
    FROM dex."trades"
    WHERE block_time > now() - interval '1 year' 
    AND category = 'DEX'
    GROUP BY project 
    ),
    
week_data AS(
    SELECT 
        project 
        ,SUM(usd_amount)/COUNT(tx_from) AS avg_amount_per_tx
    FROM dex."trades"
    WHERE block_time > now() - interval '7 day' 
    AND category = 'DEX'
    GROUP BY project 
    )
    
SELECT 
    year_data.project
    ,year_data.avg_amount_per_tx AS avg_amount_per_tx_1y
    ,week_data.avg_amount_per_tx AS avg_amount_per_tx_1w
FROM year_data  
JOIN week_data ON week_data.project = year_data.project 
ORDER BY avg_amount_per_tx_1y DESC
