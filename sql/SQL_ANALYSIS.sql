CREATE DATABASE IF NOT EXISTS ipl_2008_2020;
USE ipl_2008_2020;

SHOW TABLES;

SELECT *
FROM deliveries;

SELECT *
FROM matches;

-- total matches played each season
SELECT YEAR(date) AS season, COUNT(*) AS total_matches
FROM matches
GROUP BY season
ORDER BY season;

-- most matches won by a team
SELECT winner, COUNT(*) AS wins
FROM matches
WHERE winner IS NOT NULL
GROUP BY winner
ORDER BY wins DESC;

-- most runs scored by a batsman
SELECT batsman, SUM(batsman_runs) AS total_runs
FROM deliveries
GROUP BY batsman
ORDER BY total_runs DESC
LIMIT 10;

-- most wickets taken by a bowler
SELECT bowler, COUNT(player_dismissed) AS wickets
FROM deliveries
WHERE player_dismissed IS NOT NULL
GROUP BY bowler
ORDER BY wickets DESC
LIMIT 10;

-- top 10 players with most man of the matches awards
SELECT player_of_match, COUNT(*) as awards
FROM matches
GROUP BY player_of_match
ORDER BY awards DESC
LIMIT 10;

-- toss decision influence on match result
SELECT toss_decision,
       COUNT(*) AS matches,
       SUM(CASE WHEN toss_winner = winner THEN 1 ELSE 0 END) AS toss_win_also_match_win,
       ROUND((SUM(CASE WHEN toss_winner = winner THEN 1 ELSE 0 END) / COUNT(*)) * 100, 2) AS percentage
FROM matches
GROUP BY toss_decision;

-- most economical bowler (min 300 balls bowled)
SELECT bowler,
       SUM(total_runs) / (COUNT(*)/6) AS economy_rate
FROM deliveries
GROUP BY bowler
HAVING COUNT(*) >= 300
ORDER BY economy_rate ASC
LIMIT 10;
