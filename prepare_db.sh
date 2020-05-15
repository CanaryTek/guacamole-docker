source "./.env"

echo "Preparing MySQL initialization data for guacamole database"

DB_INIT_DIR=./data/mysql/docker-entrypoint-initdb.d

mkdir -p "${DB_INIT_DIR}"
docker run --rm "${GUACAMOLE_CLIENT_IMAGE}" /opt/guacamole/bin/initdb.sh --mysql \
    > "${DB_INIT_DIR}/init_db.sql"

