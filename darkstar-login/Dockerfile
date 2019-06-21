FROM darkstar-server-base:latest

COPY docker-entrypoint.sh /usr/local/bin/

# add darkstar user and fix permissions
RUN apt-get update && \
  apt-get install python-pip && \
  pip install supervisor supervisor-stdout && \
  rm -rf /var/lib/apt/lists/* && \
  chmod a+x /usr/local/bin/docker-entrypoint.sh

USER darkstar
EXPOSE 54230 54231 54001 54002 54003
WORKDIR /darkstar

CMD ["docker-entrypoint.sh"]