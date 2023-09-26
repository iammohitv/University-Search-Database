-- State_progress_details table values insertion
insert into state_progress_details (state,program_type,grad_100,grad_100_rate)
select state_b5,program_type_b5,grad_100,grad_100_rate from complet_details;

select * from state_progress_details;

-- State_student_data table values insertion
insert into state_student_data
select state_b1,state_abbrevation_b1,organization_type_b1,level_b1,year_b1,gender_b1,race_b1
from complet_details;

select * from state_progress_details;

-- State_university_details table values insertion
insert into state_university_details
select state_b2,state_abbrevation_b2,organization_type_b2,level_b2,university_count,counted_pct,awards_per_state_value_b2
from complet_details;

select * from state_university_details;

-- University_award_details table values insertion
insert into university_award_details
select universityid_pub,state_b3,student_count,awards_per_value,awards_per_state_value_b3,fte_value
from complet_details;

select * from university_award_details;

-- University_demographic_details table values insertion
insert into university_demographic_details
select universityid_pub,city,state_b4,level_b4,institution_type,specific_college_type,website
from complet_details;

select * from university_demographic_details;

-- University_progress_details table values insertion
insert into university_progress_details
select universityid_pub,med_sat_value,med_sat_percentile,grad_100_value,grad_100_percentile,passing_rate_med
from complet_details;

select * from university_progress_details;

-- University_student_data table values insertion
insert into university_student_data
select universityid_priv,year,gender_b6,race_b6,program_type_b6,passing_rate_b6
from complet_details;

select * from university_student_data;

