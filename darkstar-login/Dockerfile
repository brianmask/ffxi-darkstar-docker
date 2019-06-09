FROM darkstar-server-base:latest

COPY etc/ etc/
COPY docker-entrypoint.sh /usr/local/bin/

RUN chmod a+x /usr/local/bin/docker-entrypoint.sh

USER darkstar
EXPOSE 54230 54230/udp 54231 54001 54002
WORKDIR /darkstar

CMD ["docker-entrypoint.sh"]