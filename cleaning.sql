DELETE FROM PUBLIC.SALES
WHERE
	CUSTOMERID IS NULL
	AND TRANSACTIONDATE IS NULL
	AND STORETYPE IS NULL
	AND PRODUCTNAME IS NULL;

UPDATE PUBLIC.SALES
SET
	REGION = CASE
		WHEN CITY IN ('Ahmedabad', 'Jaipur', 'Mumbai', 'Pune') THEN 'West'
		WHEN CITY IN ('Bangalore', 'Chennai', 'Hyderabad') THEN 'South'
		WHEN CITY = 'Kolkata' THEN 'East'
		WHEN CITY IN ('Delhi', 'Lucknow') THEN 'North'
		ELSE REGION -- Keep the original region if no condition is met
	END;