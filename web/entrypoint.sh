#!/bin/sh

# Apply database migrations
python manage.py migrate

# Create superuser if it doesn't exist
if [ -n "$DJANGO_SUPERUSER_USERNAME" ] && [ -n "$DJANGO_SUPERUSER_PASSWORD" ] && [ -n "$DJANGO_SUPERUSER_EMAIL" ]; then
    python manage.py createsuperuser --noinput || true
fi

# Collect static files
python manage.py collectstatic --noinput

# Start server
exec "$@"