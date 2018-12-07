SELECT pg_stat_activity.pid, pg_stat_activity.wait_event, pg_stat_activity.wait_event_type,
       now() - pg_stat_activity.query_start AS "totaltime", pg_stat_activity.backend_start,
       pg_stat_activity.query
  FROM pg_stat_activity
 WHERE pg_stat_activity.query !~ '%IDLE%'::text;
