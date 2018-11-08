FROM starefossen/ruby-node:2-8-stretch
RUN apt-get update -qq && \
    apt-get install -y nano build-essential libpq-dev && \
    gem install bundler
RUN mkdir /bradenscale
COPY Gemfile Gemfile.lock /bradenscale/
WORKDIR /bradenscale
RUN bundle install
COPY . /bradenscale