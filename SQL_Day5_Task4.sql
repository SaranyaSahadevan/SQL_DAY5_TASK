/* To display teacher names, surnames and the number of days of how long has each of the teachers worked at
the school, split the respective result in 3 parts: 0-3 years, 3-5 years, 5+ years – show both the numeric result and the
according group. */

SELECT
    first_name,
    last_name AS SURNAME,
    ROUND(current_date - date_of_joining, 4) AS days_worked,
    CASE
        WHEN current_date - date_of_joining BETWEEN 0 AND 1095    THEN
            '0-3 years'
        WHEN current_date - date_of_joining BETWEEN 1096 AND 1825 THEN
            '3-5 years'
        ELSE
            '5+ years'
    END                            AS grouping
    
FROM
    teacher_1.teacher;
    
  
    
