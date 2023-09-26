CREATE TABLE state_details(state varchar(40) primary key, stateid integer);
select * from state_details;

CREATE TABLE University_details(universityid integer primary key,university_name varchar(200));
drop table university_demographic_details;

CREATE TABLE University_Demographic_details (universityid integer ,
											 level varchar(20),
											 institution_type varchar(50),
											 specific_college_type varchar(80),
											 primary key(universityid,level,institution_type,specific_college_type),
											 foreign key(universityid) REFERENCES University_details ON delete cascade on update cascade);
CREATE TABLE University_Demographic_bcnf1w (universityid integer primary key,
											 website varchar(300),
											 foreign key(universityid) REFERENCES University_details ON delete cascade on update cascade);
CREATE TABLE University_Demographic_bcnf2c (universityid integer primary key,
											 city varchar(40),
											 foreign key(universityid) REFERENCES University_details ON delete cascade on update cascade);
CREATE TABLE University_Demographic_bcnf3s (universityid integer primary key,
											 state varchar(40),
											 foreign key(state) REFERENCES state_details,
											 foreign key(universityid) REFERENCES University_details ON delete cascade on update cascade);
CREATE TABLE University_Demographic_bcnf4sc (state varchar(40),
											 city varchar(40),
											 foreign key(state) REFERENCES state_details ON delete cascade on update cascade);




drop table university_demographic_bcnf4sc;
-- SELECT * from university_demographic_details;
CREATE TABLE university_student_data(universityid integer,
									 year integer,
									 gender varchar(15),
									 race varchar(20),
									 program_type varchar(20),
									 passing_rate integer, foreign key(universityid) REFERENCES University_details ON delete cascade on update cascade);
select * from university_student_data;
drop table university_student_data;
CREATE TABLE state_student_data(state varchar(40),
								organization_type varchar(30) not NULL,
								level varchar(20),
								year integer not NULL,
								gender varchar(15),
								race varchar(20),
								primary key (state,organization_type,level,year,gender,race),
								foreign key(state) references state_details ON delete cascade on update cascade);
drop table state_student_data;
CREATE TABLE state_student_data_bcnf(state varchar(40),
								state_abbrevation varchar(10),
							    PRIMARY key(state,state_abbrevation),
								foreign key(state) references state_details ON delete cascade on update cascade);

drop table state_student_data_bcnf;
CREATE TABLE state_university_details(state varchar(40),
								organization_type varchar(30),
								level varchar(20),
							    university_count integer,
								counted_pct float8,
								awards_per_state_value float8,foreign key(state) references state_details ON delete cascade on update cascade);
drop table state_university_details;
CREATE TABLE university_award_details(universityid integer primary key,
									  state varchar(40),
									  student_count integer,
									  awards_per_value float8,
									  awards_per_state_value float8,
									  fte_value integer,foreign key(universityid) REFERENCES University_details ON delete cascade on update cascade);
drop table university_award_details;
CREATE TABLE university_progress_details(universityid integer primary key,
										 	med_sat_value integer,
											med_sat_percentile integer,
											grad_100_value float8,
											grad_100_percentile	integer,
											passing_rate float8,  foreign key(universityid) REFERENCES University_details ON delete cascade on update cascade);
drop table university_progress_details;
CREATE TABLE State_progress_details(state varchar(40),
									student_count integer,
									grad_100 float8,
									primary key(state),
									foreign key(state) references state_details ON delete cascade on update cascade,
									foreign key(student_count,grad_100) references State_progress_details_bcnf ON delete cascade on update cascade);
CREATE TABLE State_progress_details_bcnf(
									student_count integer,
									grad_100 float8,
									grad_100_rate float8,
									primary key(student_count,grad_100));
								
										

drop table state_progress_details;	
select * from state_university_details;
									  