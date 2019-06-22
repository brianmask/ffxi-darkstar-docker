FROM debian:buster as base

RUN apt-get update && \
    apt-get install git && \
    git clone --depth=1 -b master https://github.com/brianmask/pydarkstar.git /broker && \
    rm -rf /broker/.git

# base is just for the repo, no need to clutter the end result
FROM python:stretch

COPY --from=base /broker /broker 
COPY docker-entrypoint.sh /usr/local/bin/

# add darkstar user and fix permissions
RUN chmod a+x /usr/local/bin/docker-entrypoint.sh && \
    pip install -r /broker/requirements.txt && \
    groupadd -r broker && \
    useradd -g broker -ms /bin/bash broker && \
    chown -R broker:broker /broker


USER broker
WORKDIR /broker/bin

CMD ["docker-entrypoint.sh"]