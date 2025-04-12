-- combine all data from 12 months starting in Nov-23 to Oct-24

CREATE TABLE divvy_tripdata_12_month AS 
SELECT * FROM divvy_tripdata_oct_24
UNION ALL 
SELECT * FROM divvy_tripdata_sep_24
UNION ALL
SELECT * FROM divvy_tripdata_aug_24
UNION ALL
SELECT * FROM divvy_tripdata_jul_24
UNION ALL
SELECT * FROM divvy_tripdata_jun_24
UNION ALL
SELECT * FROM divvy_tripdata_may_24
UNION ALL
SELECT * FROM divvy_tripdata_apr_24
UNION ALL
SELECT * FROM divvy_tripdata_mar_24
UNION ALL
SELECT * FROM divvy_tripdata_feb_24
UNION ALL
SELECT * FROM divvy_tripdata_jan_24
UNION ALL
SELECT * FROM divvy_tripdata_dec_23
UNION ALL
SELECT * FROM divvy_tripdata_nov_23;

SELECT * FROM divvy_tripdata_12_month;

