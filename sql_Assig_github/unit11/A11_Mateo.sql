/* Wilson Mateo */

\W    /* enable warnings! */

use a_bkorders;

/*  TASK 00 */ 
select user(), current_date(), version(), @@sql_mode\G

/*  TASK 01 */
select book_id, title
from a_bkinfo.books
where book_id in
	(
	    select book_id
		from a_bkinfo.book_topics
		where topic_id = 'SQL'
		or topic_id = 'DB'
	)
	and book_id in 
	(
	    select book_id
		from a_bkorders.order_details
	)
order by book_id
;

/*  TASK 02 */
select book_id, title
from a_bkinfo.books
where book_id in
	(
	    select book_id
		from a_bkinfo.book_topics
		where topic_id = 'DB' and
			  topic_id = 'SQL'
	)
	and book_id in 
	(
	    select book_id
		from a_bkorders.order_details
	)
order by book_id
;

/*  TASK 03 */
select book_id, title
from a_bkinfo.books
where book_id in 
	(
	    select book_id
		from a_bkorders.order_details
	)
	and book_id in 
	(
	    select book_id
		from a_bkinfo.book_topics
		where topic_id = 'SQL'
	)
	and book_id not in
	(
	    select book_id
		from a_bkinfo.book_topics
		where topic_id = 'DB'
	)
order by book_id
;
/*  TASK 04 */
select book_id, title, year_publd
from a_bkinfo.books
where book_id in
	(
		select book_id
		from a_bkorders.order_details
		group by book_id
		having sum(quantity*order_price) >= all
			(
				select sum(quantity * order_price)
				from a_bkorders.order_details
				group by book_id
			)
	)
;

/*  TASK 05 */
select cust_id, cust_name_last
from a_bkorders.customers
where cust_id in
	(
		select cust_id
		from a_bkorders.order_headers
		where order_id in
			(
			select order_id
			from a_bkorders.order_details
			where book_id in
				(
					select book_id
					from a_bkinfo.books
					where book_id in
						(
							select book_id
							from a_bkinfo.book_authors
							where author_id in
								(
									select author_id 
									from a_bkinfo.authors
									where author_name_last ='Celko'
								)
						)
				)
			)
		and
		extract(year from order_date) = extract(year from current_date)
	)
order by cust_id
;

/*  TASK 06 */
select cust_id, cust_name_last
from a_bkorders.customers
where cust_id in
		(
			select cust_id
			from 
			a_bkorders.order_headers
			group by cust_id
			having count(*) >=3
			and count(*) <=5
		)
		and cust_id in 
		(
			select cust_id
			from a_bkorders.order_headers
			where year(order_date) = year(current_date) - 1
			group by cust_id
		)
order by cust_id
;

/*  TASK 07 */
select book_id, title
from a_bkinfo.books
where book_id in
	(
		select book_id
		from a_bkorders.order_details
		where quantity > 500
	)
;

/*  TASK 08 */
select book_id, title, list_price
from a_bkinfo.books otr
where list_price > all
	(
		select list_price
		from a_bkinfo.books
		where book_id in
			(
				select book_id
				from a_bkinfo.book_topics
				where topic_id = 'DB'
			)
	)
;	
	
/*  TASK 09 */


/*  TASK 10 */
