-- total rides per member_casual 
SELECT 
	member_casual,
	COUNT(*) AS ride_count,
	ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM divvy_tripdata_cleaned),2) AS percentage
FROM
	divvy_tripdata_cleaned
GROUP BY
	member_casual;

-- OR -- 
  
SELECT
	member_casual,
	COUNT(*) AS ride_count,
	ROUND((COUNT(*) * 100.0 / SUM(COUNT(*)) OVER ()),2) AS percentage
FROM
	divvy_tripdata_cleaned
GROUP BY 
	member_casual;
##########################################

-- rideable type per member_casual
SELECT
	member_casual,
	rideable_type,
	COUNT(*) AS ride_count,
	ROUND((COUNT(*) * 100.0 / SUM(COUNT(*)) OVER()),2) AS percentage
FROM
	divvy_tripdata_cleaned
GROUP BY	
	member_casual, rideable_type;
##########################################

-- average ride length per category of member casual
SELECT
	member_casual,
	rideable_type,
	ROUND(AVG(ride_length_min),2) AS avg_ride_length
FROM
	divvy_tripdata_cleaned
GROUP BY 
	member_casual, rideable_type;
##########################################

-- average rides per week day
SELECT
	member_casual,
	started_on_week_day,
	started_week_day_num,
	COUNT(*) AS ride_count,
	COUNT(*) / 53 AS average_rides
FROM
	divvy_tripdata_cleaned
GROUP BY 
	member_casual, started_on_week_day, started_week_day_num
ORDER BY
	started_week_day_num;
	
-- OR --
WITH week_count AS(
		SELECT COUNT(DISTINCT DATE_TRUNC('week', started_at)) AS total_weeks
		FROM divvy_tripdata_cleaned
		)
SELECT
	member_casual,
	started_on_week_day,
	COUNT(*) AS ride_count,
	COUNT(*) / (SELECT total_weeks FROM week_count)
FROM 
	divvy_tripdata_cleaned
GROUP BY
	member_casual, started_on_week_day;
##########################################

-- average rides per month 
SELECT
	member_casual,
	started_month,
	started_month_num,
	COUNT(*) AS ride_count,
	COUNT(*) / 12 AS avg_rides
FROM
	divvy_tripdata_cleaned
GROUP BY
	member_casual, started_month, started_month_num
ORDER BY
	started_month_num ASC;
##########################################

-- average rides per hour of week day
SELECT
	member_casual,
	started_on_week_day,
	started_week_day_num,
	EXTRACT(HOUR FROM started_at) AS day_hour,
	COUNT(*) AS ride_count,
	COUNT(*) / COUNT(DISTINCT DATE(started_at)) AS average_ride_per_hour 
FROM
	divvy_tripdata_cleaned
GROUP BY 
	member_casual, started_on_week_day, started_week_day_num, day_hour
ORDER BY member_casual, started_week_day_num, day_hour ASC;

-- OR --

SELECT
	member_casual,
	started_on_week_day,
	started_week_day_num,
	EXTRACT(HOUR FROM started_at) AS day_hour,
	COUNT(*) AS ride_count,
	COUNT(*) / 53 AS average_rides
FROM
	divvy_tripdata_cleaned
GROUP BY 
	member_casual, started_on_week_day, started_week_day_num, day_hour
ORDER BY member_casual, started_week_day_num, day_hour ASC;

-- most frequent routs
SELECT
	member_casual,
	CONCAT(start_station_name, ' to ', end_station_name) AS rout,
	COUNT(*) AS ride_count
FROM 
	divvy_tripdata_cleaned
GROUP BY
	member_casual, rout
ORDER BY
	ride_count DESC
LIMIT 12;


