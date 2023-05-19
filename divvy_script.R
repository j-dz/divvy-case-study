library(tidyverse)  #helps wrangle data
library(lubridate)  #helps wrangle date attributes
library(ggplot2)  #helps visualize data
getwd()
setwd("~/Desktop/Coursera/divvy_trip_data/xlsx")

# Upload Divvy datasets (xlsx files) here

may_2022 <- read_xlsx("202205-divvy-tripdata.xlsx")
june_2022 <- read_xlsx("202206-divvy-tripdata.xlsx")
july_2022 <- read_xlsx("202207-divvy-tripdata.xlsx")
aug_2022 <- read_xlsx("202208-divvy-tripdata.xlsx")
sept_2022 <- read_xlsx("202209-divvy-tripdata.xlsx")
oct_2022 <- read_xlsx("202210-divvy-tripdata.xlsx")
nov_2022 <- read_xlsx("202211-divvy-tripdata.xlsx")
dec_2022 <- read_xlsx("202212-divvy-tripdata.xlsx")
jan_2023 <- read_xlsx("202301-divvy-tripdata.xlsx")
feb_2023 <- read_xlsx("202302-divvy-tripdata.xlsx")
mar_2023 <- read_xlsx("202303-divvy-tripdata.xlsx")
apr_2023 <- read_xlsx("202304-divvy-tripdata.xlsx")

# Compare column names each of the files

colnames(may_2022)
colnames(june_2022)
colnames(july_2022)
colnames(aug_2022)
colnames(sept_2022)
colnames(oct_2022)
colnames(nov_2022)
colnames(dec_2022)
colnames(jan_2023)
colnames(feb_2023)
colnames(mar_2023)
colnames(apr_2023)


# Inspect the dataframes and look for incongruencies
str(may_2022)
str(june_2022)
str(july_2022)
str(aug_2022)
str(sept_2022)
str(oct_2022)
str(nov_2022)
str(dec_2022)
str(jan_2023)
str(feb_2023)
str(mar_2023)
str(apr_2023)

# Convert ride_id and rideable_type to character so that they can stack correctly
may_2022 <-  mutate(may_2022, ride_id = as.character(ride_id)
                   ,rideable_type = as.character(rideable_type)) 
june_2022 <-  mutate(june_2022, ride_id = as.character(ride_id)
                   ,rideable_type = as.character(rideable_type)) 
july_2022 <-  mutate(july_2022, ride_id = as.character(ride_id)
                   ,rideable_type = as.character(rideable_type))
aug_2022 <-  mutate(aug_2022, ride_id = as.character(ride_id)
                   ,rideable_type = as.character(rideable_type)) 
sept_2022 <-  mutate(sept_2022, ride_id = as.character(ride_id)
                   ,rideable_type = as.character(rideable_type)) 
oct_2022 <-  mutate(oct_2022, ride_id = as.character(ride_id)
                   ,rideable_type = as.character(rideable_type)) 
nov_2022 <-  mutate(nov_2022, ride_id = as.character(ride_id)
                   ,rideable_type = as.character(rideable_type)) 
dec_2022 <-  mutate(dec_2022, ride_id = as.character(ride_id)
                   ,rideable_type = as.character(rideable_type)) 
jan_2023 <-  mutate(jan_2023, ride_id = as.character(ride_id)
                   ,rideable_type = as.character(rideable_type)) 
feb_2023 <-  mutate(feb_2023, ride_id = as.character(ride_id)
                   ,rideable_type = as.character(rideable_type)) 
mar_2023 <-  mutate(mar_2023, ride_id = as.character(ride_id)
                   ,rideable_type = as.character(rideable_type)) 
apr_2023 <-  mutate(apr_2023, ride_id = as.character(ride_id)
                   ,rideable_type = as.character(rideable_type)) 

# Stack individual month's data frames into one big data frame
all_trips <- bind_rows(may_2022, june_2022, july_2022, aug_2022, sept_2022, oct_2022, nov_2022, dec_2022, jan_2023, feb_2023, mar_2023, apr_2023)

