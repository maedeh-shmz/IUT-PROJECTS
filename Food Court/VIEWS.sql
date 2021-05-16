-- MAEDEH SHAMIRZAEI _ 9629743
-- IMPLEMENTATION OF VIEWS



CREATE VIEW SEE_FOODS_WITH_PRICES_AND_REPORT AS
SELECT S.FOOD_ID,NAME,PRICE_IN_RIAL,TOTAL_SALES
FROM FOOD_PRICES AS S INNER JOIN FOOD_REPORT 
ON S.FOOD_ID=FOOD_REPORT.FOOD_ID

test:
select *
from SEE_FOODS_WITH_PRICES_AND_REPORT

---------------------------------------------------------------------------------------

CREATE VIEW VIEW_BRANCHES AS
SELECT *
FROM BRANCHES

test:
select *
from VIEW_BRANCHES
----------------------------------------------------------------------------------------

CREATE VIEW SEE_FIXED_CUSTOMER AS
SELECT *
FROM FIXED_CUSTOMER

TEST:
	SELECT *
	FROM SEE_FIXED_CUSTOMER

----------------------------------------------------------------------------------------

CREATE VIEW RATING_USER AS
SELECT CUSTOMER_ID , COUNT(CUSTOMER_ID) AS TOTAL_COUNT , SUM(SUB_TOTAL) AS TOTAL_PURCHASE
FROM SALESORDERHEADER
GROUP BY CUSTOMER_ID

TEST:
	SELECT *
	FROM RATING_USER

-----------------------------------------------------------------------------------------

CREATE VIEW PROFIT_REPORT AS
SELECT DATE_TIME ,[1] AS COMMODITY_1,[2] AS COMMODITY_2,[3] AS COMMODITY_3,[4] AS COMMODITY_4,
[5] AS COMMODITY_5,[6] AS COMMODITY_6,[7] AS COMMODITY_7,[8] AS COMMODITY_8,[9] AS COMMODITY_9,
[10] AS COMMODITY_10,[11] AS COMMODITY_11,[12] AS COMMODITY_12,[13] AS COMMODITY_13,[14] AS COMMODITY_14,
[15] AS COMMODITY_15,[16] AS COMMODITY_16,[17] AS COMMODITY_17,[18] AS COMMODITY_18,[19] AS COMMODITY_19

FROM (SELECT S1.SALESORDER_ID,FOOD_ID,ORDERQTY,DATE_TIME
		FROM SALESORDERDETAIL AS S1 INNER JOIN 
		SALESORDERHEADER AS S2 ON S1.SALESORDER_ID=S2.SALESORDER_ID) SALES
PIVOT (
	SUM (ORDERQTY)
	FOR FOOD_ID IN ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12],[13],[14],[15],[16],[17],[18],[19])
) AS PVT

