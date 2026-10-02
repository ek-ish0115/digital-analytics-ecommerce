SELECT * FROM orders
SELECT * FROM order_items
SELECT * FROM order_item_refunds
SELECT * FROM website_pageviews
SELECT * FROM website_sessions
SELECT * FROM products


-----Data Quality Checks--------------------

--Duplicate records----
SELECT O.order_id,COUNT(*) AS Count_ FROM orders AS O
GROUP BY O.order_id
HAVING COUNT(*)>1

SELECT I.order_item_id,COUNT(*) AS Count_ FROM order_items AS I
GROUP BY I.order_item_id
HAVING COUNT(*)>1

SELECT R.order_item_refund_id,COUNT(*) AS Count_ FROM order_item_refunds AS R
GROUP BY R.order_item_refund_id
HAVING COUNT(*)>1

SELECT P.product_id,COUNT(*) AS Count_ FROM products AS P
GROUP BY P.product_id
HAVING COUNT(*)>1

SELECT W.website_pageview_id,COUNT(*) AS Count_ FROM website_pageviews AS W
GROUP BY W.website_pageview_id
HAVING COUNT(*)>1

SELECT Z.website_session_id,COUNT(*) AS Count_ FROM website_sessions AS Z
GROUP BY Z.website_session_id
HAVING COUNT(*)>1


--- Missing values ---

SELECT * FROM orders AS O
WHERE O.order_id IS NULL

SELECT * FROM order_items AS I
WHERE I.order_item_id IS NULL

SELECT * FROM order_item_refunds AS R
WHERE R.order_item_refund_id IS NULL

SELECT * FROM products AS P
WHERE P.product_id IS NULL

SELECT * FROM website_pageviews AS W
WHERE W.website_pageview_id IS NULL

SELECT * FROM website_sessions AS WS
WHERE WS.website_session_id IS NULL


---- FK values missing in Parent Table ----

SELECT * FROM orders AS O
LEFT JOIN products AS P
ON O.primary_product_id = P.product_id
WHERE P.product_id IS NULL

SELECT * FROM order_items AS I
LEFT JOIN products AS P
ON I.product_id = P.product_id
WHERE P.product_id IS NULL

SELECT * FROM orders AS O
LEFT JOIN website_sessions AS W
ON O.website_session_id = W.website_session_id
WHERE W.website_session_id IS NULL

SELECT * FROM website_pageviews AS WP
LEFT JOIN website_sessions AS W
ON WP.website_session_id = W.website_session_id
WHERE W.website_session_id IS NULL

SELECT * FROM order_item_refunds AS R
LEFT JOIN order_items AS I
ON R.order_item_id = I.order_item_id
WHERE I.order_item_id IS NULL

SELECT * FROM order_item_refunds AS R
LEFT JOIN order_items AS O
ON R.order_item_id = O.order_item_id
WHERE O.order_item_id IS NULL

SELECT * FROM order_items AS I
LEFT JOIN orders AS O
ON I.order_id = O.order_id
WHERE O.order_id IS NULL


---- DATE VALIDATION ----

SELECT * FROM orders AS O
WHERE O.created_at IS NULL

SELECT * FROM order_items AS I
WHERE I.created_at IS NULL

SELECT * FROM order_item_refunds AS R
WHERE R.created_at IS NULL

SELECT * FROM products AS P
WHERE P.created_at IS NULL

SELECT * FROM website_pageviews AS W
WHERE W.created_at IS NULL

SELECT * FROM website_sessions AS WS
WHERE WS.created_at IS NULL


---- NEGATIVE VALUES CHECK ----

SELECT * FROM orders AS O
WHERE O.price_usd <=0 AND O.cogs_usd <=0

SELECT * FROM order_items AS I
WHERE I.price_usd <=0 AND I.cogs_usd <=0

SELECT * FROM order_item_refunds AS R
WHERE R.refund_amount_usd <=0


---- CHECK IF REFUND CREDITED MORE THEN ORDER VALUE ----

SELECT * FROM order_item_refunds AS R
LEFT JOIN orders AS O
ON R.order_id = O.order_id
WHERE R.refund_amount_usd > O.price_usd

---- Order & Order Items consistency ----
SELECT * FROM orders AS O
LEFT JOIN order_items AS I
ON O.order_id = I.order_id
WHERE I.order_id IS NULL


---- Order & order items value consistency ----

SELECT O.order_id, ROUND(O.price_usd,2) AS Order_price, X.item_total FROM (
			SELECT I.order_id, ROUND(SUM(I.price_usd),2) AS item_total FROM order_items AS I
			GROUP BY I.order_id ) AS X
LEFT JOIN orders AS O
ON X.order_id = O.order_id
WHERE ROUND(X.item_total,2) <> ROUND(O.price_usd,2)


SELECT O.order_id,O.items_purchased,COUNT(OI.order_item_id)AS Total_items FROM orders AS O
LEFT JOIN order_items AS OI
ON O.order_id = OI.order_id
GROUP BY O.order_id,O.items_purchased
HAVING O.items_purchased <> COUNT(OI.order_item_id)



---- WEBSITE PREVIEW ----

