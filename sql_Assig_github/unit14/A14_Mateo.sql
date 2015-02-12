/* Wilson Mateo */

\W    /* enable warnings! */

use a_bkinfo;

/*  TASK 00 */ 
select user(), current_date(), version(), @@sql_mode\G

/* function source code */ 
show create function BookSize\G

/*  TASK 01 */
select testRun
		pageCount
		, bookSize(pageCount) as "actual"
		, expected
from
	(
		 select 1 as testRun 
		, null as "pageCount"
		,'invalidInput' as "expected"
		union all
		select 2, -29, 'InvalidInput'
		union all
		select 3, 10, 'short'
		union all
		select 4, 300, 'short'
		union all
		select 5, 301, 'medium'
		union all
		select 6, 800, 'medium'
		union all
		select 7, 801, 'long'
		union all
		select 8, 1200, 'long'
		union all
		select 9, 400000, 'ExtraLong'
	) testData
;

/*  TASK 02 */
select bookSize(page_count) as "Size" 
	, page_count as "NmbrBooks"
from a_bkinfo.books
where page_count is not null or page_count < 0
order by page_count;

/* function source code */
show create function prevMonth\G

/*  TASK 03 */
select cust_id as "customer id"
	   , concat(cust_name_last, ' , ' , cust_name_first) as "customer name"
from a_bkorders.customers C
where exists
			(
				select cust_id
				from a_bkorders.order_headers OH
				where C.cust_id = OH.cust_id
				and
				PrevMonth(current_date, 4) = prevMonth(order_date,0)
			)
		and exists
			(
				select cust_id
				from a_bkorders.order_headers OH
				where C.cust_id = OH.cust_id
				and
				PrevMonth(current_date, 3) = prevMonth(order_date,0)  
			)
		and exists
			(
				select cust_id
				from a_bkorders.order_headers OH
				where C.cust_id = OH.cust_id
				and
				PrevMonth(current_date, 2) = prevMonth(order_date,0)
			)
;

/*  TASK 04 */
select
	(
		select count(*)
		from a_bkorders.order_headers inOH
		where 
		prevMonth(order_date, 0) = prevMonth(current_date(),2)
		or 
		prevMonth(order_date, 0) = prevMonth(current_date(),1)
	) as "NumberOrders"
	,
	(
	select count(*)
	from
	(
		select order_id
		from a_bkorders.order_headers inOH
		where 
		prevMonth(order_date, 0) = prevMonth(current_date(),2)
		or 
		prevMonth(order_date, 0) = prevMonth(current_date(),1)
		group by cust_id
	) as customersOrders
	) as NumberCustWithOrders
from dual
;

/*  TASK 05 */

/*  TASK 06 */


/*  TASK 07 */


/*  TASK 08 */


/*  TASK 09 */


/*  TASK 10 */

            Function: PrevMonth
            sql_mode: STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION
     Create Function: CREATE DEFINER=`WilsonMathew`@`localhost` FUNCTION `PrevMonth`(
        in_date date
        , in_mn_adjust int
) RETURNS varchar(7) CHARSET utf8
begin
        declare yearMonth varchar(7);
        declare sub_date date;

        if in_mn_adjust < 0 then
                set yearMonth := null;
        elseif in_date is null then
                set yearMonth = substring(current_date(),1,7);
        else
                set sub_date = date_add(in_date, interval -in_mn_adjust month);
                set yearMonth = substring(sub_date,1,7);

        end if;

        return yearMonth;
end;