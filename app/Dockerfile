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

# copy entrypoint.sh
COPY ./entrypoint.sh .
RUN sed -i 's/\r$//g' entrypoint.sh
RUN chmod +x entrypoint.sh

# copy project
COPY . .

# run entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]