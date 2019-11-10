FROM python:3.8-slim

WORKDIR /app
COPY . .
RUN pip install flask gunicorn

ENV LISTEN_PORT=8000

CMD exec gunicorn --bind :$LISTEN_PORT --workers 1 --threads 8 app:app
