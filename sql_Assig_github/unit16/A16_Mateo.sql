/* Wilson Mateo */

\W    /* enable warnings! */

use a_testbed;

/*  TASK 00 */ 
select user(), current_date(), version(), @@sql_mode\G

/*  TASK 01 */

select 
  extractValue(an_data, '//cl_name') as Clients
, extractValue(an_data, '/client/@cl_id') as ClientID
from a_testbed.xml_animals
where an_data like '%<an_type>cat</an_type>%'
;

/*  TASK 02 */
select 
  extractValue(an_data, '/client/@cl_id') as id
, extractValue(an_data, '//cl_name') as name
from a_testbed.xml_animals
where extractValue(an_data, 'count(//an_type[self:text()="cat"])') > 0
;

/*  TASK 03 */
select 
  extractValue(an_data, '//cl_name') as Clients
, extractValue(an_data, '/client/@cl_id') as ClientsID
, extractValue(an_data, 'count(//an_id)') as NumberOfAnimals
from a_testbed.xml_animals
order by extractValue(an_data, 'count(//an_id)') desc;

/*  TASK 04 */
select 
 extractValue(an_data, '//cl_name') as Clients
, extractValue(an_data, '/client/@cl_id') as ClientsID
, concat (
	extractValue(an_data, '//animal[1]/an_type[1]') 
	,
	' named '
	,
	extractValue(an_data, '//animal [1]/an_name[1]')
	)
	as Animal_First
from a_testbed.xml_animals;

/*  TASK 05 */
select 
  extractValue(an_data, '//cl_name') as Clients
, extractValue(an_data, '/client/@cl_id') as ClientsID
, concat (
	extractValue(an_data, '//animal[1]/an_type[1]') 
	,
		case when extractValue(an_data, '//animal[1]/an_name[1]') = '' then
			' with no name '
		else
			' named '
		end
	,
	extractValue(an_data, '//animal[1]/an_name[last()]')
	)
	as Animal_First
from a_testbed.xml_animals;

/*  TASK 06 */
select 
  extractValue(an_data, '//cl_name') as Clients
, extractValue(an_data, '//client/@cl_id') as ClientsID
, extractValue(an_data, '//animal[2]/an_id[1]') as one
, extractValue(an_data, '//animal[3]/an_id[1]') as two
from a_testbed.xml_animals
where 
	(
		extractValue(an_data, '//animal[2]/an_id[1]') = extractValue(an_data, '//animal[last()]/an_id[1]')
		or
		extractValue(an_data, '//animal[3]/an_id[1]') = extractValue(an_data, '//animal[last()]/an_id[1]')
	)
	and 
	(
		extractValue(an_data, '//animal[2]/an_id[1]') != ''
		or
		extractValue(an_data, '//animal[3]/an_id[1]') != ''
	)
;

/*  TASK 07 */
select 
  extractValue(an_data, '/client/@cl_id') as id
, extractValue(an_data, '//cl_name') as name
from a_testbed.xml_animals
where 
extractValue(an_data, 'count(//animal[an_type="bird" and an_price = 250])');

/*  TASK 08 */
select 
  extractValue(an_data, '/client/@cl_id') as id
, extractValue(an_data, '//cl_name') as name
from a_testbed.xml_animals
where 
extractValue(an_data, 'count(//animal[an_type="bird" and an_price = 250])')
and 
extractValue(an_data, 'count(//an_type[self:text()="cat"])') >= 2
;

/*  TASK 09 */


/*  TASK 10 */
