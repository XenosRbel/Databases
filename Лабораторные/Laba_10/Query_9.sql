SELECT "admin_orders".*
FROM "admin_orders"
WHERE "admin_orders"."start_execution_at" < "admin_orders"."end_execution_at"
    AND "admin_orders"."end_execution_at" > now()
