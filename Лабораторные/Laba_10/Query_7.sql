SELECT "admin_administrators".*
FROM "admin_administrators"
INNER JOIN
    (SELECT "admin_administrators"."id" AS pg_search_id,
            (ts_rank((to_tsvector('simple', coalesce("admin_administrators"."id"::text, '')) || to_tsvector('simple', coalesce("admin_administrators"."email"::text, '')) || to_tsvector('simple', coalesce("admin_administrators"."first_name"::text, '')) || to_tsvector('simple', coalesce("admin_administrators"."last_name"::text, '')) || to_tsvector('simple', coalesce("admin_administrators"."father_name"::text, '')) || to_tsvector('simple', coalesce("admin_administrators"."phone_number"::text, '')) || to_tsvector('simple', coalesce("admin_administrators"."role"::text, ''))), (''), 0)) AS rank
     FROM "admin_administrators"
     WHERE ((to_tsvector('simple', coalesce("admin_administrators"."id"::text, '')) || to_tsvector('simple', coalesce("admin_administrators"."email"::text, '')) || to_tsvector('simple', coalesce("admin_administrators"."first_name"::text, '')) || to_tsvector('simple', coalesce("admin_administrators"."last_name"::text, '')) || to_tsvector('simple', coalesce("admin_administrators"."father_name"::text, '')) || to_tsvector('simple', coalesce("admin_administrators"."phone_number"::text, '')) || to_tsvector('simple', coalesce("admin_administrators"."role"::text, ''))) @@ (''))) AS pg_search_d18d8297d789de45c6e298 ON "admin_administrators"."id" = pg_search_d18d8297d789de45c6e298.pg_search_id
ORDER BY pg_search_d18d8297d789de45c6e298.rank DESC,
         "admin_administrators"."id" ASC