## Error: Can't combine `..1$end_station_id` <character> and `..5$end_station_id` <double>.
# Thus, both ‘start_station_id’ and ‘end_station_id’ were mutated to fix the error.

may_2022 <- mutate(may_2022, start_station_id = as.character(start_station_id) ,
                   end_station_id = as.character(end_station_id))
june_2022 <- mutate(june_2022, start_station_id = as.character(start_station_id) ,
                   end_station_id = as.character(end_station_id))
july_2022 <- mutate(july_2022, start_station_id = as.character(start_station_id) ,
                   end_station_id = as.character(end_station_id))
aug_2022 <- mutate(aug_2022, start_station_id = as.character(start_station_id) ,
                   end_station_id = as.character(end_station_id))
sept_2022 <- mutate(sept_2022, start_station_id = as.character(start_station_id) ,
                   end_station_id = as.character(end_station_id))
oct_2022 <- mutate(oct_2022, start_station_id = as.character(start_station_id) ,
                   end_station_id = as.character(end_station_id))
nov_2022 <- mutate(nov_2022, start_station_id = as.character(start_station_id) ,
                   end_station_id = as.character(end_station_id))
dec_2022 <- mutate(dec_2022, start_station_id = as.character(start_station_id) ,
                   end_station_id = as.character(end_station_id))
jan_2023 <- mutate(jan_2023, start_station_id = as.character(start_station_id) ,
                   end_station_id = as.character(end_station_id))
feb_2023 <- mutate(feb_2023, start_station_id = as.character(start_station_id) ,
                   end_station_id = as.character(end_station_id))
mar_2023 <- mutate(mar_2023, start_station_id = as.character(start_station_id) ,
                   end_station_id = as.character(end_station_id))
apr_2023 <- mutate(apr_2023, start_station_id = as.character(start_station_id) ,
                   end_station_id = as.character(end_station_id))

# Re-run the previous code. Stack individual month's data frames into one big data frame.

all_trips <- bind_rows(may_2022, june_2022, july_2022, aug_2022, sept_2022, oct_2022, nov_2022, dec_2022, jan_2023, feb_2023, mar_2023, apr_2023)

# Errors were confirmed to be fixed by the successful join of all dataframes into the new aggregate dataframe ‘all_trips’

## DO NOT DO THIS NEXT STEP IF YOU PLAN ON MAPPING
# Delete unnecessary observations to improve efficiency during analysis.
# Remove start_lat, start_lng, end_lat, end_lng.

all_trips <- all_trips %>% 
        select(-c(start_lat, start_lng, end_lat, end_lng))

# CHECKPOINT
# This step is done to save progress and add checkpoints
save(all_trips, file = "all_trips.RData")

#======================================================
# STEP 3: CLEAN UP AND ADD DATA TO PREPARE FOR ANALYSIS
#======================================================
# Inspect the new table that has been created
colnames(all_trips)  #List of column names
nrow(all_trips)  #How many rows are in data frame?
dim(all_trips)  #Dimensions of the data frame?
head(all_trips)  #See the first 6 rows of data frame.  Also tail(all_trips)
str(all_trips)  #See list of columns and data types (numeric, character, etc)
summary(all_trips)  #Statistical summary of data. Mainly for numerics

# There are a few problems we will need to fix:
# (1) The data can only be aggregated at the ride-level, which is too granular. We will want to add some additional columns of data -- such as day, month, year -- that provide additional opportunities to aggregate the data.
# (2) We will want to add a calculated field for length of ride since the data does not have the "tripduration" column. We will add "ride_length" to the entire dataframe for consistency.
# (3) There are some rides where tripduration shows up as negative, including several hundred rides where Divvy took bikes out of circulation for Quality Control reasons. We will want to delete these rides.


# (1)
# Add columns that list the date, month, day, and year of each ride
# This will allow us to aggregate ride data for each month, day, or year ... before completing these operations we could only aggregate at the ride level
all_trips$date <- as.Date(all_trips$started_at) #The default format is yyyy-mm-dd
all_trips$month <- format(as.Date(all_trips$date), "%m")
all_trips$day <- format(as.Date(all_trips$date), "%d")
all_trips$year <- format(as.Date(all_trips$date), "%Y")
all_trips$day_of_week <- format(as.Date(all_trips$date), "%A")

