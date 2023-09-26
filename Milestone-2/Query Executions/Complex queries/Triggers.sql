-- Trigger 1 for insertion of records in student university details on insertion in state_student_data. 
CREATE TRIGGER state_univ_insert AFTER insert ON state_student_data
for each row execute procedure Insert_records();

CREATE or REPLACE FUNCTION Insert_records() RETURNS TRIGGER as $state_univ_insert$
BEGIN
insert into state_university_details VALUES (NEW.state,NEW.organization_type,NEW.level);
RETURN NEW;
END;
$state_univ_insert$ LANGUAGE plpgsql;

SELECT * from state_university_details where organization_type='University at Buffalo';
SELECT * from state_student_data where organization_type='University at Buffalo';

insert INTO state_student_data values('New York','University at Buffalo','2-year','20','32.1','78.0');
delete from state_student_data where organization_type='University at Buffalo';

-- Trigger 2 for insertion of records in university demographic bcnf1w on insertion in state_student_data. 
CREATE TRIGGER univid_insert AFTER insert ON university_details
for each row execute procedure Insertrecords();

CREATE or REPLACE FUNCTION Insertrecords() RETURNS TRIGGER as $univid_insert$
BEGIN
insert into university_demographic_bcnf1w VALUES (NEW.universityid);
RETURN NEW;
END;
$univid_insert$ LANGUAGE plpgsql;

SELECT * from university_details order by universityid;
SELECT * from university_demographic_bcnf1w order by universityid;

-- insert INTO university_demographic_bcnf1w values('12345','Banglore');
INSERT into university_details values(12364,'Presidency university yelahanka');
delete from university_details where universityid = 12345;

-- insert trigger for state_details new state --
CREATE TRIGGER insert_state AFTER insert ON state_details
for each row execute procedure Insertrecords();

CREATE or REPLACE FUNCTION Insertrecords() RETURNS TRIGGER as $insert_state$
BEGIN
insert into university_demographic_bcnf4sc VALUES (NEW.state);
RETURN NEW;
END;
$insert_state$ LANGUAGE plpgsql;

-- insert into table state_details --
INSERT into state_details values('Karnataka',100);
insert into university_demographic_bcnf4sc values('Karnataka','Banglore');
select * from state_details order by state;
select * from university_demographic_bcnf4sc where state like'Kar%';


-- Update trigger query --
CREATE TRIGGER update_state AFTER UPDATE ON state_details
for each row execute procedure Update_records();

CREATE or REPLACE FUNCTION Update_records() RETURNS TRIGGER as $update_state$
BEGIN
insert into university_demographic_bcnf4sc VALUES (new.state);
RETURN NEW;
END;
$update_state$ LANGUAGE plpgsql;

-- Update Query --
update state_details set state='Karnataka' where stateid=100;

-- Showing tables --
select * from state_details order by stateid DESC;
select * from university_demographic_bcnf4sc where state like'Kar%';


-- delete Trigger for state 
CREATE TRIGGER delete_state AFTER DELETE ON state_details
for each row execute procedure Delete_records();

CREATE or REPLACE FUNCTION Delete_records() RETURNS TRIGGER as $delete_state$
BEGIN
DELETE from university_demographic_bcnf4sc where state=new.state;
RETURN NEW;
END;
$delete_state$ LANGUAGE plpgsql;

-- delete query
delete from state_details where state like 'Kar%';


