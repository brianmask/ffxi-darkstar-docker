FROM alpine/git as base

RUN git clone --depth=1 -b master https://github.com/brianmask/pydarkstar.git /broker && \
    rm -rf /broker/.git

# base is just for the repo, no need to clutter the end result
FROM python:3.7-alpine

COPY --from=base /broker /broker 
COPY docker-entrypoint.sh /usr/local/bin/

# add darkstar user and fix permissions
RUN chmod a+x /usr/local/bin/docker-entrypoint.sh && \
    pip install beautifulsoup4 pymysql pyyaml six sqlalchemy

WORKDIR /broker/bin

CMD ["docker-entrypoint.sh"]