# Divvy Bike-Share Case Study
<!-- wp:image {"id":391,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://diaz.ai/wp-content/uploads/2023/05/240432654_177835427774818_7433755138914452064_n-1024x427.png" alt="" class="wp-image-391"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>In this case study, I analyze historical data from <a href="https://en.wikipedia.org/wiki/Divvy" data-type="URL" data-id="https://en.wikipedia.org/wiki/Divvy">Divvy</a>, a bicycle-sharing system in the Chicago metropolitan area, in order to identify trends in how their customers use bikes differently. The tools I use are spreadsheets, R and Tableau.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This case study served as my capstone project for the <a href="https://www.coursera.org/professional-certificates/google-data-analytics" data-type="URL" data-id="https://www.coursera.org/professional-certificates/google-data-analytics">Google Data Analytics Professional Certificate</a> course - an eight-part professional certificate program in data analytics offered by Google through Coursera.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Throughout this case study, I performed numerous real-world tasks of a junior data analyst, including:</p>
<!-- /wp:paragraph -->

<!-- wp:list -->
<ul><!-- wp:list-item -->
<li>Documentation,</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Data collection,</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Data cleaning and manipulation,</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Preparing data for analysis,</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Analysis, and</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Visualization.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p>I outline each step in the process in detail below.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p></p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":3} -->
<h3 class="wp-block-heading" id="background">Background</h3>
<!-- /wp:heading -->

<!-- wp:image {"id":393,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://diaz.ai/wp-content/uploads/2023/05/divvy_bikes-1468524609-7087-1-1024x576.jpg" alt="" class="wp-image-393"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>Launched in 2013, Divvy is a bicycle-sharing system in the Chicago metropolitan area that provides a convenient and affordable way for residents and visitors to get around the city using bicycles. It is operated by the Chicago Department of Transportation (CDOT) in partnership with Lyft.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Divvy features a network of docking stations located throughout Chicago, where users can rent and return bicycles. The system consists of sturdy, specially designed bikes that are available for short-term use. Users can access the bikes by purchasing a pass or membership, which allows them to unlock a bike from any available docking station and ride it to their desired destination.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Divvy offers various pass options, including single-ride, day pass, and annual membership. Once a pass or membership is obtained, users can check out a bike from any station, ride it for a specified duration, and return it to any available docking station in the system.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The program has been popular among commuters, tourists, and residents alike, as it provides an eco-friendly and convenient transportation option for short trips around the city. Divvy has expanded its bike network and continues to play a significant role in promoting sustainable transportation and reducing traffic congestion in Chicago.</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":3} -->
<h3 class="wp-block-heading">Business task</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The case study business task is as follows:</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>How do annual members and casual riders use Divvy bikes differently?</strong></p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":3} -->
<h3 class="wp-block-heading">Collecting the data</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>We’ll be using Divvy’s historical bike trip data from the last 12 months, which is publicly available <a href="https://divvy-tripdata.s3.amazonaws.com/index.html" data-type="URL" data-id="https://divvy-tripdata.s3.amazonaws.com/index.html">here</a>.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The data is made available under this <a href="https://ride.divvybikes.com/data-license-agreement">license</a> by Lyft Bikes and Scooters, LLC, which operates the City of Chicago’s Divvy bicycle-sharing service. The data is stored in spreadsheets. There are 12 .CSV files in total:</p>
<!-- /wp:paragraph -->

<!-- wp:code {"lineNumbers":false} -->
<pre class="wp-block-code"><code lang="markup" class="language-markup">2022-05_divvy_trip-data.csv

2022-06_divvy_trip-data.csv

2022-07_divvy_trip-data.csv

2022-08_divvy_trip-data.csv

2022-09_divvy_trip-data.csv

2022-10_divvy_trip-data.csv

2022-11_divvy_trip-data.csv

2022-12_divvy_trip-data.csv

2023-01_divvy_trip-data.csv

2023-02_divvy_trip-data.csv

2023-03_divvy_trip-data.csv

2023-04_divvy_trip-data.csv</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":3} -->
<h3 class="wp-block-heading">Data cleaning and manipulation</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>First, let's begin by manipulating the spreadsheets as follows:</p>
<!-- /wp:paragraph -->

<!-- wp:list {"ordered":true} -->
<ol><!-- wp:list-item -->
<li>Unzip the files.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Create a folder on our desktop to house the files, using appropriate file-naming conventions. For example, "<strong>divvy_data</strong>".</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Create subfolders with "<strong>divvy_data</strong>" for the .CSV files so that we have a copy of the original data. Name one of the folders "<strong>raw</strong>" - this will house our original, raw data.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Move the downloaded files to the "<strong>raw</strong>" subfolder.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Launch Excel, open each file, and chose to Save As an Excel Workbook file. Put these .XLSX files in a new subfolder for .XLSX files. Name this subfolder "<strong>xlsx</strong>".</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Open each spreadsheet and create a column called “<strong>ride_length</strong>.” Calculate the length of each ride by subtracting the column “<strong>started_at</strong>” from the column “<strong>ended_at</strong>” (for example, =D2-C2) and format as <strong>HH:MM:SS</strong> using <strong>Format &gt; Cells &gt; Time &gt; 37:30:55.</strong></li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Create a column called “<strong>day_of_week</strong>,” and calculate the day of the week that each ride started using the “<strong>WEEKDAY</strong>” command (for example, =WEEKDAY(C2,1)) in each file. Formated the cell as "<strong>General</strong>" (or as a number with no decimals), noting that 1 = Sunday and 7 = Saturday.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
<h3 class="wp-block-heading">Prepare data for analysis on R</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Now that our data is stored appropriately, we will start putting it to work using R.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>First, open R Studio, create a new R script, and set up the R environment by loading the following key packages.</p>
<!-- /wp:paragraph -->

<!-- wp:code {"backgroundColor":"foreground","textColor":"background","fontSize":"small","lineNumbers":true} -->
<pre class="wp-block-code has-background-color has-foreground-background-color has-text-color has-background has-small-font-size"><code lang="c" class="language-c line-numbers">library(tidyverse)  #helps wrangle data
library(lubridate)  #helps wrangle date attributes
library(ggplot2)  #helps visualize data</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Import data</h4>
<!-- /wp:heading -->

<!-- wp:code {"style":{"border":{"width":"1px"}},"backgroundColor":"foreground","textColor":"background","fontSize":"small","lineNumbers":true} -->
<pre class="wp-block-code has-background-color has-foreground-background-color has-text-color has-background has-small-font-size" style="border-width:1px"><code lang="c" class="language-c line-numbers"># Upload Divvy datasets (xlsx files) here

may_2022 &lt;- read_xlsx("202205-divvy-tripdata.xlsx")
june_2022 &lt;- read_xlsx("202206-divvy-tripdata.xlsx")
july_2022 &lt;- read_xlsx("202207-divvy-tripdata.xlsx")
aug_2022 &lt;- read_xlsx("202208-divvy-tripdata.xlsx")
sept_2022 &lt;- read_xlsx("202209-divvy-tripdata.xlsx")
oct_2022 &lt;- read_xlsx("202210-divvy-tripdata.xlsx")
nov_2022 &lt;- read_xlsx("202211-divvy-tripdata.xlsx")
dec_2022 &lt;- read_xlsx("202212-divvy-tripdata.xlsx")
jan_2023 &lt;- read_xlsx("202301-divvy-tripdata.xlsx")
feb_2023 &lt;- read_xlsx("202302-divvy-tripdata.xlsx")
mar_2023 &lt;- read_xlsx("202303-divvy-tripdata.xlsx")
apr_2023 &lt;- read_xlsx("202304-divvy-tripdata.xlsx")</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Make columns consistent and merge them into a single data frame</h4>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Now that our data has been imported into R, we need to ensure that the new data frames have uniform column names prior to merging them into a single data frame.</p>
<!-- /wp:paragraph -->

<!-- wp:code {"style":{"border":{"width":"1px"}},"backgroundColor":"foreground","textColor":"background","fontSize":"small","lineNumbers":true} -->
<pre class="wp-block-code has-background-color has-foreground-background-color has-text-color has-background has-small-font-size" style="border-width:1px"><code lang="c" class="language-c line-numbers"># Compare column names each of the files

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

# Inspect the data frames and look for incongruencies

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
str(apr_2023)</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Next, we will convert the <strong>ride_id</strong> and <strong>rideable_type</strong> columns to string types.</p>
<!-- /wp:paragraph -->

<!-- wp:code {"style":{"border":{"width":"1px"}},"backgroundColor":"foreground","textColor":"background","fontSize":"small","lineNumbers":true} -->
<pre class="wp-block-code has-background-color has-foreground-background-color has-text-color has-background has-small-font-size" style="border-width:1px"><code lang="c" class="language-c line-numbers"># Convert ride_id and rideable_type to character strings so that they can stack correctly

may_2022 &lt;-  mutate(may_2022, ride_id = as.character(ride_id)
                   ,rideable_type = as.character(rideable_type))
june_2022 &lt;-  mutate(june_2022, ride_id = as.character(ride_id)
                   ,rideable_type = as.character(rideable_type))
july_2022 &lt;-  mutate(july_2022, ride_id = as.character(ride_id)
                   ,rideable_type = as.character(rideable_type))
aug_2022 &lt;-  mutate(aug_2022, ride_id = as.character(ride_id)
                   ,rideable_type = as.character(rideable_type))
sept_2022 &lt;-  mutate(sept_2022, ride_id = as.character(ride_id)
                   ,rideable_type = as.character(rideable_type))
oct_2022 &lt;-  mutate(oct_2022, ride_id = as.character(ride_id)
                   ,rideable_type = as.character(rideable_type))
nov_2022 &lt;-  mutate(nov_2022, ride_id = as.character(ride_id)
                   ,rideable_type = as.character(rideable_type))
dec_2022 &lt;-  mutate(dec_2022, ride_id = as.character(ride_id)
                   ,rideable_type = as.character(rideable_type))
jan_2023 &lt;-  mutate(jan_2023, ride_id = as.character(ride_id)
                   ,rideable_type = as.character(rideable_type))
feb_2023 &lt;-  mutate(feb_2023, ride_id = as.character(ride_id)
                   ,rideable_type = as.character(rideable_type))
mar_2023 &lt;-  mutate(mar_2023, ride_id = as.character(ride_id)
                   ,rideable_type = as.character(rideable_type))
apr_2023 &lt;-  mutate(apr_2023, ride_id = as.character(ride_id)
                   ,rideable_type = as.character(rideable_type))</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Now, we can go ahead and merge the individual month's data frames into one big data frame called "all_trips"</p>
<!-- /wp:paragraph -->

<!-- wp:code {"style":{"border":{"width":"1px"}},"backgroundColor":"foreground","textColor":"background","fontSize":"small","lineNumbers":true} -->
<pre class="wp-block-code has-background-color has-foreground-background-color has-text-color has-background has-small-font-size" style="border-width:1px"><code lang="c" class="language-c line-numbers">all_trips &lt;- bind_rows(may_2022, june_2022, july_2022, aug_2022, sept_2022, oct_2022, nov_2022, dec_2022, jan_2023, feb_2023, mar_2023, apr_2023)</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Uh-oh! We've received the following error, which has prevented us from merging our data frames.</p>
<!-- /wp:paragraph -->

<!-- wp:code {"style":{"border":{"width":"1px"}},"textColor":"vivid-red","fontSize":"small"} -->
<pre class="wp-block-code has-vivid-red-color has-text-color has-small-font-size" style="border-width:1px"><code class="">## Error: Can't combine `..1$end_station_id` &lt;character&gt; and `..5$end_station_id` &lt;double&gt;</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The error appears to be related to the vector type of our variable <strong>end_station_id</strong>. To fix this, let's convert the variable into a character, and for symmetry, let's do the same for <strong>start_station_id</strong>. </p>
<!-- /wp:paragraph -->

<!-- wp:code {"backgroundColor":"foreground","textColor":"background","fontSize":"small","lineNumbers":true} -->
<pre class="wp-block-code has-background-color has-foreground-background-color has-text-color has-background has-small-font-size"><code lang="c" class="language-c line-numbers">may_2022 &lt;- mutate(may_2022, start_station_id = as.character(start_station_id) ,
                   end_station_id = as.character(end_station_id))
june_2022 &lt;- mutate(june_2022, start_station_id = as.character(start_station_id) ,
                   end_station_id = as.character(end_station_id))
july_2022 &lt;- mutate(july_2022, start_station_id = as.character(start_station_id) ,
                   end_station_id = as.character(end_station_id))
aug_2022 &lt;- mutate(aug_2022, start_station_id = as.character(start_station_id) ,
                   end_station_id = as.character(end_station_id))

sept_2022 &lt;- mutate(sept_2022, start_station_id = as.character(start_station_id) ,
                   end_station_id = as.character(end_station_id))
oct_2022 &lt;- mutate(oct_2022, start_station_id = as.character(start_station_id) ,
                   end_station_id = as.character(end_station_id))
nov_2022 &lt;- mutate(nov_2022, start_station_id = as.character(start_station_id) ,
                   end_station_id = as.character(end_station_id))
dec_2022 &lt;- mutate(dec_2022, start_station_id = as.character(start_station_id) ,
                   end_station_id = as.character(end_station_id))
jan_2023 &lt;- mutate(jan_2023, start_station_id = as.character(start_station_id) ,
                   end_station_id = as.character(end_station_id))
feb_2023 &lt;- mutate(feb_2023, start_station_id = as.character(start_station_id) ,
                   end_station_id = as.character(end_station_id))
mar_2023 &lt;- mutate(mar_2023, start_station_id = as.character(start_station_id) ,
                   end_station_id = as.character(end_station_id))
apr_2023 &lt;- mutate(apr_2023, start_station_id = as.character(start_station_id) ,
                   end_station_id = as.character(end_station_id))
</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Ok, now let's retry merging our data frames.</p>
<!-- /wp:paragraph -->

<!-- wp:code {"backgroundColor":"foreground","textColor":"background","fontSize":"small","lineNumbers":true} -->
<pre class="wp-block-code has-background-color has-foreground-background-color has-text-color has-background has-small-font-size"><code lang="c" class="language-c line-numbers">all_trips &lt;- bind_rows(may_2022, june_2022, july_2022, aug_2022, sept_2022, oct_2022, nov_2022, dec_2022, jan_2023, feb_2023, mar_2023, apr_2023)</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The Error was confirmed to be fixed by the successful merger of our data frames into the new aggregate data frame <strong>all_trips</strong>. At this point, we can go ahead and save our progress.</p>
<!-- /wp:paragraph -->

<!-- wp:code {"style":{"border":{"width":"1px"}},"backgroundColor":"foreground","textColor":"background","fontSize":"small","lineNumbers":true} -->
<pre class="wp-block-code has-background-color has-foreground-background-color has-text-color has-background has-small-font-size" style="border-width:1px"><code lang="c" class="language-c line-numbers">save(all_trips, file = "all_trips.RData")</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":3} -->
<h3 class="wp-block-heading">Clean up and prepare new data frame for analysis</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Next, we will inspect the new table that has been created.</p>
<!-- /wp:paragraph -->

<!-- wp:code {"style":{"border":{"width":"1px"}},"backgroundColor":"foreground","textColor":"background","fontSize":"small","lineNumbers":true} -->
<pre class="wp-block-code has-background-color has-foreground-background-color has-text-color has-background has-small-font-size" style="border-width:1px"><code lang="c" class="language-c line-numbers"># Inspect the new table that has been created
colnames(all_trips)  #List of column names

nrow(all_trips)  #How many rows are in data frame?

dim(all_trips)  #Dimensions of the data frame?
head(all_trips)  #See the first 6 rows of data frame.  str(all_trips)  #See list of columns and data types (numeric, character, etc)
summary(all_trips)  #Statistical summary of data. Mainly for numerics
</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>After inspecting the data frame, there are a few problems we noticed that we will need to fix:</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>(1) The data can only be aggregated at the ride-level, which is too granular. We will want to add some additional columns of data -- such as day, month, year -- that provide additional opportunities to aggregate the data. </p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>(2) We will want to add a calculated field for length of ride. Since the data does not have this, we will add a <strong>ride_length</strong> column to the data frame.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>(3) There are some rides where <strong>ride_length</strong> shows up as negative, including several hundred rides where Divvy took bikes out of circulation for Quality Control reasons. We will want to delete these rides.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Let's address these problems in order.</p>
<!-- /wp:paragraph -->

<!-- wp:code {"style":{"border":{"width":"1px"}},"backgroundColor":"foreground","textColor":"background","fontSize":"small","lineNumbers":true} -->
<pre class="wp-block-code has-background-color has-foreground-background-color has-text-color has-background has-small-font-size" style="border-width:1px"><code lang="c" class="language-c line-numbers"># (1)
# Add columns that list the date, month, day, and year of each ride
# This will allow us to aggregate ride data for each month, day, or year ... before completing these operations we could only aggregate at the ride level

all_trips$date &lt;- as.Date(all_trips$started_at) #The default format is yyyy-mm-dd
all_trips$month &lt;- format(as.Date(all_trips$date), "%m")
all_trips$day &lt;- format(as.Date(all_trips$date), "%d")
all_trips$year &lt;- format(as.Date(all_trips$date), "%Y")
all_trips$day_of_week &lt;- format(as.Date(all_trips$date), "%A")</code></pre>
<!-- /wp:code -->

<!-- wp:code {"style":{"border":{"width":"1px"}},"backgroundColor":"foreground","textColor":"background","fontSize":"small","lineNumbers":true} -->
<pre class="wp-block-code has-background-color has-foreground-background-color has-text-color has-background has-small-font-size" style="border-width:1px"><code lang="c" class="language-c line-numbers"># (2)
# Add a "ride_length" calculation to all_trips (in seconds)
all_trips$ride_length &lt;- difftime(all_trips$ended_at,all_trips$started_at)

# Inspect the structure of the columns
str(all_trips)

# Convert "ride_length" from Factor to numeric so we can run calculations on the data
is.factor(all_trips$ride_length)
all_trips$ride_length &lt;- as.numeric(as.character(all_trips$ride_length))
is.numeric(all_trips$ride_length)</code></pre>
<!-- /wp:code -->

<!-- wp:code {"style":{"border":{"width":"1px"}},"backgroundColor":"foreground","textColor":"background","fontSize":"small","lineNumbers":true} -->
<pre class="wp-block-code has-background-color has-foreground-background-color has-text-color has-background has-small-font-size" style="border-width:1px"><code lang="c" class="language-c line-numbers"># (3)
# Remove "bad" data
# The dataframe includes a few hundred entries when bikes were taken out of docks and checked for quality by Divvy or ride_length was negative
# We will create a new version of the dataframe (v2) since data is being removed

all_trips_v2 &lt;- all_trips[!(all_trips$start_station_name == "HQ QR" | all_trips$ride_length&lt;0),]

# Filter rows that contain duplicate values

all_trips_v2 &lt;- all_trips_v2 %&gt;% distinct()</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Ok, now let's go ahead and save our progress.</p>
<!-- /wp:paragraph -->

<!-- wp:code {"style":{"border":{"width":"1px"}},"backgroundColor":"foreground","textColor":"background","fontSize":"small","lineNumbers":true} -->
<pre class="wp-block-code has-background-color has-foreground-background-color has-text-color has-background has-small-font-size" style="border-width:1px"><code lang="c" class="language-c line-numbers">save(all_trips_v2, file = "all_trips_v2.RData")</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p></p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":3} -->
<h3 class="wp-block-heading">Analysis</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>It's now time to conduct descriptive analysis on "ride_length" (all figures in seconds)</p>
<!-- /wp:paragraph -->

<!-- wp:code {"style":{"border":{"width":"1px"}},"backgroundColor":"foreground","textColor":"background","fontSize":"small","lineNumbers":true} -->
<pre class="wp-block-code has-background-color has-foreground-background-color has-text-color has-background has-small-font-size" style="border-width:1px"><code lang="c" class="language-c line-numbers">mean(all_trips_v2$ride_length) #straight average (total ride length / rides)
median(all_trips_v2$ride_length) #midpoint number in the ascending array of ride lengths
max(all_trips_v2$ride_length) #longest ride

min(all_trips_v2$ride_length) #shortest ride</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>You can also condense the four lines above to one line using summary() on the specific attribute.</p>
<!-- /wp:paragraph -->

<!-- wp:code {"style":{"border":{"width":"1px"}},"backgroundColor":"foreground","textColor":"background","fontSize":"small","lineNumbers":true} -->
<pre class="wp-block-code has-background-color has-foreground-background-color has-text-color has-background has-small-font-size" style="border-width:1px"><code lang="c" class="language-c line-numbers">summary(all_trips_v2$ride_length)</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Let's compare members and casual riders.</p>
<!-- /wp:paragraph -->

<!-- wp:code {"style":{"border":{"width":"1px"}},"backgroundColor":"foreground","textColor":"background","fontSize":"small","lineNumbers":true} -->
<pre class="wp-block-code has-background-color has-foreground-background-color has-text-color has-background has-small-font-size" style="border-width:1px"><code lang="c" class="language-c line-numbers">aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = mean)
aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = median)
aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = max)
aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = min)</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>And let's see the average ride time by each day for members vs casual riders.</p>
<!-- /wp:paragraph -->

