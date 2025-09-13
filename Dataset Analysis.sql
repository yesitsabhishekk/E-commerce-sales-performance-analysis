CREATE DATABASE e_commerce_sales;

select * from dataset
WHERE CustomerID = 14180;

SELECT CustomerID,
    DATEDIFF(CURDATE(), MAX(InvoiceDate)) AS Recency,
    COUNT(DISTINCT InvoiceNo) AS Frequency,
    SUM(TotalSales) AS Monetary
FROM dataset
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID
ORDER BY CustomerID;

SELECT CustomerID, MAX(InvoiceDate)
FROM dataset
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID; 
    
SELECT CustomerID,
    DATEDIFF(CURDATE(), MAX(
         CASE
            WHEN InvoiceDate LIKE '%/%/%' THEN STR_TO_DATE(InvoiceDate, '%m/%d/%Y %k:%i')
            WHEN InvoiceDate LIKE '%-%-%' THEN STR_TO_DATE(InvoiceDate, '%m-%d-%Y %k:%i')
            ELSE NULL
        END
        )) AS Recency,
    COUNT(DISTINCT InvoiceNo) AS Frequency,
    ROUND(SUM(TotalSales), 2) AS Monetary
FROM dataset
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID
ORDER BY CustomerID;

SELECT CustomerID,
    DATEDIFF(CURDATE(), MAX(
        CASE
            WHEN InvoiceDate LIKE '%/%/%' THEN STR_TO_DATE(InvoiceDate, '%m/%d/%Y %k:%i')
            WHEN InvoiceDate LIKE '%-%-%' THEN STR_TO_DATE(InvoiceDate, '%m-%d-%Y %k:%i')
            ELSE NULL
        END
    )) AS Recency,
    COUNT(DISTINCT InvoiceNo) AS Frequency,
    ROUND(SUM(TotalSales), 2) AS Monetary,
    ROUND(SUM(TotalSales) / COUNT(DISTINCT InvoiceNo), 2) AS Avg_Purchase_Value,
    ROUND(SUM(TotalSales), 2) AS CLV
FROM dataset
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID
ORDER BY CustomerID;
    
