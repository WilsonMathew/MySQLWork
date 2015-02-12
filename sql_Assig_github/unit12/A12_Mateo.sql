/* Wilson Mateo */

\W    /* enable warnings! */

use  a_bkorders;

/*  TASK 00 */ 
select user(), current_date(), version(), @@sql_mode\G

/*  TASK 01 */
	select cust_id, cust_name_last,
	(
		select count(*) as orderNum
		from a_bkorders.order_headers OH
		where C.cust_id = OH.cust_id
		group by cust_id
	) as OrderNum
from a_bkorders.customers C
where 
	(
		cust_state = 'NJ'
		or cust_state = 'MA'
	)
	and cust_id in
	(
		select cust_id
		from a_bkorders.order_headers
	)
order by cust_id
;

/*  TASK 02 */
select cust_id, cust_name_last
from a_bkorders.customers C
where exists
	(
		select cust_id, order_date
		from a_bkorders.order_headers OH
		where C.cust_id = OH.cust_id
		and year(order_date) = year(current_date) - 1 
		and
		month(order_date) = 10
	)
	and exists
	(
		select cust_id, order_date
		from a_bkorders.order_headers OH
		where C.cust_id = OH.cust_id
		and year(order_date) = year(current_date) - 1 
		and
		month(order_date) = 11 
	)
	and exists
	(
		select cust_id, order_date
		from a_bkorders.order_headers OH
		where C.cust_id = OH.cust_id
		and year(order_date) = year(current_date) - 1 
		and
		month(order_date) = 12
	)
order by cust_id
;

/*  TASK 03 */
select *
from a_bkinfo.authors A 
where EXISTS
	(
		select 'x'
		from a_bkinfo.book_authors BA
		where A.author_id = BA.author_id
		group by author_id
		having count(*) > 1
	)
	and exists
	(
			select author_id
			from a_bkinfo.book_authors BA
			where A.author_id = BA.author_id and
			book_id not in
			(
				select book_id
				from a_bkorders.order_details OD
			)
	)
	and not exists
	(
			select author_id
			from a_bkinfo.book_authors BA
			where A.author_id = BA.author_id and
			book_id in
			(
				select book_id
				from a_bkorders.order_details OD
			)
	)
order by author_id
;			
	
/*  TASK 04 */
select book_id, title
from a_bkinfo.books B
where exists
	(
		select book_id
		from a_bkinfo.book_topics BT
		where B.book_id = BT.book_id and
		topic_id = 'MySQL'
		and exists
			(
			select book_id
			from a_bkinfo.book_topics BTin
			where BT.book_id = BTin.book_id
			and topic_id = 'SSRV'
			)
	) or exists
	(
		select book_id
		from a_bkinfo.book_topics BT
		where B.book_id = BT.book_id and
		topic_id = 'ORA'
		and exists
			(
			select book_id
			from a_bkinfo.book_topics BTin
			where BT.book_id = BTin.book_id
			and topic_id = 'SSRV'
			)
	) or exists
	(
		select book_id
		from a_bkinfo.book_topics BT
		where B.book_id = BT.book_id and
		topic_id = 'ORA'
		and exists
			(
			select book_id
			from a_bkinfo.book_topics BTin
			where BT.book_id = BTin.book_id
			and topic_id = 'MySQL'
			)
	);

/*  TASK 05 */
select 
 order_date
, order_id
, cust_id
, 
(
	select cust_name_last
	from a_bkorders.customers C
	where OH.cust_id = C.cust_id
) as "customer"
,
(
	select sum(quantity)
	from a_bkorders.order_details OD
	where OH.order_id = OD.order_id
	group by order_id
) as "NumberBooks"
,
(
	select sum(quantity*order_price)
	from a_bkorders.order_details OD
	where OH.order_id = OD.order_id
) as "OrderCost"
from a_bkorders.order_headers OH
where quarter(order_date) = 2
and year(order_date) = year(current_date)
order by order_date
;

/* TASK 06 */
select cust_id, cust_name_last
from a_bkorders.customers C
where cust_id in
	(
		select cust_id
		from a_bkorders.order_headers OH
		where  C.cust_id = OH.cust_id
		and
		order_id in
			(
				select order_id
				from a_bkorders.order_details OD
				where exists
					(
						select *, count(*) as "ordNum" 
						from a_bkorders.order_details inOD
						where OD.book_id = inOD.book_id 
						and OD.order_id = inOD.order_id
						group by order_id, book_id
						having count(*) > 1
					)
		)
	);

/*  TASK 07 */


/*  TASK 08 */


/*  TASK 09 */


/*  TASK 10 */
