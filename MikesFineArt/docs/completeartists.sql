CREATE VIEW `completeartists` AS SELECT Artists.*, Genre.name as genre, Style.name as style, 
	Period.name as period 
FROM Artists, Genre, Style, Period 
WHERE Artists.idGenre = Genre.idGenre AND Artists.idPeriod = Period.idPeriod 
	AND Artists.idStyle = Style.idStyle
