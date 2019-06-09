FROM i386/ubuntu:bionic

ENV DS_BRANCH=master

RUN apt-get update && \
  apt-get install -y python-pip python-setuptools && \
  python /usr/lib/python2.7/dist-packages/easy_install.py supervisor && \
  pip install supervisor-stdout && \
  
COPY --from=darkstar-server-base /darkstar /darkstar  
COPY etc/ etc/
COPY docker-entrypoint.sh /usr/local/bin/

# add darkstar user and fix permissions
RUN groupadd -r darkstar && \
  useradd -g darkstar -ms /bin/bash darkstar && \
  chown -R darkstar:darkstar /darkstar && \
  chmod a+x /usr/local/bin/docker-entrypoint.sh

USER darkstar
EXPOSE 54230 54230/udp 54231 54001 54002
WORKDIR /darkstar

CMD ["docker-entrypoint.sh"]