# Dockerized Django with Postgres, Gunicorn, and Nginx

This project is an experiment to containerize a Django application using Docker, following the comprehensive guide from [TestDriven.io](https://testdriven.io/blog/dockerizing-django-with-postgres-gunicorn-and-nginx/).

## Overview

This setup demonstrates how to run a production-ready Django application using Docker containers with the following stack:

- **Django** - Python web framework
- **PostgreSQL** - Production-grade database
- **Gunicorn** - WSGI HTTP server for running Django
- **Nginx** - Reverse proxy and static file server

## Project Structure

```
├── app/                            # Django application
│   ├── hello_django/               # Django project package
│   │   ├── __init__.py
│   │   ├── asgi.py
│   │   ├── settings.py
│   │   ├── urls.py
│   │   └── wsgi.py
│   ├── Dockerfile                  # Development Dockerfile
│   ├── Dockerfile.prod             # Production Dockerfile
│   ├── entrypoint.sh               # Development entrypoint script
│   ├── entrypoint.prod.sh          # Production entrypoint script
│   ├── main.py
│   ├── manage.py                   # Django management script
│   ├── pyproject.toml              # Python dependencies
│   ├── uv.lock                     # UV lock file
│   └── .python-version             # Python version specification
├── docker/                         # Docker configuration files
│   ├── docker-compose.yml          # Development Compose configuration
│   └── docker-compose.prod.yml     # Production Compose configuration
├── .env.dev                        # Development environment variables
├── .env.prod                       # Production environment variables
├── .env.prod.db                    # Database environment variables
├── .gitignore
├── .python-version
├── README.md
├── main.py
├── pyproject.toml
└── uv.lock
```

## Quick Start

### Development

1. Build and run the development containers:
   ```bash
   docker-compose -f docker/docker-compose.yml up -d --build
   ```

2. Run migrations:
   ```bash
   docker-compose -f docker/docker-compose.yml exec web python manage.py migrate
   ```

3. Access the application at http://localhost:8000

### Production

For production deployment, the setup uses:
- Multi-stage Docker builds for optimization
- Gunicorn as the WSGI server
- Nginx as a reverse proxy
- Environment-specific configuration files

## Resources

- [TestDriven.io Guide - Dockerizing Django with Postgres, Gunicorn, and Nginx](https://testdriven.io/blog/dockerizing-django-with-postgres-gunicorn-and-nginx/)
- [Docker Documentation](https://docs.docker.com/)
- [Django Documentation](https://docs.djangoproject.com/)
- [Gunicorn Documentation](https://docs.gunicorn.org/)

## License

This project is for educational purposes.
