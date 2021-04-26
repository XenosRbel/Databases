SELECT "admin_discounts".*
FROM "admin_discounts"
WHERE "admin_discounts"."start_date_at" < "admin_discounts"."end_date_at"
    AND "admin_discounts"."end_date_at" > now()
