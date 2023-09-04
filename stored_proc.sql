CREATE PROCEDURE NewFilm(
	title varchar, 
	description varchar, 
	release_year YEAR, 
	language_id int2, 
	rental_duration int2,
	rental_rate NUMERIC(4,2), 
	length int2, 
	replace_cost NUMERIC(5,2), 
	rating mpaa_rating)
	