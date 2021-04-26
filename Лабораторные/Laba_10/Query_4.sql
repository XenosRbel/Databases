SELECT "admin_orders".*
FROM "admin_orders"
INNER JOIN
    (SELECT "admin_orders"."id" AS pg_search_id,
            (ts_rank((to_tsvector('simple', coalesce("admin_orders"."id"::text, '')) || to_tsvector('simple', coalesce("admin_orders"."end_execution_at"::text, '')) || to_tsvector('simple', coalesce("admin_orders"."start_execution_at"::text, ''))), (''), 0)) AS rank
     FROM "admin_orders"
     WHERE ((to_tsvector('simple', coalesce("admin_orders"."id"::text, '')) || to_tsvector('simple', coalesce("admin_orders"."end_execution_at"::text, '')) || to_tsvector('simple', coalesce("admin_orders"."start_execution_at"::text, ''))) @@ (''))) AS pg_search_9142cd98d598ef1a4309f2 ON "admin_orders"."id" = pg_search_9142cd98d598ef1a4309f2.pg_search_id
ORDER BY pg_search_9142cd98d598ef1a4309f2.rank DESC,
         "admin_orders"."id" ASC
