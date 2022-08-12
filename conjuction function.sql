--Question 1

create procedure newfilm
	(VARCHAR(255), TEXT, integer, INTeger, INTeger, NUMERIC(4,2), INTeger, numeric(4,2), mpaa_rating)
language plpgsql
as $$
begin
	insert into film(title, description, release_year, language_id, rental_duration,
	rental_rate, length, replacement_cost, rating)
		values (title, description, release_year, language_id, rental_duration,
	rental_rate, length, replacement_cost, rating);
end
$$

call newfilm('Ichi the Killer', 'As sadomasochistic yakuza enforcer Kakihara searches
	for his missing boss he comes across Ichi, a repressed and psychotic killer who
	may be able to inflict levels of pain that Kakihara has only dreamed of achieving.', 
	2001, 1, 3, 3.99, 129, 39.99, 'R')

------------------------------------------------------------------------------------
--Question 2

create or replace function get_category_count(cat_id integer)
returns integer
language plpgsql
as $$
	declare category_count integer;
begin
	select count(*) into category_count
	from film_category
	where category_id = cat_id
	group by category_id;
	return category_count;
end;
$$;

select get_category_count(5);


------------------------------------------------------------------------------------

select length
from film;

select count(category_id), category_id
from film_category
group by category_id
order by count desc;
