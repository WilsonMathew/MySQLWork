/*Wilson Mateo*/

\W    /* enable warnings! */

use a_vets;

/*  TASK 00 */ 
select user(), current_date(), version(), @@sql_mode\G

/*  TASK 01 */
select
a.an_id
, an_type
, count(an_name)
, ex_fee
From vt_animals a
JOIN vt_exam_headers using (an_id)
JOIN vt_exam_details using (ex_id)
GROUP BY an_id
ORDER BY an_id;

/*  TASK 02 */
set @cur_date = year(current_date) -1;

select
c.cl_id
, cl_name_last
, coalesce(avg(ex_fee),'no exam') as AverageFee
, coalesce(max(ex_fee), 'no exam') as HighestFee
from vt_clients c
LEFT JOIN vt_animals an on c.cl_id = an.cl_id
LEFT JOIN vt_exam_headers eh on an.an_id = eh.an_id
LEFT JOIN vt_exam_details ed on eh.ex_id = ed.ex_id
where year(ex_date) = @cur_date
Group by c.cl_id
ORDER BY c.cl_id;

/*  TASK 03 */
set @cur_date = now();
set @test_year= year(@cur_date);

select
ex_date
, count(ex_date)
, count(distinct eh.an_id)
from vt_animals a 
JOIN vt_exam_headers eh on  a.an_id = eh.an_id
where quarter(ex_date) = quarter(date_add( @cur_date, interval -3 month ))
and year(ex_date) = if( quarter(@cur_date) = 1, @test_year-1,@test_year)
order by  ex_date;

/*  TASK 04 */


/*  TASK 05 */


/*  TASK 06 */


/*  TASK 07 */


/*  TASK 08 */


/*  TASK 09 */


/*  TASK 10 */
