# pull official base image
FROM python:3.14-slim

# set work directory
WORKDIR /app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# install dependencies
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/
COPY pyproject.toml uv.lock .
RUN uv sync --frozen --no-dev

# copy project
COPY . .

EXPOSE 8000
CMD ["uv", "run", "gunicorn", "hello_django.wsgi:application", "--bind", "0.0.0.0:8000"]

