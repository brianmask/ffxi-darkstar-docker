FROM i386/ubuntu:bionic

ENV DS_BRANCH=master

RUN apt-get update && \
  apt-get install -y software-properties-common build-essential autoconf python-pip \ 
  g++-7 luajit libzmq3-dev luarocks libmysqlclient-dev git python-setuptools && \
  python /usr/lib/python2.7/dist-packages/easy_install.py supervisor && \
  pip install supervisor-stdout && \
  git clone --depth=1 -b ${DS_BRANCH} http://github.com/brianmask/darkstar.git/ /darkstar && \
  cd /darkstar && \
  sh autogen.sh && \
  ./configure --enable-debug=gdb && \
  make -j12 && \
  apt-get autoremove -y build-essential git autoconf pkg-config software-properties-common && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /darkstar/src && \
  rm -rf /darkstar/sql && \
  groupadd -r darkstar && \
  useradd -g darkstar -ms /bin/bash darkstar && \
  chown -R darkstar:darkstar /darkstar
