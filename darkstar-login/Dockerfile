FROM darkstar-server-base:latest

COPY docker-entrypoint.sh /usr/local/bin/

# add darkstar user and fix permissions
RUN chmod a+x /usr/local/bin/docker-entrypoint.sh

USER darkstar
EXPOSE 54230 54231 54001
WORKDIR /darkstar

USER darkstar

WORKDIR /darkstar
CMD ["docker-entrypoint.sh"]