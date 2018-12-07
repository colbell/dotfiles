select usename, count(*)
  from pg_stat_activity
 group by usename;
