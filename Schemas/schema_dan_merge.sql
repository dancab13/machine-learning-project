SELECT *
FROM games

SELECT *
FROM teams

SELECT *
FROM games_teams_join

CREATE TABLE games_teams_join AS
SELECT g.game_date_est, g.game_id, g.game_status_text, g.home_team_id, g.visitor_team_id, g.season, g. team_id_home, g.pts_home, g.fg_pct_home, g.ft_pct_home, g.fg3_pct_home, g.ast_home, g.reb_home, g.team_id_away, g.pts_away, g.fg_pct_away, g.ft_pct_away, g.fg3_pct_away, g.ast_away, g.reb_away, g.home_team_wins, t.team_id, t.abbreviation, t.nickname, t.city, t.arena, t.arenacapacity, t.owner, t.generalmanager, t.headcoach, t.dleagueaffiliation 
FROM games as g
INNER JOIN teams as t ON g.home_team_id = t.team_id;