FROM i386/debian:buster AS initial

ENV DS_BRANCH=master

RUN apt-get update && \
  apt-get install -y software-properties-common build-essential autoconf \
  g++-7 liblua5.1-0-dev libzmq3-dev libmariadb-dev-compat git && \
  git clone --depth=1 -b ${DS_BRANCH} http://github.com/brianmask/darkstar.git/ /darkstar && \
  cd /darkstar && \
  sh autogen.sh && \
  ./configure && \
  make -j12 && \
  rm -rf /darkstar/src && \
  rm -rf /darkstar/sql && \
  rm -rf /darkstar/*.o 

FROM i386/debian:buster 

COPY --from=initial /darkstar /darkstar

RUN apt-get update && \
  apt-get install -y liblua5.1-0-dev libzmq3-dev libmariadb-dev-compat && \
  rm -rf /var/lib/apt/lists/* && \
  groupadd -r darkstar && \
  useradd -g darkstar -ms /bin/bash darkstar && \
  chown -R darkstar:darkstar /darkstar
