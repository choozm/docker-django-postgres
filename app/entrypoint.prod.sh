#!/bin/sh

# Exit immediately if a command exits with a non-zero status
set -e

if [ "$DATABASE" = "postgres" ]
then
    echo "Verifying database connection..."
    # Quick, single check. If it fails, the script exits early.
    if ! nc -z $SQL_HOST $SQL_PORT; then
        echo "Database connection failed. Exiting."
        exit 1
    fi
    echo "Database is reachable."
fi

# Run production application tasks
echo "Running migrations..."
python manage.py migrate

echo "Collecting static files..."
python manage.py collectstatic --noinput

# Execute the main container command (passed from CMD in Dockerfile or docker-compose)
exec "$@"
