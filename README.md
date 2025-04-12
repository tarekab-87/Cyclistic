## Case Study: how does a bike-sharing navigate speedy success? 
**Company name: Cyclistic Bike-Share**

**Author: Tarek Abou Ismail**

**Date: 11/15/2024**

## 📝 Introducation 
Cyclistic Bike-Share, established in 2016, has become a prominent bike-sharing service in Chicago with a fleet of 5,824 GPS-enabled bicycles distributed across 692 stations. 

As a capstone project for the Google Data Analytics Professional Certificate, this case study combines the data analysis process—ask, prepare, process, analyze, share, and act in order to understand user behavior and address a critical business challenge: **converting casual riders into annual members**. Through this analysis, actionable insights and strategies are developed to maximize Cyclistic's growth and profitability.

## 💬 Background

**About the compnay**

Cyclistic, founded in 2016, has successfully grown its bike-sharing program into a network of 5,824 geotracked bicycles and 692 stations across Chicago, allowing users to rent bikes at one station and return them at another. 

Offering flexible pricing plans such as single-ride passes, full-day passes, and annual memberships, Cyclistic appeals to a diverse customer base, including those with disabilities through assistive bike options. 

While casual riders primarily opt for pay-per-use plans, Cyclistic's financial analysis reveals that annual members are significantly more profitable. To drive future growth, the company seeks to convert casual riders into loyal annual members by analyzing historical bike trip data to understand usage patterns, identify motivations, and develop targeted marketing strategies that leverage digital media.

## ⚙ Approach 

### 1. Ask / Business Objectives and Key Questions

**Business Task**

Design marketing strategies aimed at converting casual riders into annual members by understanding user behavior and preferences.

> **Guiding Questions**
>
> 1. How do annual members and casual riders use Cyclistic bikes differently?
> 2. What motivates casual riders to become annual members?
> 3. How can Cyclistic use digital media to influence this conversion?

**Stakeholders**
- Cyclistic management team
- Marketing department
- Financial analysts

### 2. Prepare

Data Overview

**Source**

