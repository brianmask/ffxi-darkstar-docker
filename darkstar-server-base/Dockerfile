FROM alpine/git as initial

ENV DS_BRANCH=master

RUN git clone --depth=1 -b ${DS_BRANCH} https://github.com/brianmask/darkstar.git/ /darkstar && \
  git clone --depth=1 -b ${DS_BRANCH} https://github.com/brianmask/xiNavmeshes.git /darkstar/navmeshes

FROM i386/debian:buster-slim

COPY --from=initial /darkstar /darkstar

RUN apt-get update && \
  apt-get install -y software-properties-common build-essential autoconf \
  g++-7  libzmq3-dev liblua5.1-dev libluajit-5.1-dev libmariadb-dev-compat && \
  cd /darkstar && \
  sh autogen.sh && \
  ./configure && \
  make -j12 && \
  rm -rf /darkstar/src && \
  rm -rf /darkstar/sql && \
  rm -rf /darkstar/*.o && \
  rm -rf /darkstar/.git && \
  apt-get autoremove -y build-essential autoconf pkg-config software-properties-common && \
  rm -rf /var/lib/apt/lists/* && \
  groupadd -r darkstar && \
  useradd -g darkstar -ms /bin/bash darkstar && \
  chown -R darkstar:darkstar /darkstar