SELECT W.device_type, COUNT(W.website_session_id) AS Sessions_per_device FROM website_sessions AS W
GROUP BY W.device_type
ORDER BY Sessions_per_device DESC


SELECT W.is_repeat_session, COUNT(*) AS Count_ FROM website_sessions AS W
GROUP BY W.is_repeat_session
ORDER BY W.is_repeat_session

SELECT W.utm_source, COUNT(*) as session_count_ FROM website_sessions AS W
GROUP BY W.utm_source
ORDER BY session_count_ DESC


SELECT  W.utm_campaign, COUNT(*) as session_count_ FROM website_sessions AS W
GROUP BY W.utm_campaign
ORDER BY session_count_ DESC


SELECT WP.pageview_url, COUNT(*) AS session_count_ FROM website_pageviews AS WP
GROUP BY WP.pageview_url 
ORDER BY session_count_ DESC

----WEB CONVERSION TO ORDER ---

SELECT COUNT(W.website_session_id) AS Total_sessions,
COUNT(O.website_session_id) AS Total_Conversion,
ROUND(CAST(COUNT(O.website_session_id) AS float)/COUNT(W.website_session_id) *100,2) AS Conversion_rate
FROM website_sessions AS W
LEFT JOIN orders AS O
ON W.website_session_id = O.website_session_id


----TOTAL PRODUCT RETURNED---
SELECT X.product_name, COUNT(R.order_item_refund_id) AS Total_item_returned FROM (

				SELECT  O.order_item_id,P.product_name FROM order_items AS O
				LEFT JOIN products AS P
				ON O.product_id = P.product_id
) AS X

RIGHT JOIN order_item_refunds AS R
ON X.order_item_id = R.order_item_id
GROUP BY X.product_name;


---- TOTAL PRODUCT SOLD VS RETURN PCT ----

WITH 
Total_orders AS (
				SELECT P.product_name, COUNT(*) AS Total_orders FROM orders AS O
				LEFT JOIN products AS P
				ON O.primary_product_id = P.product_id
				GROUP BY P.product_name ),

Order_returned AS (
		SELECT X.product_name, COUNT(R.order_item_refund_id) AS Total_item_returned FROM (

						SELECT  O.order_item_id,P.product_name FROM order_items AS O
						LEFT JOIN products AS P
						ON O.product_id = P.product_id
		) AS X

		RIGHT JOIN order_item_refunds AS R
		ON X.order_item_id = R.order_item_id
		GROUP BY X.product_name )

SELECT T.product_name,T.Total_orders,R.Total_item_returned, ROUND(CAST(R.Total_item_returned AS FLOAT)/t.Total_orders*100,2) AS Return_pct
FROM Total_orders AS T
LEFT JOIN Order_returned AS R
ON T.product_name = R.product_name;

---Product wise----
SELECT P.product_id,P.product_name,ROUND(SUM(O.price_usd),2) AS Revenue,
ROUND(COUNT(O.order_item_id),2) AS Units_sold,
ROUND(SUM(O.price_usd)-SUM(O.cogs_usd),2) AS Total_Profit
FROM order_items AS O
LEFT JOIN products AS P
ON O.product_id = P.product_id
GROUP BY P.product_id,P.product_name
ORDER BY P.product_id





-------------- EDA ----------------------------------

----KEY METRICS ----
SELECT COUNT(*) AS Total_orders,
ROUND(SUM(O.price_usd),2) AS Total_Revenue,
ROUND(SUM(O.cogs_usd),2) AS Total_cogs,
ROUND(SUM(O.price_usd)- SUM(O.cogs_usd),2) as Net_profit,
ROUND(AVG(O.price_usd),2) AS AOV,
ROUND((SUM(O.price_usd) - SUM(O.cogs_usd))/SUM(O.price_usd) *100,2) AS Gross_Margin_Pct
FROM orders AS O


---- Total Items Sold ----
SELECT COUNT(OI.order_item_id)AS Total_units_Sold FROM order_items AS OI

---- Total Units Returned ----
SELECT COUNT(R.order_item_refund_id) AS Total_units_returned FROM order_item_refunds AS R

----YEARLY REVENUE & NET PROFIT-----
SELECT YEAR(o.created_at) AS Year_,ROUND(SUM(O.price_usd),2) AS Revenue,
ROUND(SUM(O.price_usd)- SUM(O.cogs_usd),2) as Net_profit
FROM orders AS O
GROUP BY YEAR(o.created_at)
ORDER BY Year_;


---- PREVIOUS YEAR COMPARISON ----
WITH CTE1 AS (
			SELECT YEAR(o.created_at) AS Year_,ROUND(SUM(O.price_usd),2) AS Revenue,
			LAG(ROUND(SUM(O.price_usd),2)) OVER (ORDER BY YEAR(o.created_at)) AS Prev_yr_revenue
			FROM orders AS O
			GROUP BY YEAR(o.created_at)
			)
SELECT A.Year_,ROUND((A.Revenue-A.Prev_yr_revenue)/A.Prev_yr_revenue*100,2) AS Revenue_growth_pct FROM CTE1 AS A
