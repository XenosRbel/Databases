SELECT SUM("admin_services"."price")
FROM "admin_services"
INNER JOIN "admin_orders_services" ON "admin_services"."id" = "admin_orders_services"."service_id"
WHERE "admin_orders_services"."order_id" = $1
