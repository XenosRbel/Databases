SELECT
  COUNT(*) AS count_all,
  "admin_masters"."id" AS admin_masters_id
FROM
  "admin_orders"
  INNER JOIN "admin_masters" ON "admin_masters"."id" = "admin_orders"."admin_master_id"
GROUP BY
  "admin_masters"."id"
