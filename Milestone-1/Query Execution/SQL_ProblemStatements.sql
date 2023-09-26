-- Query1==> To find the University id and University name with Higghest number of students.
select university_details.universityid,
university_details.university_name,university_award_details.student_count
from university_details 
join university_award_details 
ON university_award_details.universityid = university_details.universityid
where university_award_details.student_count=(
                                              select max(u1.student_count)  
											  from university_award_details u1);

	
-- Query 2 ==> Find total number of Male in California along with their stateid.
SELECT state_details.stateid,state_details.state,
       state_student_data.gender,COUNT(state_student_data.gender)
	   AS Gender_count
	   FROM state_details JOIN state_student_data USING(state)
	   WHERE state_student_data.gender='Male' 
	   AND state_details.state='California'
	   GROUP BY state_details.stateid,state_details.state,state_student_data.gender;



-- --Query 3 ==> For specific college type starting with research universities, 
--               find the universityid,name of university along with passing 
--               rate in its decreasing order.
SELECT university_details.universityid,university_details.university_name,
       university_demographic_details.specific_college_type,
	   university_progress_details.passing_rate
	   FROM university_details,university_demographic_details,
	   university_progress_details
	   WHERE university_details.universityid = university_demographic_details.universityid
	   AND university_details.universityid = university_progress_details.universityid
	   AND university_demographic_details.specific_college_type LIKE'Research%'
	   ORDER BY university_progress_details.passing_rate DESC;
	   

-- query 4 ==> Find states having more than 50 universities in their descending order based on
--                universities count.
EXPLAIN ANALYSE SELECT university_award_details.state,
       count(university_details.universityid)
	   AS Universities_Count
	   FROM university_award_details
	   INNER JOIN university_details
	   ON university_details.universityid = university_award_details.universityid
	   GROUP BY university_award_details.state
	   HAVING count(university_details.universityid) >50
       ORDER BY count(university_details.universityid) DESC ;

	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