<!-- wp:code {"style":{"border":{"width":"1px"}},"backgroundColor":"foreground","textColor":"background","fontSize":"small","lineNumbers":true} -->
<pre class="wp-block-code has-background-color has-foreground-background-color has-text-color has-background has-small-font-size" style="border-width:1px"><code lang="c" class="language-c line-numbers">aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual + all_trips_v2$day_of_week, FUN = mean)</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The days of the week are out of order. Let's fix that.</p>
<!-- /wp:paragraph -->

<!-- wp:code {"style":{"border":{"width":"1px"}},"backgroundColor":"foreground","textColor":"background","fontSize":"small","lineNumbers":true} -->
<pre class="wp-block-code has-background-color has-foreground-background-color has-text-color has-background has-small-font-size" style="border-width:1px"><code lang="c" class="language-c line-numbers">all_trips_v2$day_of_week &lt;- ordered(all_trips_v2$day_of_week, levels=c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"))</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Now, let's run the average ride time by each day for members vs casual users.</p>
<!-- /wp:paragraph -->

<!-- wp:code {"style":{"border":{"width":"1px"}},"backgroundColor":"foreground","textColor":"background","fontSize":"small","lineNumbers":true} -->
<pre class="wp-block-code has-background-color has-foreground-background-color has-text-color has-background has-small-font-size" style="border-width:1px"><code lang="c" class="language-c line-numbers">aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual + all_trips_v2$day_of_week, FUN = mean)</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Lastly, let's analyze ridership data by type and weekday.</p>
<!-- /wp:paragraph -->

