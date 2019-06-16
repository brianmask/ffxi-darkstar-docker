FROM darkstar-server-base:latest

COPY etc/ etc/
COPY docker-entrypoint.sh /usr/local/bin/

# add darkstar user and fix permissions
RUN chmod a+x /usr/local/bin/docker-entrypoint.sh

USER darkstar
EXPOSE 54230 54230/udp 54231 54231/udp 54232/udp 54233/udp 54234/udp 54235/udp 54236/udp 54001 54002
WORKDIR /darkstar

USER darkstar

WORKDIR /darkstar
CMD ["docker-entrypoint.sh"]