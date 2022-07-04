--45
SELECT name FROM Ships WHERE name LIKE ('% % %')
UNION
SELECT ship FROM Outcomes WHERE ship LIKE ('% % %')


--62
SELECT T1.remain - T2.remain AS total
FROM   (SELECT Sum(inc) remain
        FROM   income_o
        WHERE  date < '2001-04-15') T1,
       (SELECT Sum(out) remain
        FROM   outcome_o
        WHERE  date < '2001-04-15') T2



--64
SELECT income.point,
       income.date,
       'inc'           AS operation,
       Sum(income.inc) AS money_sum
FROM   income
       FULL JOIN outcome
              ON income.date = outcome.date
                 AND income.point = outcome.point
WHERE  outcome.out IS NULL
GROUP  BY income.point,
          income.date
UNION
SELECT outcome.point,
       outcome.date,
       'out'            AS operation,
       Sum(outcome.out) AS money_sum
FROM   income
       FULL JOIN outcome
              ON income.date = outcome.date
                 AND income.point = outcome.point
WHERE  income.inc IS NULL
GROUP  BY outcome.point,
          outcome.date 


--93
SELECT T.NAME,
       Sum (CASE
              WHEN Datediff(minute, T.time_out, T.time_in) < 0 THEN
              Datediff(minute, T.time_out, T.time_in) + 1440
              ELSE Datediff(minute, T.time_out, T.time_in)
            END) AS Duration
FROM   (SELECT DISTINCT company.NAME,
                        trip.trip_no,
                        date,
                        trip.time_out,
                        trip.time_in
        FROM   pass_in_trip
               JOIN trip
                 ON trip.trip_no = pass_in_trip.trip_no
               JOIN company
                 ON company.id_comp = trip.id_comp) T
GROUP  BY T.NAME 


--96
WITH r
     AS (SELECT v.v_name,
                v.v_id,
                Count(CASE
                        WHEN v_color = 'R' THEN 1
                      END)
                  OVER(
                    partition BY v_id)   cnt_r,
                Count(CASE
                        WHEN v_color = 'B' THEN 1
                      END)
                  OVER(
                    partition BY b_q_id) cnt_b
         FROM   utv v
                JOIN utb b
                  ON v.v_id = b.b_v_id)
SELECT v_name
FROM   r
WHERE  cnt_r > 1
       AND cnt_b > 0
GROUP  BY v_name 