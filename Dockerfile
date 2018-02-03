FROM alpine:latest

ENV APP_USER appuser
RUN adduser -g "App User" -D $APP_USER
COPY crontab /var/spool/cron/crontabs/$APP_USER
RUN chmod 0600 /var/spool/cron/crontabs/$APP_USER

COPY crontab /etc/periodic/15min

CMD ["crond", "-f", "-d", "8"]

