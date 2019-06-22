FROM alpine:git as base

RUN git clone --depth=1 -b master https://github.com/brianmask/darkstar.git /darkstar

# No need to cluter the environment
FROM mariadb:10.4

COPY docker-entrypoint-initdb.d/ docker-entrypoint-initdb.d
COPY --from=base /darkstar/sql /docker-entrypoint-initdb.d/.seed/
COPY darkstar-db-entrypoint.sh /usr/local/bin

RUN chmod a+x /usr/local/bin/*.sh

ENTRYPOINT ["darkstar-db-entrypoint.sh"]

EXPOSE 3306

CMD ["mysqld"]