--- This Project will analyse the findings of Spotifys music over 2023 
---(Please Note this database was last updated seven months into 2023)


Select *
From Spotify

--- Exploring the database

Select
TOP 5 streams , track_name,artist_name, released_year
From Spotify 
ORDER BY streams desc

--- Checking the top 5 streamed songs in Spotify history


Select
TOP 5
artist_name,track_name, SUM(streams) AS most_streams , released_year
From Spotify
Where released_year = '2023'
Group by artist_name,track_name,released_year
Order by most_streams DESC

-- Checking the Top 5 most streamed songs of 2023 that released in 2023

Select 
SUM(streams)AS streams_per_month , released_month
From Spotify
Where released_year = 2023
Group by released_month
Order by streams_per_month desc

-- Checking 2023's most streamed months  
--(Note this Spotify database was updated 7 months into 2023) 

Select SUM(streams)AS yearly_streams , released_year
From Spotify
Group by released_year
order by yearly_streams desc

-- Comparing 2023 streams vs previous years


Select
TOP 5
artist_name,track_name, SUM(streams) AS most_streams , released_year
From Spotify
Group by artist_name,track_name,released_year
Order by most_streams DESC

-- Checking if 2023's top 5 most streamed make Spotifys overall top 5 streamed songs 

Select track_name,artist_name,in_spotify_charts
From Spotify
WHERE in_spotify_charts >= 90 

-- The most popular songs that stayed in Spotifys charts  

Select
TOP 1
in_spotify_charts,
track_name,artist_name
From Spotify

-- Checking the most popular song in Spotifys charts 

Select
TOP 1
in_apple_charts,
track_name,artist_name
From Spotify

-- Checking Apples most popular song 

Select track_name,artist_name,in_spotify_charts,in_apple_charts,in_deezer_charts,in_shazam_charts
From Spotify
WHERE in_spotify_charts >= 70 AND in_apple_charts >= 70 AND in_deezer_charts >= 20 AND in_shazam_charts >= 70

-- Comparing popular songs in charts across other platforms 


Select *
From Spotify 
Where artist_count > 2
Order by streams desc

--- Spotifys most streamed songs by bands or collabrations overall

Select *
From Spotify 
Where artist_count > 2 and released_year = 2023
Order by streams desc

--- Spotifys most streamed songs by bands or collabrations in 2023

SELECT released_month,
MAX(track_name) AS track_name ,	SUM(streams) as streams
FROM
Spotify
WHERE released_year = 2023 
GROUP BY
released_month
ORDER BY
released_month;

-- Spotifys most streamed song each month in 2023 
--(Note in this database only 7 months in 2023 had passed)

Select *
From Spotify
Where in_spotify_charts >= 90

--- Most popular spotify songs in Spotifys playlists

Select TOP 5 track_name,SUM(streams) as top_streams_by_bpm , bpm ,artist_name
From Spotify
Group by bpm , track_name , streams , artist_name
Having bpm >= 110
Order by streams desc

Select TOP 5 track_name,SUM(streams) as top_streams_by_bpm , bpm ,artist_name
From Spotify
Group by bpm , track_name , streams,artist_name
Having bpm <= 110
Order by streams desc

--- Comparing the streams of songs with a bpm  110 or above considered a fast song 
-- Vs a moderate pace/slow song 109 or less

Select TOP 5 track_name,SUM(streams) as top_streams_by_bpm , bpm ,released_year,artist_name
From Spotify
Group by bpm , track_name , streams,released_year,artist_name
Having bpm >= 110 and released_year = 2023
Order by streams desc


Select TOP 5 track_name,SUM(streams) as top_streams_by_bpm , bpm ,released_year, artist_name
From Spotify
Group by bpm , track_name , streams,released_year,artist_name
Having bpm <= 110 and released_year = 2023
Order by streams desc

-- Checking the same for 2023 understanding what song pace fans like

Select SUM(streams)as year_streams ,artist_name,released_year
From Spotify
Where released_year = 2023 
Group by artist_name,released_year
Order by year_streams desc
- Understanding who the most streamed artist of 2023 was 

Select SUM(streams)as year_streams ,artist_name,released_year
From Spotify
Where released_year = 2023 
Group by artist_name,released_year
Order by year_streams asc

-- Understanding The least popular artist by streams


Select SUM(streams)as year_streams ,artist_name,artist_count,released_year,
CASE 
When artist_count = 2 Then 'Collabration' 
When artist_count >= 3 Then 'Band'
Else 'Solo Artist'
END AS type_of_artist
From Spotify
Where released_year = 2023 and artist_count >= 2
Group by artist_name,artist_count,released_year
Order by year_streams desc

--- Understanding who Spotifys most streamed artist of 2023 in a band or collabration 

Select SUM(streams)as year_streams ,artist_name,artist_count,released_year,
CASE 
When artist_count = 2 Then 'Collabration' 
When artist_count >= 3 Then 'Band'
Else 'Solo Artist'
END AS type_of_artist
From Spotify
Where released_year = 2023 and artist_count >= 2
Group by artist_name,artist_count,released_year
Order by year_streams asc

--- Understanding Spotifys least popular songs of 2023 for collabarations / bands 


Select track_name,streams,[danceability_%]
From Spotify
Where [danceability_%] >= '69'and released_year = '2023'
Order by streams desc

Select track_name,streams,[danceability_%]
From Spotify
Where [danceability_%] <= '70'and released_year = '2023'
Order by streams desc

-- Comparing how the danceability of a song effects the streams of a song in 2023 


Select track_name,streams,[energy_%]
From Spotify
Where [energy_%] >= '59'and released_year = '2023'
Order by streams desc

Select track_name,streams,[energy_%]
From Spotify
Where [energy_%] <= '60'and released_year = '2023'
Order by streams desc

--- Simiarly comparing danceability and energy finding the same results 


--- Conclusion

--- In my findings I found,

-- Miley Cyrus has had the best year of any aritst with the most streams 

-- Fast Paced (>=110 bpm) songs garner more fans than slower songs (<=90 bpm)

-- The danceability and energy also effected the streams/popularity of a song more energy/danceability = more streams

-- Seven By Jung Kook though not as streamed reached a vareity of audeinces via entering various charts in Spotifys and others charts

-- 2023 was on track for a great year for music ranking already 6th for most streams in history the projection was positive

-- 2023's streams however did peak at the start of the year with the numbers slowly dwindling (potenitially no popular songs released)

-- Overall 2023's on track for a great year streaming wise and artists know what songs their audience like,
-- however the decreasing streams should be monitored 
