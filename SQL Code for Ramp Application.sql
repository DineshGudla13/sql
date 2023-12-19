/* Using this dataset, show the SQL query to find the rolling 3 day average transaction amount for each day in January 2021. */

with transactions_table as (
SELECT Date(transaction_time) as transaction_time,
sum(transaction_amount) as transaction_amount
from transactions
group by Date(transaction_time)
order by Date(transaction_time))

SELECT
  transaction_time,
  AVG(transaction_amount) OVER (ORDER BY transaction_time ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS rolling_3day_avg
FROM
  transactions_table
ORDER BY
  transaction_time;