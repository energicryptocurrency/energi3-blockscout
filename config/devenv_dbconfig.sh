#!/bin/sh

if test -z "$TRAVIS"; then
    apt-get update

    # Install
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
        postgresql

    # Listen on all interfaces
    echo "listen_addresses = '*'" >> /etc/postgresql/*/main/postgresql.conf
    echo "host all all 0/0 md5" >> /etc/postgresql/*/main/pg_hba.conf

    # Restart services
    systemctl restart postgresql.service
fi

# Add test users
su -c 'psql -c "CREATE DATABASE vagrant;"' postgres
su -c "psql -c \"CREATE ROLE vagrant  WITH SUPERUSER LOGIN PASSWORD 'vagrant'\"" postgres

su -c 'psql -c "CREATE EXTENSION IF NOT EXISTS 'pg_trgm';"' vagrant
su -c 'psql -c "CREATE EXTENSION IF NOT EXISTS 'citext';"' vagrant
su -c 'psql -c "CREATE EXTENSION IF NOT EXISTS 'btree_gist';"' vagrant