<!-- wp:code {"style":{"border":{"width":"1px"}},"backgroundColor":"foreground","textColor":"background","fontSize":"small","lineNumbers":true} -->
<pre class="wp-block-code has-background-color has-foreground-background-color has-text-color has-background has-small-font-size" style="border-width:1px"><code lang="c" class="language-c line-numbers">all_trips_v2 %&gt;% 
        mutate(weekday = wday(started_at, label = TRUE)) %&gt;%  #creates weekday field using wday()
        group_by(member_casual, weekday) %&gt;%  #groups by usertype and weekday
        summarise(number_of_rides = n()							#calculates the number of rides and average duration 
                  ,average_duration = mean(ride_length)) %&gt;% 		# calculates the average duration
        arrange(member_casual, weekday)								# sorts
</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":3} -->
<h3 class="wp-block-heading">Visualization on R</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Now let's being creating some visualization on R. First, let's visualize the number of rides by rider type.</p>
<!-- /wp:paragraph -->

<!-- wp:code {"style":{"border":{"width":"1px"}},"backgroundColor":"foreground","textColor":"background","fontSize":"small","lineNumbers":true} -->
<pre class="wp-block-code has-background-color has-foreground-background-color has-text-color has-background has-small-font-size" style="border-width:1px"><code lang="c" class="language-c line-numbers">all_trips_v2 %&gt;% 
        mutate(weekday = wday(started_at, label = TRUE)) %&gt;% 
        group_by(member_casual, weekday) %&gt;% 
        summarise(number_of_rides = n()
                  ,average_duration = mean(ride_length)) %&gt;% 
        arrange(member_casual, weekday)  %&gt;% 
        ggplot(aes(x = weekday, y = number_of_rides, fill = member_casual)) +
        geom_col(position = "dodge")</code></pre>
