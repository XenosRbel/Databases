SELECT
  COUNT(*) AS count_all,
  DATE_TRUNC(
    'month',
    "admin_customers"."created_at" :: timestamptz AT TIME ZONE 'Europe/Minsk'
  ) AT TIME ZONE 'Europe/Minsk' AS date_trunc_month_admin_customers_created_at_timestamptz_at_time
FROM
  "admin_customers"
WHERE
  ("admin_customers"."created_at" IS NOT NULL)
GROUP BY
  DATE_TRUNC(
    'month',
    "admin_customers"."created_at" :: timestamptz AT TIME ZONE 'Europe/Minsk'
  ) AT TIME ZONE 'Europe/Minsk'
