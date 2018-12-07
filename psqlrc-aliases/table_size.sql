SELECT nspname || '.' || relname AS "relation", relkind,
       pg_size_pretty(pg_relation_size(C.oid)) AS "size",
       pg_size_pretty(pg_total_relation_size(C.oid)) AS "Total Size"
  FROM pg_class C
         LEFT JOIN pg_namespace N
             ON (N.oid = C.relnamespace)
 WHERE nspname NOT IN ('pg_catalog', 'information_schema')
 ORDER BY pg_relation_size(C.oid) DESC;
