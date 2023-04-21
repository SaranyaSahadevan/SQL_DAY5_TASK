/* Execute explain plan for the end-result of the previous task and describe the performance tuning possibilities. */
/* ANSWER */

Explain plan help the user to give a better idea regarding how the framed query is being exceuted 
and what performance tunining strategies can be applied to the framed query for faster data retrival
Please find the explain plan for the task 2 query.

EXPLAIN PLAN FOR
SELECT
    s.first_name,
    s.last_name,
    round(AVG(g.test_grade),
          3)          AS average_grade,
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

Major perfomance tuning that can be done in the above query are:
(1) Round of the decimal columns to its nearest value so that its more redable to the user.
(2) Consider using materialized views for common queries, here we do have join of 2 
tables which can be written as a view and use it further.
(3) Group the reselt set based on students first and last name for more readbility and ranked from Ascending.
(4) Make an index for the following columns: teacher_1.student_grade.student_id and teacher_1.student.student_id.
(5) Create a covering index on the GROUP BY columns: teacher_1.student.first_name, teacher_1.student.last_name.
(6) Check that the SELECT statement's columns are included in the covering index.
(7) Make an index of the columns in the ORDER BY: teacher_1.student_grade.test_grade.
(8) Use query hints to compel the use of the generated indexes.
(9) Use EXPLAIN PLAN to test the query's performance and ensure that the indexes are being used.
(10) When applicable, use table and index splitting.
(11) Make certain that statistics are up to date.
(12) Monitor query performance and make necessary adjustments.

