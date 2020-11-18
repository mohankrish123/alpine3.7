FROM alpine:3.7

# Installing packages MariaDB
RUN apk update && \
    apk --update --no-cache add mysql mysql-client
RUN addgroup mysql mysql

# Copy of the MySQL startup script
COPY scripts/start.sh start.sh
COPY my.cnf /etc/myql/my.cnf
# Creating the persistent volume
VOLUME [ "/var/lib/mysql" ]

ENTRYPOINT [ "./start.sh" ]
