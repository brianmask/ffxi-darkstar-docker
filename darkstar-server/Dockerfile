FROM brianmask/darkstar-server-base:latest

ENV PORT ${PORT:-54230}
COPY docker-entrypoint.sh /usr/local/bin/

# add darkstar user and fix permissions
RUN chmod a+x /usr/local/bin/docker-entrypoint.sh

USER darkstar
EXPOSE ${PORT}/udp
WORKDIR /darkstar

USER darkstar

WORKDIR /darkstar
CMD ["docker-entrypoint.sh"]