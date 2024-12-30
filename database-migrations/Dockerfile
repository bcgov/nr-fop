FROM flyway/flyway:latest

# Non-root user
RUN adduser -D app
USER app

COPY ./sql sql

CMD ["info", "migrate", "info"]