The data was sourced from the Chicago Department of Transportation (CDOT) and is availabe under this  [divvy_tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html). The data was made available to public under the following [license](https://divvybikes.com/data-license-agreement). The dataset encompassing a 12-month period (November 2023 to October 2024). This structured dataset includes:
- Ride IDs
- Ride types
- Start and end times
- Station names and IDs
- User categories (casual or member)

**Data Integrity**

The data meets the ROCCC framework:
- Relevant: Directly supports the analysis objectives.
- Original: Provided by a reliable primary source.
- Comprehensive: Covers a full year of usage.
- Current: Up-to-date.
- Credible: Originates from a trusted authority.

**Tools**:
- Data cleaning and processing : Bigquery and PostgreSQL.
- Data visualization: Power BI and Tableau.


### 3. Data Processing and Cleaning

**Steps Taken:**
1. Data Exploration and Validation: Checked for missing values, duplicates, and formatting inconsistencies.
2. Data Consolidation: Combined 12 months of ride data into a single table.
3. New Variables: Created new columns for:
    - Start and end months
    - Day of the week
    - Ride length (in minutes)
5. Outlier Removal: Used interquartile range (IQR) to filter out anomalous ride lengths.
6. Final Dataset: Excluded rows with null values and retained clean, consistent data for analysis.

### 4. Analysis and Insights

1. Usage Patterns

![image](https://github.com/user-attachments/assets/d172d756-4f9e-4605-88b2-11b23545c011)
Total Rides: Casual riders accounted for 32.96% (1,295,966) of rides, while annual members contributed 67.04% (2,644,466).

2. User Perfernces in Terms of Rideable Type

![image](https://github.com/user-attachments/assets/b6d4e114-125c-4376-b33c-7dd63b762758)
The bar chart compares ride counts of members and casual riders based on the type of rideable type: classic bikes, electric bikes, and electric scooters.

Key observations:
Classic Bikes: Dominant choice for both groups, with members recording 1.73M rides and casual riders 0.79M rides.
Electric Bikes: Members used them more (0.88M) compared to casual riders (0.48M).
Electric Scooters: Negligible usage by both groups (0.02M each).

3. Average ride length (member vs. casual) for each category of rideable type

![image](https://github.com/user-attachments/assets/81970178-dfa6-410e-be60-695bb099e664)
The chart compares the average ride length (in minutes) for casual riders and members, categorized by rideable type: classic bikes, electric bikes, and electric scooters.

Key Observations:
Casual Riders: Classic bikes have the longest average ride time (14.4 minutes), Electric bikes follow at 11.4 minutes, and electric scooters are at 9.5 minutes.
Members: Classic bikes again have the longest average ride time (10.8 minutes), Electric bikes have a similar duration (9.5 minutes), and scooters are the shortest at 7.4 minutes.

4. Average rides per weekday

![image](https://github.com/user-attachments/assets/6c63fb8e-2911-4bbe-95fd-ac5fa259cc7b)
Casual Riders:
Weekends show the highest ride counts, with Saturday peaking at 4.9K rides, followed by Sunday at 4.0K. 
Weekdays have lower counts, with Monday to Thursday averaging around 2.7K to 3.6K rides.

Key obsrvation: Casual riders are more active on weekends, likely for leisure and recreational purposes.

![image](https://github.com/user-attachments/assets/ea3e2a08-0607-4625-a9a2-4d22ae28ab37)
Members:
Members show peak usage on weekdays, with Wednesday leading at 8.4K rides, followed by Thursday at 8.0K.
Weekend usage decreases significantly, with Sunday having the lowest count (5.3K).

Key observation: Members primarily use the service during weekdays, indicating commuting or routine trips.

5. Average rides per month

![image](https://github.com/user-attachments/assets/2b8a837d-fc07-4103-a1d1-7b5b18aaf673)
Casual riders peak during the summer months: July (16.0K), August (15.8K), and September (15.5K). Minimal activity during the winter months: January (1.4K) and February (2.8K).

Key observation: Casual riders are heavily influenced by seasonal trends, favoring warm weather for recreational use.

![image](https://github.com/user-attachments/assets/ad2f18aa-17d2-4a6a-9595-885a8b8e60f4)
Members show a steady increase in ride counts through the spring and summer months, peaking in August (25.8K), followed by July (25.0K) and September (24.6K). Lower activity is observed in the winter months, with the lowest in January (7.6K) and December (10.4K).

Key observation: Members maintain consistent use throughout the year, with peaks in warmer months. Even during low-activity months, members display higher engagement compared to casual riders.

6. Average Rides by Hour and Day of Week
   
![image](https://github.com/user-attachments/assets/911bb3ee-2f2d-436f-ae44-ae089af69a6e)
Casual Riders (Blue Line): Higher activity peaks during late morning and afternoon hours on weekends, reflecting recreational or leisure use.
Minimal activity during weekday commuting hours.

Members (Orange Line): Consistent peaks during weekday commuting hours, with sharp increases around 8 AM and 5 PM.
Lower activity during weekends compared to casual riders, indicating a focus on commuting rather than leisure.

Key observation: Members show predictable, work-oriented ride patterns, while casual riders are driven by leisure usage on weekends.

![image](https://github.com/user-attachments/assets/8fe0340b-60ea-43bc-b7b3-7f9af05e2946)
Top Routes for casual riders:

Streeter Dr & Grand Ave to Streeter Dr & Grand Ave: Most popular route with an average of 5.1K rides.
DuSable Lake Shore Dr & Monroe St to DuSable Lake Shore Dr & Monroe St: Second most popular with 4.6K rides.
DuSable Lake Shore Dr & Monroe St to Streeter Dr & Grand Ave: Ranks third with 4.3K rides.
Michigan Ave & Oak St to Michigan Ave & Oak St: Least popular among the top routes, averaging 2.2K rides.

Key observation: Casual riders tend to favor routes near iconic landmarks and recreational areas.
High-frequency loops suggest leisure trips or sightseeing activities.

![image](https://github.com/user-attachments/assets/b3a3c4ce-ef57-4ae3-af45-e7db7495dc13)
Top Routes for member riders:

State St & 33rd St to Calumet Ave & 33rd St: Most popular route with 5.9K rides.
Calumet Ave & 33rd St to State St & 33rd St: Close second with 5.8K rides.
Ellis Ave & 60th St to Ellis Ave & 55th St and University Ave & 57th St to Ellis Ave & 60th St: Both record 3.9K rides.
Ellis Ave & 55th St to Ellis Ave & 60th St: Slightly lower with 3.8K rides.
Loomis St & Lexington St to Morgan St & Polk St: Least popular among the top with 2.4K rides.

Key observation:Members heavily use routes near educational or institutional areas, suggesting commuting purposes.
High activity in specific areas indicates routine and practical use of bikes.

## 5. Share 

Similarities:
- Both casual riders and members prefer classic bikes over other bike types.
- Ride volumes peak during the summer months for both groups, showcasing seasonal trends.

Differences:
- Ride Frequency: Members ride more frequently compared to casual riders.
- Purpose of Use: Members use bikes mainly for commuting, reflected in weekday peaks. Casual riders prioritize leisure, with higher usage during weekends.
- Ride Duration: Casual riders have longer average ride durations (25 minutes vs. 15 minutes for members).
- Temporal Patterns: Members’ activity is consistent throughout the year, while casual riders exhibit strong seasonal variability, favoring warm months.

## 6. Act
Recommendations:

**Targeted Digital Marketing**
- Develop campaigns showcasing the cost-effectiveness of annual memberships compared to casual rides.
- Marketing campaigns and ads in high-traffic tourist areas to capture casual riders at peak times.
- Emphasize convenience and added value for frequent riders in promotional materials.

**Value-Driven Pricing Strategies**
- Offer trial memberships or limited-time discounts for casual riders to experience the benefits of annual memberships.
- Introduce tiered memberships to cater to users with moderate usage patterns, bridging the gap between casual and annual riders.

**Enhanced User Engagement**
- Implement loyalty programs for casual riders, rewarding them with discounts toward annual memberships.
- Use personalized email campaigns to highlight the number of rides and potential savings casual riders could achieve with a membership.

**Operational Enhancements**
- Increase the visibility of membership options at docking stations and within the mobile app interface.

## Conclusion

Cyclistic has significant opportunities to grow its annual membership base by leveraging insights into rider behavior. The seasonal and leisure-oriented usage patterns of casual riders contrast with members’ consistent, commuter-driven habits. By targeting casual riders with personalized digital campaigns, trial memberships, and loyalty rewards, Cyclistic can effectively convert this group into profitable annual members. Additionally, operational improvements and strategic pricing can further enhance user satisfaction and long-term engagement. These actions will position Cyclistic for sustainable growth and profitability in the competitive bike-sharing market.










