FROM python:3.11.8-alpine

WORKDIR /app
RUN mkdir /app/static

ENV PYTHONFAULTHANDLER=1 \
    PYTHONHASHSEED=random \
    PYTHONUNBUFFERED=1

RUN apk add --update --no-cache --virtual .tmp-build-deps \
    postgresql-client libc-dev build-base postgresql-dev linux-headers gcc gettext openssh-client && \
    pip install --upgrade pip && pip install --no-cache-dir poetry


COPY poetry.lock pyproject.toml /app/
RUN poetry config virtualenvs.create false \
    && poetry install --no-interaction --no-ansi


COPY auto_app /app

EXPOSE 8000
