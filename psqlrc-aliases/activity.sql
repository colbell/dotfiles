select datname, pid, usename, application_name,client_addr, client_hostname, client_port, query, state
  from pg_stat_activity;
