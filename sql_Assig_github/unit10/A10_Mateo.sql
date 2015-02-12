/*Wilson Mateo*/

\W    /* enable warnings! */

use  a_bkorders; -- put the database name into this command and remove the comment. Keep the ending semicolon;

/*  TASK 00 */ 
select user(), current_date(), version(), @@sql_mode\G

/*  TASK 01 */

set @rundate := current_date;

set @first_date:=date_add(@rundate, interval -4 month);
set @second_date:=date_add(@rundate, interval -3 month);
set @third_date =date_add(@rundate, interval -2 month);

set @first_month= month(@first_date);
set @first_year= year(@first_date);

set @second_month= month(@second_date);
set @second_year= year(@second_date);

set @third_month= month(@third_date);
set @third_year= year(@third_date);

select   @first_date, @second_date, @third_date, @rundate, @first_month,@first_year, @second_month, @second_year, @third_month,@third_year\G

/*  TASK 02 */ 
		Select c_id, c_name 
		from a_bkorders.CustWithOrders
		where 
			month(order_date) = @first_month 
			and
			year(order_date) = @first_year
	UNION
		Select c_id, c_name
		from a_bkorders.CustWithOrders
		where
			month(order_date) = @second_month
			and
			year(order_date) = @second_year
	UNION
		Select c_id, c_name
		from a_bkorders.CustWithOrders
		where
			month(order_date) = @third_month
			and 
			year(order_date) = @third_year;

/*  TASK 03 */
	Select Distinct c_id,c_name
	from a_bkorders.CustWithOrders
	where 
	c_id not in (
		select c_id
		from a_bkorders.CustWithOrders
		where 
			month(order_date) = @first_month
			and
			year(order_date) = @first_year
			)
	and c_id not in (
		select c_id
		from a_bkorders.CustWithOrders
		where
			month(order_date) = @second_month
			and
			year(order_date) = @second_year
			)
	and c_id not in (
		select c_id
		from a_bkorders.CustWithOrders
		where
			month(order_date) = @third_month
			and
			year(order_date) = @third_year
			);

/*  TASK 04 */
	Select Distinct c_id, c_name
	from a_bkorders.CustWithOrders
	where c_id in(
		select c_id
		from a_bkorders.CustWithOrders
		where
			month(order_date) = @first_month
			and
			year(order_date) = @first_year
			)
	and c_id in(
		select c_id
		from a_bkorders.CustWithOrders
		where
			month(order_date) = @second_month
			and
			year(order_date) = @second_year
			)
	and c_id in(
		select c_id
		from a_bkorders.CustWithOrders
		where
			month(order_date) = @third_month
			and
			year(order_date) = @third_year
			);

/*  TASK 05 */
	Select distinct c_id, c_name
	from a_bkorders.CustWithOrders
	where 
	c_id in(
		select c_id
		from a_bkorders.CustWithOrders
		where
			month(order_date) = @first_month
			and
			year(order_date) = @first_year
			)
	and c_id not in(
		select c_id
		from a_bkorders.CustWithOrders
		where
			month(order_date) = @second_month
			and
			year(order_date) = @second_year
			)
	and c_id not in(
		select c_id
		from a_bkorders.CustWithOrders
		where
			month(order_date) = @third_month
			and
			year(order_date) = @third_year
			);


/*  TASK 06 */

	Select distinct c_id, c_name
	from a_bkorders.CustWithOrders
	where c_id in(
		select c_id
		from a_bkorders.CustWithOrders
		where
			month(order_date) = @first_month
			and
			year(order_date) = @first_year
			)
	and(
	c_id in(
		select c_id
		from a_bkorders.CustWithOrders
		where
			month(order_date) = @second_month
			and
			year(order_date) = @second_year
			)
	or c_id in(
		select c_id
		from a_bkorders.CustWithOrders
		where
			month(order_date) = @third_month
			and
			year(order_date) = @third_year)
	);

	/*  TASK 07 */
	select c_id, c_name
	from a_bkorders.CustWithOrders
	where  c_id in (
		select c_id
		from a_bkorders.CustWithOrders
		where
			month(order_date) = @first_month
			and
			year(order_date) = @first_year
			)
	and c_id in(
		select c_id
		from a_bkorders.CustWithOrders
		where
			month(order_date) = @second_month
			and
			year(order_date) = @second_year
			)
	and c_id not in(
		select c_id
		from a_bkorders.CustWithOrders
		where
			month(order_date) = @third_month
			and
			year(order_date) = @third_year
			)
	UNION 
		select c_id, c_name
		 from a_bkorders.CustWithOrders
		where  c_id in(
			select c_id
			from a_bkorders.CustWithOrders
			where
		month(order_date) = @first_month
		and
		year(order_date) = @first_year
		)
	and c_id not in(
		select c_id
		from a_bkorders.CustWithOrders
		where
		month(order_date) = @second_month
		and
		year(order_date) = @second_year
		)
	and c_id in(
		select c_id
		from a_bkorders.CustWithOrders
		where
			month(order_date) = @third_month
			and
			year(order_date) = @third_year
			);

/*  TASK 08 */
	select distinct c_id, c_name
	from a_bkorders.CustWithOrders
	where( 
	c_id in (
		select c_id
		from a_bkorders.CustWithOrders
		where
			month(order_date) = @first_month
			and
			year(order_date) = @first_year
			)
	or
	c_id in(
		select c_id
		from a_bkorders.CustWithOrders
		where
			month(order_date) = @second_month
			and
			year(order_date) = @second_year
			)
	)
	and c_id not in(
		select c_id
		from a_bkorders.CustWithOrders
		where
			month(order_date) = @third_month
			and
			year(order_date) = @third_year
			);

/*  TASK 09 */

		select c_id, c_name
		from a_bkorders.CustWithOrders
		where
		c_id in(
			select c_id
			from a_bkorders.CustWithOrders
			where
				month(order_date) = @first_month
				and
				year(order_date) = @first_year
				)
		and c_id not in(
			select c_id
			from a_bkorders.CustWithOrders
			where
				month(order_date) = @second_month
				and
				year(order_date) = @second_year
				)
		and c_id not in(
			select c_id
			from a_bkorders.CustWithOrders
			where
				month(order_date) = @third_month
				and
				year(order_date) = @third_year
				)
	UNION 
		select c_id, c_name
		from a_bkorders.CustWithOrders
		where
		c_id not in(
			select c_id
			from a_bkorders.CustWithOrders
			where
			month(order_date) = @first_month
			and
			year(order_date) = @first_year
			)
		and	c_id in(
			select c_id
			from a_bkorders.CustWithOrders
			where
				month(order_date) = @second_month
				and
				year(order_date) = @second_year
				)
		and c_id not in(
			select c_id
			from a_bkorders.CustWithOrders
			where
				month(order_date) = @third_month
				and
				year(order_date) = @third_year
				)
	UNION 
		select distinct c_id, c_name
		from a_bkorders.CustWithOrders
		where
	c_id not in(
		select c_id
		from a_bkorders.CustWithOrders
		where
			month(order_date) = @first_month
			and
			year(order_date) = @first_year
			)
	and c_id not in(
		select c_id
		from a_bkorders.CustWithOrders
		where
			month(order_date) = @second_month
			and
			year(order_date) = @second_year
			)
	and c_id in(
		select c_id
		from a_bkorders.CustWithOrders
		where
			month(order_date) = @third_month
			and
			year(order_date) = @third_year
			);

/*  TASK 10 */
