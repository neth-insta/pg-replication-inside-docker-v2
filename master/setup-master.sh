#!/bin/bash
echo "host replication all 10.0.20.151/24 md5" >> "$PGDATA/pg_hba.conf"
set -e
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
CREATE USER $PG_REP_USER REPLICATION LOGIN CONNECTION LIMIT 100 ENCRYPTED PASSWORD '$PG_REP_PASSWORD';
ALTER SYSTEM SET wal_level = 'hot_standby';
ALTER SYSTEM SET archive_mode = on;
ALTER SYSTEM SET archive_command = 'cd .';
ALTER SYSTEM SET max_wal_senders = 8;
ALTER SYSTEM SET wal_keep_segments = 8;
ALTER SYSTEM SET hot_standby = on;
ALTER SYSTEM SET primary_conninfo = 'host=pg_master port=5432 user=$PG_REP_USER password=$PG_REP_PASSWORD';
EOSQL