<!-- /wp:code -->

<!-- wp:image {"align":"center","id":365,"width":502,"height":530,"sizeSlug":"full","linkDestination":"none","style":{"color":{"duotone":"unset"},"border":{"width":"1px"}}} -->
<figure class="wp-block-image aligncenter size-full is-resized has-custom-border"><img src="https://diaz.ai/wp-content/uploads/2023/05/divvy_r_viz1-1.png" alt="" class="wp-image-365" style="border-width:1px" width="502" height="530"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Now, let's create a visualization for the average duration.</p>
<!-- /wp:paragraph -->

<!-- wp:code {"style":{"border":{"width":"1px"}},"backgroundColor":"foreground","textColor":"background","fontSize":"small","lineNumbers":true} -->
<pre class="wp-block-code has-background-color has-foreground-background-color has-text-color has-background has-small-font-size" style="border-width:1px"><code lang="c" class="language-c line-numbers">all_trips_v2 %&gt;% 
        mutate(weekday = wday(started_at, label = TRUE)) %&gt;% 
        group_by(member_casual, weekday) %&gt;% 
        summarise(number_of_rides = n()
                  ,average_duration = mean(ride_length)) %&gt;% 
        arrange(member_casual, weekday)  %&gt;% 
        ggplot(aes(x = weekday, y = average_duration, fill = member_casual)) +
        geom_col(position = "dodge")
