FROM ubuntu:bionic AS initial

ENV DS_BRANCH=master

RUN apt-get update && \
  apt-get install -y software-properties-common build-essential autoconf \
  g++-7 libluajit-5.1-dev libzmq3-dev libmariadbclient-dev git && \
  git clone --depth=1 -b ${DS_BRANCH} http://github.com/brianmask/darkstar.git/ /darkstar && \
  cd /darkstar && \
  sh autogen.sh && \
  ./configure && \
  make -j12 && \
  rm -rf /darkstar/src && \
  rm -rf /darkstar/sql && \
  rm -rf /darkstar/*.o && \
  rm -rf /darkstar/.git

FROM ubuntu:bionic 

COPY --from=initial /darkstar /darkstar

RUN apt-get update && \
  apt-get install -y libluajit-5.1-dev libzmq3-dev libmariadbclient-dev && \
  rm -rf /var/lib/apt/lists/* && \
  groupadd -r darkstar && \
  useradd -g darkstar -ms /bin/bash darkstar && \
  chown -R darkstar:darkstar /darkstar
