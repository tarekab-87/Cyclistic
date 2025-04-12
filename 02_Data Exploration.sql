## Data exploration

-- 1. ride_id 

-- check for dulicates 
SELECT COUNT(*)
FROM(
SELECT 
	ride_id, 
	COUNT(ride_id) AS duplicate_count
FROM divvy_tripdata_12_month
GROUP BY ride_id
)
WHERE duplicate_count > 1;
-- total duplicate = 211                 			

-- check for null 
SELECT 
	COUNT(*) - COUNT(ride_id) AS null_count
FROM divvy_tripdata_12_month;
-- no null values found

-- check for inconsistancy 
SELECT COUNT(*) AS invalid_count
FROM (
	SELECT ride_id
    FROM divvy_tripdata_12_month
    WHERE ride_id !~ '^[A-Za-z0-9]+$' -- where ride_id does not match the expression
) AS invalid_rides;
-- no invalid were found 

-- 2. rideable_tyep

-- check for NULL values
SELECT 
	COUNT(*) - COUNT(rideable_type) AS null_count
FROM divvy_tripdata_12_month;
-- no null values found

-- check for categories of rideable type
SELECT rideable_type
FROM divvy_tripdata_12_month
GROUP BY rideable_type;
-- 3 types were found classis and electric bike and electric scooter

-- check for text length 
SELECT COUNT(*) AS invalid_count
FROM(
SELECT rideable_type
FROM divvy_tripdata_12_month
WHERE NOT LENGTH(rideable_type) IN (12, 13, 16)
);
-- no text were found longer than 12, 13, or 16

-- check for inconsistancy 
SELECT COUNT(*)
FROM (
SELECT rideable_type
FROM divvy_tripdata_12_month
WHERE rideable_type !~ '^[A-Za-z_-]+$'
);
-- no inconsistancy were found 

-- check for formatting 
SELECT COUNT(*)
FROM (
SELECT rideable_type
FROM divvy_tripdata_12_month
WHERE NOT rideable_type IN ('electric_bike', 'classic_bike', 'electric_scooter')
);

-- 3. strated at

-- check for null values 
SELECT 
COUNT(*) - COUNT(started_at) AS null_count
FROM divvy_tripdata_12_month;
-- no null values found

-- check time range
SELECT COUNT(started_at) AS invalid_started_at
FROM divvy_tripdata_12_month
WHERE NOT started_at BETWEEN TIMESTAMP '2023-10-31' AND TIMESTAMP '2024-11-01'
-- no issues were found

-- 4. ended at

-- check for null values 
SELECT 
	COUNT(*) - COUNT(ended_at) AS null_count
FROM 
	divvy_tripdata_12_month;
-- no null were found

-- check for time range 
SELECT 
	COUNT(ended_at) AS invalid_ended
FROM 
	divvy_tripdata_12_month
WHERE NOT 
	ended_at BETWEEN TIMESTAMP '2023-10-31' AND TIMESTAMP '2024-11-01'
-- 6 issues were found where ended at does not fall in the date range  	#################

-- 5. started at and ended at 

-- check for null values 
SELECT 
	COUNT(*) - COUNT(started_at) AS null_count
FROM 
	divvy_tripdata_12_month;
-- no null were found

OR
  
SELECT 
	COUNT(*) AS invalid
FROM 
	divvy_tripdata_12_month
WHERE 
	started_at > ended_at; 
-- 258 issues were found			

-- 6. start and end station name

-- check for null values 
SELECT 
	COUNT(*) - COUNT(start_station_name) AS start_null_count,
	COUNT(*) - COUNT(end_station_name) AS end_null_count
FROM 
	divvy_tripdata_12_month;
-- 1079270 null / start station name AND 1112056 null / end station name ################ 

-- total start and end station name
SELECT
    COUNT(DISTINCT start_station_name) AS count_start_station,
	COUNT(DISTINCT end_station_name) AS count_end_station
FROM
    divvy_tripdata_12_month;
-- 1766 start stations and 1779 end stations

-- 7. start station id and end station id 

-- count start and end stations 
SELECT
    COUNT(DISTINCT start_station_id) AS count_start_station_id,
	COUNT(DISTINCT end_station_id) AS count_end_station_id
FROM
    divvy_tripdata_12_month;
-- 1724 start station id and 1731 end station id

-- check for null values
SELECT 
	COUNT(*) - COUNT(start_station_id) AS null_count_start_id,
	COUNT(*) - COUNT(end_station_id) AS null_count_end_id
FROM 
	divvy_tripdata_12_month;
-- a total of 1079270 start station id and 1112056 end station id null values were found

-- 7. start lat/lng and end lat/lng

-- check for null values 
SELECT 
	COUNT(*) - COUNT(start_lat) AS null_count_start_lat,
	COUNT(*) - COUNT(start_lng) AS mull_count_start_lng,
	COUNT(*) - COUNT(end_lat) AS null_count_end_lat,
	COUNT(*) - COUNT(end_lng) AS null_count_end_lng
FROM 
	divvy_tripdata_12_month;
-- 7417 end lat null, 0 start lat null, 0 start lng null, 7417 end lng null #############

-- 8. member casual 

-- check for null value 
SELECT 
	COUNT(*) - COUNT(member_casual) AS null_count
FROM 
	divvy_tripdata_12_month;
-- no null values found 

-- check for member casual categories 
SELECT 
	member_casual
FROM 
	divvy_tripdata_12_month
GROUP BY 
	member_casual;
-- 2 categories were found, member and casual




 



