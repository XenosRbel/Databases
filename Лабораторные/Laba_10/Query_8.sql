SELECT "admin_discounts".*
FROM "admin_discounts"
INNER JOIN
    (SELECT "admin_discounts"."id" AS pg_search_id,
            (ts_rank((to_tsvector('simple', coalesce("admin_discounts"."id"::text, '')) || to_tsvector('simple', coalesce("admin_discounts"."title"::text, '')) || to_tsvector('simple', coalesce("admin_discounts"."description"::text, ''))), (''), 0)) AS rank
     FROM "admin_discounts"
     WHERE ((to_tsvector('simple', coalesce("admin_discounts"."id"::text, '')) || to_tsvector('simple', coalesce("admin_discounts"."title"::text, '')) || to_tsvector('simple', coalesce("admin_discounts"."description"::text, ''))) @@ (''))) AS pg_search_03a30661506ae4e77ea6b4 ON "admin_discounts"."id" = pg_search_03a30661506ae4e77ea6b4.pg_search_id
ORDER BY pg_search_03a30661506ae4e77ea6b4.rank DESC,
         "admin_discounts"."id" ASC
