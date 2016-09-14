FROM ruby:2.3.0
MAINTAINER jyf0000@gmail.com

ENV LC_ALL C.UTF-8

RUN apt-get update
RUN curl -sL https://deb.nodesource.com/setup_5.x | bash
ENV PHANTOMJS_VERSION 1.9.7
RUN apt-get install -y nodejs build-essential vim git wget libfreetype6 libfontconfig bzip2 && \
  mkdir -p /srv/var && \
  wget -q --no-check-certificate -O /tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 && \
  tar -xjf /tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 -C /tmp && \
  rm -f /tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 && \
  mv /tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64/ /srv/var/phantomjs && \
  ln -s /srv/var/phantomjs/bin/phantomjs /usr/bin/phantomjs && \
  git clone https://github.com/n1k0/casperjs.git /srv/var/casperjs && \
  ln -s /srv/var/casperjs/bin/casperjs /usr/bin/casperjs && \
  apt-get autoremove -y && \
  apt-get clean all

RUN mkdir -p /usr/src/app
ADD Gemfile /usr/src/app/Gemfile
ADD Gemfile.lock /usr/src/app/Gemfile.lock
WORKDIR /usr/src/app

RUN bundle install --system

ADD . /usr/src/app
RUN rm -rf /usr/src/app/node_modules
RUN cp /usr/src/app/config/database.yml.docker /usr/src/app/config/database.yml

RUN npm install
RUN npm install -g webpack
RUN webpack -p

RUN bundle exec rake assets:precompile
CMD mkdir /usr/src/app/tmp
