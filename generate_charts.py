import os

import matplotlib.pyplot as plt
import pandas as pd
import seaborn as sns

# Ensure the directory for saving charts exists
os.makedirs('charts', exist_ok=True)

# Sample data mimicking SQL output:
# For each day of the week, we have total rides split by member and casual rider types.
data = {
    'day_of_week': ['Monday', 'Monday', 'Tuesday', 'Tuesday', 'Wednesday', 'Wednesday',
                    'Thursday', 'Thursday', 'Friday', 'Friday', 'Saturday', 'Saturday', 'Sunday', 'Sunday'],
    'member_casual': ['Member', 'Casual'] * 7,
    'total_rides': [50000, 30000, 55000, 32000, 60000, 35000, 62000, 36000, 70000, 40000, 80000, 45000, 75000, 42000]
}

df = pd.DataFrame(data)

# Set the order for days of the week for logical plotting:
day_order = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']
df['day_of_week'] = pd.Categorical(df['day_of_week'], categories=day_order, ordered=True)
df = df.sort_values('day_of_week')

# Create a figure and generate a grouped bar chart using seaborn
plt.figure(figsize=(10, 6))
sns.barplot(x='day_of_week', y='total_rides', hue='member_casual', data=df, palette='Paired')
plt.title('Total Rides by Day of Week: Member vs Casual')
plt.xlabel('Day of Week')
plt.ylabel('Number of Rides')
plt.legend(title='Customer Type')
plt.tight_layout()

# Save the chart as a PNG file in the 'charts' folder
plt.savefig('charts/rides_by_day.png', format='png', dpi=300)
plt.show()


# --- Chart 2: User Preferences by Rideable Type ---

# Sample data for rideable type preferences
rideable_data = {
    'rideable_type': ['Classic Bike', 'Classic Bike', 'Electric Bike', 'Electric Bike', 'Electric Scooter', 'Electric Scooter'],
    'member_casual': ['Member', 'Casual'] * 3,
    'total_rides': [1730000, 790000, 880000, 480000, 20000, 20000]
}

df_rideable = pd.DataFrame(rideable_data)

plt.figure(figsize=(8, 6))
sns.barplot(x='rideable_type', y='total_rides', hue='member_casual', data=df_rideable, palette='Set2')
plt.title('Total Rides by Rideable Type: Member vs Casual')
plt.xlabel('Rideable Type')
plt.ylabel('Number of Rides')
plt.legend(title='Customer Type')
plt.tight_layout()

plt.savefig('charts/rides_by_rideable_type.png', format='png', dpi=300)
plt.show()


# --- Chart 3: Average Ride Length by Rideable Type ---

# Sample data for average ride lengths in minutes
ride_length_data = {
    'rideable_type': ['Classic Bike', 'Classic Bike', 'Electric Bike', 'Electric Bike', 'Electric Scooter', 'Electric Scooter'],
    'member_casual': ['Member', 'Casual'] * 3,
    'avg_ride_length': [10.8, 14.4, 9.5, 11.4, 7.4, 9.5]
}

df_length = pd.DataFrame(ride_length_data)

plt.figure(figsize=(8, 6))
sns.barplot(x='rideable_type', y='avg_ride_length', hue='member_casual', data=df_length, palette='Set1')
plt.title('Average Ride Length by Rideable Type')
plt.xlabel('Rideable Type')
plt.ylabel('Average Ride Length (minutes)')
plt.legend(title='Customer Type')
plt.tight_layout()

plt.savefig('charts/avg_ride_length_by_type.png', format='png', dpi=300)
plt.show()


# Sample data: average ride length in minutes by rideable type
data2 = {
    'rideable_type': ['Classic Bike', 'Classic Bike', 'Electric Bike', 'Electric Bike', 'Scooter', 'Scooter'],
    'member_casual': ['Member', 'Casual'] * 3,
    'avg_duration': [10.8, 14.4, 9.5, 11.4, 7.4, 9.5]
}

df2 = pd.DataFrame(data2)

plt.figure(figsize=(10, 6))
sns.barplot(x='rideable_type', y='avg_duration', hue='member_casual', data=df2, palette='Set2')
plt.title('Average Ride Length by Rideable Type')
plt.xlabel('Rideable Type')
plt.ylabel('Average Duration (minutes)')
plt.legend(title='Customer Type')
plt.tight_layout()

# Save the chart
plt.savefig('charts/avg_ride_length_by_type.png', format='png', dpi=300)
plt.show()

# --- Chart 4: Average Rides per Month ---

# Sample data for rides per month (in thousands)
month_data = {
    'month': ['Jan', 'Jan', 'Feb', 'Feb', 'Mar', 'Mar', 'Apr', 'Apr', 'May', 'May',
              'Jun', 'Jun', 'Jul', 'Jul', 'Aug', 'Aug', 'Sep', 'Sep', 'Oct', 'Oct', 'Nov', 'Nov', 'Dec', 'Dec'],
    'member_casual': ['Member', 'Casual'] * 12,
    'average_rides': [7600, 1400, 9200, 2800, 14200, 6400, 17400, 8800,
                      21200, 11800, 23800, 14400, 25000, 16000, 25800, 15800,
                      24600, 15500, 22600, 12600, 17800, 8800, 10400, 4800]
}

df_month = pd.DataFrame(month_data)

# Define month order
month_order = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
               'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
