/* Wilson Mateo */

\W    /* enable warnings! */

use  a_bkorders;

/*  TASK 00 */ 
select user(), current_date(), version(), @@sql_mode\G

/*  TASK 01 */
select 
	coalesce(order_date, "Total") as OrderDate
	, count(*) NumberOrders
	, sum(quantity * order_price) as AmntDue
	, sum(quantity) as NumbBooksPurch
from a_bkorders.order_headers OH
join a_bkorders.order_details OD using(order_id)
group by order_date with rollup;

/*  TASK 02 format 2 */
select 
	coalesce(tbl.order_year, 'Grand Total') as "Year"
	, case 
			when order_year is null then 
			'..........'
			else 
			coalesce(tbl.order_month, 'Yearly Total') 
	  end as "Month"
	, case 
			when order_month is null then  
			'..........'
			else 
			coalesce(tbl.id,'Month Total')
	  end as "Order_ID" 
	, tbl.amount_due as "AmntDue"
	, tbl.books_purchased  as "NumbBooksPurch"
from 
(
	select 
		year(order_date) as "order_year"
		, month(order_date) as "order_month"
		, OH.order_id as "id"
		, sum(quantity * order_price) as "amount_due"
		, sum(quantity) as "books_purchased"
	from a_bkorders.order_headers OH
	join a_bkorders.order_details OD on OH.order_id = OD.order_id
	group by year(order_date), month(order_date), id with rollup
)tbl
;

/*  TASK 03 */
select 
	coalesce(tbl.order_year, 'Grand Total') as ""
	, coalesce(tbl.order_month, 'Yearly Total') as ""
	, tbl.NumberOrders
	, tbl.amount_due as "AmntDue"
	, tbl.books_purchased  as "NumbBooksPurch"
from 
(
	select 
		year(order_date) as "order_year"
		, month(order_date) as "order_month"
		, count(OH.order_id) as "NumberOrders"
		, sum(quantity * order_price) as "amount_due"
		, sum(quantity) as "books_purchased"
	from a_bkorders.order_headers OH
	join a_bkorders.order_details OD on OH.order_id = OD.order_id
	group by year(order_date), month(order_date) with rollup
)tbl
where order_month is null
or order_year is null
;

/*  TASK 04 */
select
	coalesce(author_id, 'ALL Authors') as AuthorID
	, coalesce(B.book_id, 'All books') as BookID
	, coalesce(sum(quantity), 0) as TotalQuantity
	, coalesce(sum(quantity * order_price),'No sales') as TotalSales
from a_bkinfo.authors A
join a_bkinfo.book_authors BA using(author_id)
join a_bkinfo.books B using (book_id)
left join a_bkorders.order_details OD on B.book_id = OD.book_id
where author_sequence = 1
group by author_id, B.book_id with rollup
;

/*  TASK 05 */

select 
case 
	when OD.book_id is not null then
		coalesce(author_id,'_anon')
		else 
		coalesce(author_id,'Grand Total')
	end as AuthorID
, case 
	when sum(quantity) is null then 
		'No books'
		else
			coalesce(OD.book_id, 'All books')
	end as book_id
, coalesce(sum(quantity), 0) as TotalQuantity
, coalesce(sum(quantity * order_price),'No sales') as TotalSales
from 
(
	select 
	atbl1.author_id
	, B.book_id
	from
		(
			select
			 author_id
			 ,book_id
			from a_bkinfo.book_authors BA
			union all
			select 
			author_id
			, null
			from a_bkinfo.authors A
		) as atbl1
		right join a_bkinfo.books B on atbl1.book_id = B.book_id
union all
	select 
	atbl2.author_id
	, B.book_id
	from 
		(
			select
			 author_id
			 ,book_id
			from a_bkinfo.book_authors BA
			union all
			select 
			author_id
			, null
			from a_bkinfo.authors A
		) as atbl2
		left join a_bkinfo.books B on atbl2.book_id = B.book_id
) as authors_no
left join a_bkorders.order_details OD on authors_no.book_id = OD.book_id
group by author_id, OD.book_id with rollup
;


/*  TASK 06 */

select book_id, page_count
,
	(
		select 
			count(distinct floor(page_count/50)*50)
		from a_bkinfo.books B1
		where floor(B1.page_count/50)*(50) >= floor(B2.page_count/50)*(50)
	) as Ranking
from a_bkinfo.books B2
where page_count is not null
order by page_count desc
;


/*  TASK 07 */

set @september = '2013-09-01';
set @september_end = '2013-09-30';

select days
	, coalesce(sum(quantity), 0) as TotalQuantity
	, coalesce(sum(quantity * order_price),0.0) as TotalSales
from 
(
	select days, sales_data.quantity, sales_data.order_date, sales_data.order_price
	from 
		(
		select date_add(@september, interval (b1.val + b2.val + b4.val + b8.val + b16.val) day) as 'days'
		from
			( select 0 val union all select 1) b1 
			cross join
			( select 0 val union all select 2) b2 
			cross join
			( select 0 val union all select 4) b4 
			cross join
			( select 0 val union all select 8) b8 
			cross join
			( select 0 val union all select 16) b16 
		)tbl_days
		left join 
		(
			select order_date, order_id, quantity, order_price
			from a_bkorders.order_details OD
			join a_bkorders.order_headers OH using(order_id)
		)sales_data on tbl_days.days = sales_data.order_date  	
		where days between @september and @september_end
)tbl_data
group by days;

/*  TASK 08 */

/*  TASK 09 */

/*  TASK 10 */