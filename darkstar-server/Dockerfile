FROM i386/debian:buster

ENV DS_BRANCH=master

RUN apt-get update && \
  apt-get install -y software-properties-common build-essential autoconf python2 \
  python-pip g++-7 liblua5.1-0-dev libzmq3-dev libmariadb-dev-compat git && \
  pip install supervisor supervisor-stdout && \
  git clone --depth=1 -b ${DS_BRANCH} http://github.com/brianmask/darkstar.git/ /darkstar && \
  cd /darkstar && \
  sh autogen.sh && \
  ./configure --enable-debug=gdb && \
  make -j12 && \
  apt-get autoremove -y build-essential git autoconf pkg-config software-properties-common python-pip && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /darkstar/src && \
  rm -rf /darkstar/sql && \
  groupadd -r darkstar && \
  useradd -g darkstar -ms /bin/bash darkstar && \
  chown -R darkstar:darkstar /darkstar
