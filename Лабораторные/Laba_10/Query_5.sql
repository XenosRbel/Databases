SELECT "admin_customers".*
FROM "admin_customers"
INNER JOIN
    (SELECT "admin_customers"."id" AS pg_search_id,
            (ts_rank((to_tsvector('simple', coalesce("admin_customers"."id"::text, '')) || to_tsvector('simple', coalesce("admin_customers"."first_name"::text, '')) || to_tsvector('simple', coalesce("admin_customers"."last_name"::text, '')) || to_tsvector('simple', coalesce("admin_customers"."father_name"::text, '')) || to_tsvector('simple', coalesce("admin_customers"."phone_number"::text, ''))), (''), 0)) AS rank
     FROM "admin_customers"
     WHERE ((to_tsvector('simple', coalesce("admin_customers"."id"::text, '')) || to_tsvector('simple', coalesce("admin_customers"."first_name"::text, '')) || to_tsvector('simple', coalesce("admin_customers"."last_name"::text, '')) || to_tsvector('simple', coalesce("admin_customers"."father_name"::text, '')) || to_tsvector('simple', coalesce("admin_customers"."phone_number"::text, ''))) @@ (''))) AS pg_search_896be043ed711de23d4140 ON "admin_customers"."id" = pg_search_896be043ed711de23d4140.pg_search_id
ORDER BY pg_search_896be043ed711de23d4140.rank DESC,
         "admin_customers"."id" ASC