</code></pre>
<!-- /wp:code -->

<!-- wp:image {"align":"center","id":364,"width":502,"height":530,"sizeSlug":"full","linkDestination":"none","style":{"border":{"width":"1px"}}} -->
<figure class="wp-block-image aligncenter size-full is-resized has-custom-border"><img src="https://diaz.ai/wp-content/uploads/2023/05/divvy_r_viz2.png" alt="" class="wp-image-364" style="border-width:1px" width="502" height="530"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>Great, that wraps up our work in R. Now let's export this file for further analysis and visualization on Tableau.</p>
<!-- /wp:paragraph -->

<!-- wp:code {"style":{"border":{"width":"1px"}},"backgroundColor":"foreground","textColor":"background","fontSize":"small","lineNumbers":true} -->
<pre class="wp-block-code has-background-color has-foreground-background-color has-text-color has-background has-small-font-size" style="border-width:1px"><code lang="c" class="language-c line-numbers"># Create a csv file that we will use to create a visualization in Tableau

write.csv(all_trips_v2, file = '~/Desktop/Coursera/divvy_trip_data/xlsx/all_trips_v2.csv')</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p></p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":3} -->
<h3 class="wp-block-heading">Visualation on Tableau</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Now we will continue our work in Tableau Public.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>First, open a new Tableau workspace, and upload the file we just exported from R (all_trips_v2.csv) as a new data source.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>From here, we can create several dynamic visualizations.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Here's a link to the <a href="https://public.tableau.com/views/Cyclisticv2_16842422142800/Dashboard1?:language=en-US&amp;:display_count=n&amp;:origin=viz_share_link" data-type="URL" data-id="https://public.tableau.com/views/Cyclisticv2_16842422142800/Dashboard1?:language=en-US&amp;:display_count=n&amp;:origin=viz_share_link">Tableau dashboard</a> I created.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This dashboard includes visualizations such as:</p>
<!-- /wp:paragraph -->

