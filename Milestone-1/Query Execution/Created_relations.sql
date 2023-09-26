CREATE TABLE state_details(state varchar(40) primary key, stateid integer);

CREATE TABLE University_details(universityid integer primary key,university_name varchar(200));

CREATE TABLE University_Demographic_details (universityid integer primary key,
											 city varchar(40),
											 state varchar(40),
											 level varchar(20),
											 institution_type varchar(50),
											 specific_college_type varchar(80),
											 website varchar(300), foreign key(state) REFERENCES state_details,
											 foreign key(universityid) REFERENCES University_details);

CREATE TABLE university_student_data(universityid integer,
									 year integer,
									 gender varchar(15),
									 race varchar(20),
									 program_type varchar(20),
									 passing_rate integer, foreign key(universityid) REFERENCES University_details);

CREATE TABLE state_student_data(state varchar(40),
								state_abbrevation varchar(10),
								organization_type varchar(30),
								level varchar(20),
								year integer,
								gender varchar(15),
								race varchar(20),foreign key(state) references state_details);
CREATE TABLE state_university_details(state varchar(40),
								state_abbrevation varchar(10),
								organization_type varchar(30),
								level varchar(20),
							    university_count integer,
								counted_pct float8,
								awards_per_state_value float8,foreign key(state) references state_details);

CREATE TABLE university_award_details(universityid integer primary key,
									  state varchar(40),
									  student_count integer,
									  awards_per_value float8,
									  awards_per_state_value float8,
									  fte_value integer,foreign key(universityid) REFERENCES University_details);

CREATE TABLE university_progress_details(universityid integer primary key,
										 	med_sat_value integer,
											med_sat_percentile integer,
											grad_100_value float8,
											grad_100_percentile	integer,
											passing_rate float8,  foreign key(universityid) REFERENCES University_details);

CREATE TABLE State_progress_details(state varchar(40),
									program_type varchar(30),
									grad_100 integer,
									grad_100_rate float8,foreign key(state) references state_details);			
									  