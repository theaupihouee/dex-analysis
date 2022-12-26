--- Queries about the volume 

--- Volume for the last 7 days
SELECT 
    SUM(usd_amount)/1e9 AS volume_7d
FROM dex."trades"
WHERE block_time > now() - interval '7 days'
AND category = 'DEX' 

--- Volume for the last 24 hours 
SELECT 
    SUM(usd_amount)/1e9 AS volume_24h
FROM dex."trades"
WHERE block_time > now() - interval '1 days'
AND category = 'DEX'

--- Market shares by volume for the last 7 days 
SELECT 
    project AS "Project"
    ,ROUND(SUM(usd_amount),2) AS "Volume" 
FROM dex."trades"
WHERE block_time > now() - interval '7 days'
AND category = 'DEX'
GROUP BY project 
ORDER BY "Volume" DESC

--- Daily total volume for the last year 
SELECT 
    DATE_TRUNC('day', block_time) AS day 
    ,SUM(usd_amount) AS daily_volume
FROM dex.trades
WHERE block_time >= now() - interval '1 year'
AND category = 'DEX'
GROUP BY 1
ORDER BY 1
