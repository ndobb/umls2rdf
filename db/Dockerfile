FROM mariadb:10.4

# Bug, see https://github.com/docker-library/mariadb/issues/160
ENV MYSQL_INITDB_SKIP_TZINFO=yes

# Copy UMLS-tuned config
COPY my.cnf /etc/mysql/