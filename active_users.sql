--- Queries about active users 


--- Unique addresses for the last 7 days 
SELECT 
    COUNT(DISTINCT tx_from) AS nb_unique_address
FROM dex.trades
WHERE block_time > now() - interval '7 day'
AND category = 'DEX'

--- Unique addresses for the last 24 hours 
SELECT 
    COUNT(DISTINCT tx_from) AS nb_unique_address
FROM dex.trades
WHERE block_time > now() - interval '1 day'
AND category = 'DEX'

--- Unique wallets for the last year for the 4 main DEX 
WITH 

tx_by_project AS(
    SELECT 
        DATE_TRUNC('hour', block_time) AS datetime
        ,CASE WHEN project = 'Balancer' THEN tx_from END AS balancers_tx_from
        ,CASE WHEN project = 'Curve' THEN tx_from END AS curve_tx_from
        ,CASE WHEN project = 'Sushiswap' THEN tx_from END AS sushiswap_tx_from
        ,CASE WHEN project = 'Uniswap' THEN tx_from END AS uniswap_tx_from
    FROM dex."trades" 
    WHERE block_time > now() - interval '1 year'
    AND category = 'DEX'
    AND project IN ('Balancer','Curve','Sushiswap','Uniswap')
    )

SELECT 
    DATE_TRUNC('month', datetime) AS month 
    ,COUNT(DISTINCT balancers_tx_from) AS balancers_unique_wallet
    ,COUNT(DISTINCT curve_tx_from) AS curve_unique_wallet
    ,COUNT(DISTINCT sushiswap_tx_from) AS sushiswap_unique_wallet
    ,COUNT(DISTINCT uniswap_tx_from) AS uniswap_unique_wallet
FROM tx_by_project
GROUP BY 1 
ORDER BY 1 

--- Daily unique addresses for the last year 
SELECT 
    DATE_TRUNC('day', block_time) AS month
    ,COUNT(DISTINCT tx_from) AS nb_users
FROM dex."trades" 
WHERE block_time > now() - interval '1 year'
AND category = 'DEX'
GROUP BY 1 
ORDER BY 1 
