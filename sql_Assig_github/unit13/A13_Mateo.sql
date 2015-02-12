/*Wilson Mateo*/

\W    /* enable warnings! */

use   a_testbed;

/*  TASK 00 */ 
select user(), current_date(), version(), @@sql_mode\G

/*  TASK 01 */

--  upd populates
-- clear earlier versions of tables
delete from upd_exam_details;
delete from upd_exam_headers;
delete from upd_animals ;


--  animals ------------------
insert into upd_animals  values
  ( 100,  'Gutsy',       'cat',     'C')
, ( 101,  'Kenny',       'SNAKE',   'C')
, ( 102,  'Showboat',    'bird',    'C')
, ( 103,  'Mr Peanut',   'bird',    'NC')
, ( 104,  'Cartman',     'Cat',     'C')
, ( 105,  'Tweets',      'bird',    'C')
, ( 106,  'big mike',    'Turtle',  'C')
, ( 107,  'George',      'CAT',     'C')
, ( 108,  'Samuel',      'Mollusk', 'NC')
, ( 109,  'Mr C',        'Bird',    'C')
, ( 110,  'Mr C',        'dog',     'C')
, ( 111,  'Mr Peabody',  'Cat',     'C')
, ( 112,  'Mr Smithers', 'Cat',     'C')
, ( 113,  'Mr Whipple',  'Cat',     'NC')    
, (114,  'Mittens',     'Cat',      'NC');   
	   
-- exams and details  ------------------  

insert into upd_exam_headers  values 
  ( 1001,  '2012-01-18', 104)
, ( 1002,  '2013-01-18', 101)
, ( 1003,  '2011-09-18', 103)
, ( 1004,  '2011-10-22', 110)
, ( 1005,  '2013-02-28', 104)
, ( 1006,  '2011-03-18', 106)
, ( 1007,  '2010-01-18', 111)
, ( 1008,  '2009-02-02', 111)
, ( 1009,  '2011-03-02', 103)
, ( 1010,  '2009-01-30', 109)
, ( 1011,  '2011-12-15', 108)
, ( 1012,  '2012-10-02', 107)
, ( 1013,  '2013-02-22', 110)
, ( 1014,  '2012-03-25', 109)
, ( 1015,  '1995-03-25', 114)
, ( 1016,  '2012-10-15', 113)
, ( 1017,  '2012-10-25', 113)
;

insert into upd_exam_details values
  ( 1001, 104, 45.00)
, ( 1001, 123, 26.00)
, ( 1002, 106, 25.00)
, ( 1002, 123, 26.00)
, ( 1003, 101, 35)
, ( 1003, 122, 35.00)
, ( 1003, 124, 10)
, ( 1005, 104, 50)
, ( 1005, 125, 75.00)
, ( 1006, 105, 25)
, ( 1006, 122, 35.00)
, ( 1006, 123, 26.00)
, ( 1006, 124, 15.00)
, ( 1007, 104, 45.00)
, ( 1007, 123, 26.00)
, ( 1008, 110, 26.00)
, ( 1009, 102, 32.00)
, ( 1009, 121, 26.00)
, ( 1010, 104, 40)
, ( 1010, 108, 15.00)
, ( 1010, 126, 30)
, ( 1011, 105, 45)
, ( 1012, 104, 35.00)
, ( 1012, 123,  0.00)
, ( 1013, 104, 60)
, ( 1013, 143, 15.00)
, ( 1014, 104, 40)
, ( 1015, 104, 140.25)   
, ( 1016, 951, 40)
, ( 1017, 235, 40)
;

-- clear earlier versions of tables
delete from upd_services_changes_4;
delete from upd_services_changes_3;
delete from upd_services_changes_2;
delete from upd_services_changes_1;

delete from upd_services ;

   
-- services ------------------
insert into upd_services values
  ( 100, 'Consult- no charge',            0.00)
, ( 101, 'Routine Exam- Bird',           35.00)
, ( 102, 'Followup Exam-Bird',           32.00)
, ( 103, 'Routine Exam-Feline',          50.00)
, ( 104, 'Followup Exam-Feline',         45.00)
, ( 105, 'Routine Exam-Reptile',         25.00)
, ( 106, 'Followup Exam-Reptile',        23.00)
, ( 107, 'Rabies_V-2008 SFall-Canine',   15.00)
, ( 108, 'Rabies_V-2008 SFall-Feline',   15.00)
, ( 109, 'Rabies_Ve-2008 Spring-Canine', 25.00)
, ( 110, 'Rabies_V-2008 Spring-Feline',  25.00)
, ( 111, 'Rabies_V-Rodent',              20.00)
, ( 112, 'Rabies_V-2008 Winter-Canine',  15.00)
, ( 118, 'First Feline PCR',             20.25)
, ( 119, 'Second Feline PCR',            20.25)
, ( 120, 'Third Feline PCR',             20.25)
, ( 121, 'Flu Rhino Vacc',               26.00)
, ( 122, 'Scaly Mite',                   35.00)
, ( 123, 'Intestinal Parasite Screen',   26.00)
, ( 124, 'Tick Removal',                 15.00)
, ( 125, 'Behaviour Modification',       75.00)
, ( 126, 'Vitamin E- Concentrated',      30.00)
, ( 127, 'Sedative-Feline',              25.00)
, ( 128, 'Flea Treatment- Small Animal', 35.00)
, ( 129, 'Flea Treatment- Large Animal', 50.00)
, ( 143, 'Rabies_V-2010 SFall-Canine',   15.00)
, ( 144, 'Rabies_V-2010 SFall-Feline',   15.00)
, ( 145, 'Rabies_V-2010 Spring-Canine',  25.00)
, ( 146, 'Rabies_V-2010 Spring-Feline',  25.00)
, ( 147, 'Rabies_V-2010 Winter-Canine',  15.00)
;
   