# (2)
# Add a "ride_length" calculation to all_trips (in seconds)
all_trips$ride_length <- difftime(all_trips$ended_at,all_trips$started_at)

# Inspect the structure of the columns
str(all_trips)

# Convert "ride_length" from Factor to numeric so we can run calculations on the data
is.factor(all_trips$ride_length)
all_trips$ride_length <- as.numeric(as.character(all_trips$ride_length))
is.numeric(all_trips$ride_length)

# (3)
# Remove "bad" data
# The dataframe includes a few hundred entries when bikes were taken out of docks and checked for quality by Divvy or ride_length was negative
# We will create a new version of the dataframe (v2) since data is being removed

all_trips_v2 <- all_trips[!(all_trips$start_station_name == "HQ QR" | all_trips$ride_length<0),]

# Filter rows that contain duplicate values

all_trips_v2 <- all_trips_v2 %>% distinct()

# CHECKPOINT
# This step is done to save progress and add checkpoints
save(all_trips_v2, file = "all_trips_v2.RData")

#=====================================
# STEP 4: CONDUCT DESCRIPTIVE ANALYSIS
#=====================================
# Descriptive analysis on ride_length (all figures in seconds)
mean(all_trips_v2$ride_length) #straight average (total ride length / rides)
median(all_trips_v2$ride_length) #midpoint number in the ascending array of ride lengths
max(all_trips_v2$ride_length) #longest ride
min(all_trips_v2$ride_length) #shortest ride

# You can condense the four lines above to one line using summary() on the specific attribute
summary(all_trips_v2$ride_length)

# Compare members and casual users
aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = mean)
aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = median)
aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = max)
aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = min)

# See the average ride time by each day for members vs casual users
aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual + all_trips_v2$day_of_week, FUN = mean)

# Notice that the days of the week are out of order. Let's fix that.
all_trips_v2$day_of_week <- ordered(all_trips_v2$day_of_week, levels=c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"))

# Now, let's run the average ride time by each day for members vs casual users
aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual + all_trips_v2$day_of_week, FUN = mean)

# analyze ridership data by type and weekday
all_trips_v2 %>% 
        mutate(weekday = wday(started_at, label = TRUE)) %>%  #creates weekday field using wday()
        group_by(member_casual, weekday) %>%  #groups by usertype and weekday
        summarise(number_of_rides = n()							#calculates the number of rides and average duration 
                  ,average_duration = mean(ride_length)) %>% 		# calculates the average duration
        arrange(member_casual, weekday)								# sorts

# Let's visualize the number of rides by rider type
all_trips_v2 %>% 
        mutate(weekday = wday(started_at, label = TRUE)) %>% 
        group_by(member_casual, weekday) %>% 
        summarise(number_of_rides = n()
                  ,average_duration = mean(ride_length)) %>% 
        arrange(member_casual, weekday)  %>% 
        ggplot(aes(x = weekday, y = number_of_rides, fill = member_casual)) +
        geom_col(position = "dodge")


# Let's create a visualization for average duration
all_trips_v2 %>% 
        mutate(weekday = wday(started_at, label = TRUE)) %>% 
        group_by(member_casual, weekday) %>% 
        summarise(number_of_rides = n()
                  ,average_duration = mean(ride_length)) %>% 
        arrange(member_casual, weekday)  %>% 
        ggplot(aes(x = weekday, y = average_duration, fill = member_casual)) +
        geom_col(position = "dodge")

#=================================================
# STEP 5: EXPORT SUMMARY FILE FOR FURTHER ANALYSIS
#=================================================
# Create a csv file that we will visualize in Excel, Tableau, or my presentation software
write.csv(all_trips_v2, file = '~/Desktop/Coursera/divvy_trip_data/xlsx/all_trips_v2.csv')

#You're done! Congratulations!


