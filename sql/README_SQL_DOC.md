# SQL Documentation — SQL_ANALYSIS.sql

File: `sql/SQL_ANALYSIS.sql`. Source: uploaded script. fileciteturn5file0

## Assumed schema
- matches(id, date, season, winner, player_of_match, toss_winner, toss_decision, ...)
- deliveries(match_id, batsman, bowler, batsman_runs, total_runs, player_dismissed, ...)

## Query purposes (summary)
- season-wise match counts
- team wins ranking
- top run-scorers
- top wicket-takers
- man-of-the-match counts
- toss decision influence
- economy rate calculations (runs per over, min 300 legal deliveries)

## Performance tips
- Index `matches.date`, `matches.winner`, `deliveries.bowler`, `deliveries.batsman`.
- Aggregate into intermediate tables if running repeated heavy queries.
- Validate dismissal and ball counts if wides/no-balls are present.
