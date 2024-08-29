--Director's Impact on Earnings: Analyze how movies directed by different directors perform in terms of gross earnings. Are there any noticeable trends or patterns?
SELECT
COUNT(*) AS Movies,
Director,
ROUND(AVG(Gross),0) AS Avg_Gross,
SUM(Gross) as Total_Gross
FROM
`mini_hackathon.imdb_top_1000`
GROUP BY
Director
ORDER BY
Total_Gross desc

--Genre Popularity Over the Years: Investigate how different genres have evolved in popularity over time.
SELECT
Genre1,
Genre2,
Genre3,
Released_Year,
AVG(IMDB_Rating) as Rating
FROM
`mini_hackathon.imdb_top_1000`
GROUP BY
Genre1, Genre2, Genre3, Released_Year, IMDB_Rating


--Correlation Between IMDB Ratings and Commercial Success: Explore if there's a relationship between a movie's IMDB rating and its box office earnings.
SELECT round(corr(IMDB_Rating, Gross),2) as Correlation_value,
CASE 
  WHEN round(corr(IMDB_Rating, Gross),2)>0 and round(corr(IMDB_Rating,Gross),2)<1 then 'RatingIncreases then GrossIncreases'
  WHEN round(corr(IMDB_Rating,Gross),2)<0 then 'RatingIncreases then GrossDecreases'
  WHEN round(corr(IMDB_Rating,Gross),2)=0 then 'NoImpact'
  END  AS Result
FROM
`mini_hackathon.imdb_top_1000`

--Impact of Movie Length on Ratings or Earnings: Examine whether the duration of a movie influences its ratings or financial success.
SELECT
Runtime,
ROUND(AVG(Gross),0) AS Avg_gross,
CASE
  WHEN CAST(SUBSTR(Runtime,0,LENGTH(Runtime)-4)AS INT) >120 THEN "High Runtime and High Rating"
  WHEN CAST(SUBSTR(Runtime,0,LENGTH(Runtime)-4)AS INT) BETWEEN 90 and 120 THEN "Avg Runtime and  Rating differs"
  WHEN CAST(SUBSTR(Runtime,0,LENGTH(Runtime)-4)AS INT) <90 THEN "Low Runtime and may have Low Ratings"
END AS Movie_Impact
from
`mini_hackathon.imdb_top_1000`
GROUP BY
Runtime
ORDER BY
Avg_gross
desc

--Actor Influence on Movie Success: Analyze how the presence of certain actors correlates with a movie's performance in terms of ratings and earnings.

SELECT
    COUNT(*) AS Movies,
    Star1 AS Star,
    AVG(IMDB_Rating) AS Rating,
    CASE
        WHEN AVG(IMDB_Rating) >= 9 THEN 'Most Popular Star'
        WHEN AVG(IMDB_Rating) >= 8 AND AVG(IMDB_Rating) < 9 THEN 'Popular Star'
        ELSE 'Star'
    END AS Performance
FROM
    `mini_hackathon.imdb_top_1000`
GROUP BY 
    Star1

UNION ALL

SELECT
    COUNT(*) AS Movies,
    Star2 AS Star,
    AVG(IMDB_Rating) AS Rating,
    CASE
        WHEN AVG(IMDB_Rating) >= 9 THEN 'Most Popular Star'
        WHEN AVG(IMDB_Rating) >= 8 AND AVG(IMDB_Rating) < 9 THEN 'Popular Star'
        ELSE 'Star'
    END AS Performance
FROM
    `mini_hackathon.imdb_top_1000`
GROUP BY 
    Star2

UNION ALL

SELECT
    COUNT(*) AS Movies,
    Star3 AS Star,
    AVG(IMDB_Rating) AS Rating,
    CASE
        WHEN AVG(IMDB_Rating) >= 9 THEN 'Most Popular Star'
        WHEN AVG(IMDB_Rating) >= 8 AND AVG(IMDB_Rating) < 9 THEN 'Popular Star'
        ELSE 'Star'
    END AS Performance
FROM
    `mini_hackathon.imdb_top_1000`
GROUP BY 
    Star3

UNION ALL

SELECT
    COUNT(*) AS Movies,
    Star4 AS Star,
    AVG(IMDB_Rating) AS Rating,
    CASE
        WHEN AVG(IMDB_Rating) >= 9 THEN 'Most Popular Star'
        WHEN AVG(IMDB_Rating) >= 8 AND AVG(IMDB_Rating) < 9 THEN 'Popular Star'
        ELSE 'Star'
    END AS Performance
FROM
    `mini_hackathon.imdb_top_1000`
GROUP BY 
    Star4;