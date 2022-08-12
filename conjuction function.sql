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

create or replace function get_category_count(category_id integer)
returns integer
language plpgsql
as $$
	declare category_count integer;
begin
	select count(category_id) into category_count
	from film_category
	group by category_id;
	return category_count;
end;
$$;

select get_category_count(7);


------------------------------------------------------------------------------------

select length
from film;

select count(category_id), category_id
from film_category
group by category_id
order by count desc;
