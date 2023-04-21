/* To display student name, surname, average grade from all subjects, highest average grade in the class,
ranking in class */
SELECT
    s.first_name,
    s.last_name AS SURNAME,
    ROUND(AVG(g.test_grade),3) AS average_grade,
    MAX(g.test_grade) AS highest_average_grade,
    RANK()
    OVER(
        ORDER BY
            AVG(g.test_grade) DESC
    )                 AS ranking
FROM
         teacher_1.student s
    INNER JOIN teacher_1.student_grade g ON s.student_id = g.student_id
GROUP BY
    s.first_name,
    s.last_name;