df_month['month'] = pd.Categorical(df_month['month'], categories=month_order, ordered=True)
df_month = df_month.sort_values('month')

plt.figure(figsize=(12, 6))
sns.lineplot(x='month', y='average_rides', hue='member_casual', data=df_month, marker='o')
plt.title('Average Rides per Month: Member vs Casual')
plt.xlabel('Month')
plt.ylabel('Average Number of Rides')
plt.legend(title='Customer Type')
plt.tight_layout()

plt.savefig('charts/avg_rides_per_month.png', format='png', dpi=300)
plt.show()


# --- Chart 5: Top Routes for Casual Riders ---

# Sample data for top routes used by casual riders
top_casual_routes = {
    'route': [
        'Streeter Dr & Grand Ave ↔ Streeter Dr & Grand Ave',
        'DuSable Lake Shore Dr & Monroe St ↔ DuSable Lake Shore Dr & Monroe St',
        'DuSable Lake Shore Dr & Monroe St → Streeter Dr & Grand Ave',
        'Michigan Ave & Oak St ↔ Michigan Ave & Oak St'
    ],
    'average_rides': [5100, 4600, 4300, 2200]
}

df_casual_routes = pd.DataFrame(top_casual_routes)

plt.figure(figsize=(10, 6))
sns.barplot(x='average_rides', y='route', data=df_casual_routes, palette='Blues_d')
plt.title('Top Routes - Casual Riders')
plt.xlabel('Average Number of Rides')
plt.ylabel('Route')
plt.tight_layout()

plt.savefig('charts/top_routes_casual.png', format='png', dpi=300)
plt.show()


# --- Chart 6: Top Routes for Member Riders ---

# Sample data for top routes used by members
top_member_routes = {
    'route': [
        'State St & 33rd St → Calumet Ave & 33rd St',
        'Calumet Ave & 33rd St → State St & 33rd St',
        'Ellis Ave & 60th St → Ellis Ave & 55th St',
        'University Ave & 57th St → Ellis Ave & 60th St',
        'Ellis Ave & 55th St → Ellis Ave & 60th St',
        'Loomis St & Lexington St → Morgan St & Polk St'
    ],
    'average_rides': [5900, 5800, 3900, 3900, 3800, 2400]
}

df_member_routes = pd.DataFrame(top_member_routes)

plt.figure(figsize=(10, 6))
sns.barplot(x='average_rides', y='route', data=df_member_routes, palette='Greens_d')
plt.title('Top Routes - Member Riders')
plt.xlabel('Average Number of Rides')
plt.ylabel('Route')
plt.tight_layout()

plt.savefig('charts/top_routes_member.png', format='png', dpi=300)
plt.show()


# --- Chart 7: Average Rides by Hour and Day of Week ---

# Sample data showing ride activity by hour (0–23) for members and casual riders
hourly_data = {
    'hour': list(range(24)) * 2,
    'member_casual': ['Member'] * 24 + ['Casual'] * 24,
    'average_rides': [
        # Member data
        300, 200, 150, 100, 90, 150, 300, 700, 1200, 1300, 1100, 1000,
        950, 900, 850, 800, 950, 1400, 1600, 1200, 700, 500, 400, 350,
        # Casual data
        100, 80, 60, 50, 50, 60, 120, 300, 700, 1000, 1300, 1600,
        1700, 1800, 1900, 2000, 1900, 1800, 1600, 1200, 900, 600, 400, 200
    ]
}

df_hourly = pd.DataFrame(hourly_data)

plt.figure(figsize=(12, 6))
sns.lineplot(data=df_hourly, x='hour', y='average_rides', hue='member_casual', marker='o')
plt.title('Average Rides by Hour and Day of Week: Member vs Casual')
plt.xlabel('Hour of Day')
plt.ylabel('Average Number of Rides')
plt.xticks(range(0, 24))
plt.legend(title='Customer Type')
plt.tight_layout()

plt.savefig('charts/avg_rides_by_hour.png', format='png', dpi=300)
plt.show()
# --- Chart 8: Average Ride Length by Hour and Day of Week ---

# --- Chart 7: Top Routes ---

# Sample data for top routes
top_routes_data = {
    'route': [
        'Streeter ↔ Grand', 'Monroe ↔ Monroe', 'Monroe → Grand', 'Michigan ↔ Oak', 'State ↔ Calumet',
        'Calumet ↔ State', 'Ellis 60th → Ellis 55th', 'Univ 57th → Ellis 60th', 'Ellis 55th → Ellis 60th',
        'Loomis → Morgan'
    ],
    'member_casual': ['Casual', 'Casual', 'Casual', 'Casual', 'Member',
                      'Member', 'Member', 'Member', 'Member', 'Member'],
    'ride_count': [5100, 4600, 4300, 2200, 5900, 5800, 3900, 3900, 3800, 2400]
}

df_routes = pd.DataFrame(top_routes_data)

plt.figure(figsize=(12, 6))
sns.barplot(x='route', y='ride_count', hue='member_casual', data=df_routes, palette='Set3')
plt.title('Top Routes: Member vs Casual Riders')
plt.xlabel('Route')
plt.ylabel('Number of Rides')
plt.xticks(rotation=45, ha='right')
plt.legend(title='Customer Type')
plt.tight_layout()

plt.savefig('charts/top_routes.png', format='png', dpi=300)
plt.show()