<!-- wp:list -->
<ul><!-- wp:list-item -->
<li>A map viz of <strong>trips</strong> throughout the Chicago metropolitan area</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>A side-by-side bar viz of <strong>number of trips</strong> per <strong>Day of the Week</strong> by <strong>rider type</strong></li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>A line viz of <strong>number of trips</strong> per <strong>Calendar Month</strong> by <strong>rider type</strong></li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>A side-by-side bar viz of <strong>average ride length</strong> per <strong>Day of the Week</strong> by <strong>rider type</strong></li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>A line viz of <strong>average ride length</strong> per <strong>Calendar Month</strong> by <strong>rider type</strong></li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p></p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":3} -->
<h3 class="wp-block-heading">Key takeaways</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p></p>
<!-- /wp:paragraph -->

<!-- wp:list -->
<ul><!-- wp:list-item -->
<li>Annual members tend to use Divvy bikes more frequently as they have unlimited access throughout the year. They are more likely to use the service for regular commuting, running errands, or leisure rides.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p></p>
<!-- /wp:paragraph -->

<!-- wp:list -->
<ul><!-- wp:list-item -->
<li>Casual riders often use Divvy bikes for occasional or one-time trips, such as sightseeing or short-distance transportation needs.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p></p>
<!-- /wp:paragraph -->