-- Populate the changes tables
-- Version 1 -----------------------------------------------------------

insert into upd_services_changes_1 value
  ( 130, 'Routine Exam- Canine',         55.00)
, ( 131, 'Followup Exam- Canine',        35.00)
, ( 132, 'Dental Cleaning-Canine',       50.00)
, ( 133, 'Dental Cleaning-Feline',       45.00)
, ( 113, 'Amphib skin Ointment',         75.00)
, ( 116, 'Reptile dental procedure',    175.00)
, ( 117, 'Amphib dental procedure',     375.00);
	   
	   
-- Version 2-----------------------------------------------------------
insert into upd_services_changes_2 values
  ( 134, 'Vitamin E series',             55.00) 
, ( 135, 'Feline PCR Series',            75.00) 
, ( 114, 'H1N1 vaccine',                 75.00) 
, ( 115, 'H1N2 vaccine',                 75.00) 
, ( 127, 'Sedative- small mammal',       75.00)
, ( 111, 'Rabies_V-Rodent',              25.00); 


-- Version 3-----------------------------------------------------------
insert into upd_services_changes_3 values
  ( 128, 'Flea Treatment- Small Animal', 45.00)  
, ( 111, '',                             35.25) 
, ( 122, 'Scaly Mite Powder',             null) 
, ( 138, 'Flu Rhino Vaccine enhanced',  125.00) 
, ( 124, null,                           25.95) 
, ( 129, 'Flea Treatment- Large Animal', 65.00)  
, ( 136, 'Hazardous Materials Disposal', 10.50) 
, ( 126, 'Vitamin E- Concentrated',      45.00)
, ( 106, '',                             30.00)
, ( 105, Null,                           35.00); 


-- Version 4-----------------------------------------------------------
insert into upd_services_changes_4 values
  ( 137, 'Antibiotic 500mg',            200.00)
, ( 127, 'Sedative-Feline',              95.50)
, ( 138, 'Antibiotic 100mg',             45.00)
, ( 139, 'Antibiotic 250mg',            145.00)
, ( 140, 'Fish Hook Removal',            20.00)
, ( 141, 'Fox Tail Removal',              0.00)
, ( 112, 'Rabies_V-2008 Winter-Canine', -15.00)
, ( 116, 'Reptile dental procedure',    225.00)
, ( 128, 'Flea Treatment- Small Animal', 37.50); 

select * from upd_animals;
select * from upd_exam_details;
select * from upd_exam_headers;
select * from upd_services;

/*  TASK 02 */
update upd_animals
set an_status = 'NC'
where an_id not in
(
	select an_id
	from upd_exam_headers
	where ex_date between
	date_add(current_date,interval  -18 month)
	and 
	current_date
);

select * from upd_animals
order by an_status, an_id;

/*  TASK 03 */

drop table if exists upd_nc_felines;

create table upd_nc_felines as
select A.an_id, an_name, ex_date, sum(ex_fee)
from a_testbed.upd_animals A
join a_testbed.upd_exam_headers UEH using(an_id)
join a_testbed.upd_exam_details UED using(ex_id)
where an_type = 'cat' and an_status = 'NC'
group by an_id;

select * 
from upd_nc_felines
order by an_id;

/*  TASK 04 */
replace into a_testbed.upd_services
select * 
from a_testbed.upd_services_changes_1
where item_id not in
	(
		select srv_id
		from a_testbed.upd_services
	)
;

select *
from a_testbed.upd_services
order by srv_id;

/*  TASK 05 */

 
replace into a_testbed.upd_services
select * 
from a_testbed.upd_services_changes_2
where item_id in
	(
		select srv_id
		from a_testbed.upd_services
	)
	and item_desc is not null
	and item_list_price is not null
;

select *
from a_testbed.upd_services
order by srv_id;

/*  TASK 06 */

replace into a_testbed.upd_services
select * 
from a_testbed.upd_services_changes_3
where 
item_list_price between 0 and 100
and item_desc is not null
;

select *
from a_testbed.upd_services
order by srv_id;

/*  TASK 07 */


/*  TASK 08 */


/*  TASK 09 */


/*  TASK 10 */
