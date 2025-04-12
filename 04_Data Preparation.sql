CREATE TABLE divvy_tripdata_cleaned AS
WITH divvy_trip_formatted_data AS (
    SELECT DISTINCT ON (ride_id)
        ride_id,
        rideable_type,
        started_at,
        TO_CHAR(started_at, 'FMDay') AS started_on_week_day,
        EXTRACT(ISODOW FROM started_at)  AS started_week_day_num,
        TO_CHAR(started_at, 'FMMonth') AS started_month,
        EXTRACT(MONTH FROM started_at) AS started_month_num,
        ended_at,
        TO_CHAR(ended_at, 'FMDay') AS ended_on_week_day,
        EXTRACT(ISODOW FROM ended_at) AS ended_week_day_num,
        TO_CHAR(ended_at, 'FMMonth') AS ended_month,
        EXTRACT(MONTH FROM ended_at) AS ended_month_num,
        TRIM(start_station_name) AS start_station_name,
        start_station_id,
        end_station_id,
        TRIM(end_station_name) AS end_station_name,
        start_lat,
        start_lng,
        end_lat,
        end_lng,
        TRIM(member_casual) AS member_casual,
        ROUND((EXTRACT(EPOCH FROM (ended_at - started_at)) / 60), 2) AS ride_length_min
    FROM
        divvy_tripdata_12_month
    WHERE
        start_station_name IS NOT NULL
        AND end_station_name IS NOT NULL
        AND start_station_id IS NOT NULL
        AND end_station_id IS NOT NULL
        AND start_lat IS NOT NULL
        AND start_lng IS NOT NULL
        AND end_lat IS NOT NULL
        AND end_lng IS NOT NULL
        AND ended_at BETWEEN TIMESTAMP '2023-10-31' AND TIMESTAMP '2024-11-01'
        AND started_at < ended_at
		ORDER BY ride_id ASC
), 

q1_q3_table AS (
SELECT
        PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY ride_length_min) AS Q1,
        PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY ride_length_min) AS Q3
    FROM divvy_trip_formatted_data 
)
    
SELECT *
FROM divvy_trip_formatted_data CROSS JOIN q1_q3_table 
WHERE ride_length_min BETWEEN (Q1 - 1.5 * (Q3 - Q1)) AND (Q3 + 1.5 * (Q3 - Q1));