<!-- wp:list -->
<ul><!-- wp:list-item -->
<li>Annual members are more likely to consistently use the service throughout the year, in contrast to casual clients, whose usage drops more significantly during the winter months.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p></p>
<!-- /wp:paragraph -->

<!-- wp:list -->
<ul><!-- wp:list-item -->
<li>Annual members are also more likely to use the service throughout the week, whereas casual riders are most active on the weekend.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p></p>
<!-- /wp:paragraph -->

<!-- wp:list -->
<ul><!-- wp:list-item -->
<li>Lastly, while the average ride length for casual riders is much greater than that of annual members (?11 mins vs ?28 mins), I attribute this to an unintended effect of the service's subscription model, which allows casual riders to purchase single-day unlimited passes - and thus, these riders may leave their bikes "undocked" throughout the day.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p></p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":3} -->
<h3 class="wp-block-heading">Recommendations</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Launch an email campaign that targets casual riders during the Spring and Summer months (March-September)</strong>.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>As casual riders are particularly more adverse to riding in colder weather, it would be a great idea to schedule different promotions and offerings throughout the months of their peak ridership, such as annual membership discounts, to entice them to continue riding throughout the year.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Build and launch a digital media campaign that raises awareness about the benefits of using Divvy for weekday commutes</strong>.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>While ridership figures for casual riders are strong on the weekend, they remain quite low during the week compared to that of annual members. One way to narrow this gap is a digital media campaign that highlights the many benefits of opting to commute on bike, such as health benefits and reducing one's carbon footprint.</p>
<!-- /wp:paragraph -->
