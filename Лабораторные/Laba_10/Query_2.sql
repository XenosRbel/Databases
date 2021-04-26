SELECT
  COUNT(*) AS count_all,
  EXTRACT(
    DOW
    FROM
      "admin_orders"."created_at" :: timestamptz AT TIME ZONE 'Europe/Minsk'
  ) :: integer AS extract_dow_from_admin_orders_created_at_timestamptz_at_time_zo
FROM
  "admin_orders"
WHERE
  ("admin_orders"."created_at" IS NOT NULL)
GROUP BY
  EXTRACT(
    DOW
    FROM
      "admin_orders"."created_at" :: timestamptz AT TIME ZONE 'Europe/Minsk'
  ) :: integer
