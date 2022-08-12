--Question 1

create procedure newfilm
language plpgsql
as $$
begin
	insert into film(
	title, description, release_year, language_id, rental_duration,
	rental_rate, length, replacement_cost, rating)
		values (VARCHAR(255), TEXT, YEAR, INT2, INT2, 
		NUMERIC(4,2), INT2, numeric(4,2), mpaa_rating);
end
$$

call newfilm('Ichi the Killer', 'As sadomasochistic yakuza enforcer Kakihara searches
	for his missing boss he comes across Ichi, a repressed and psychotic killer who
	may be able to inflict levels of pain that Kakihara has only dreamed of achieving.', 
	2001, 1, 3, 3.99, 129, 39.99, 'Unrated')

------------------------------------------------------------------------------------
--Question 2

create or replace function filmsincategory(category_id)
language plpgsql
as $$
begin
	
	
end
$$



------------------------------------------------------------------------------------

select length
from film;
