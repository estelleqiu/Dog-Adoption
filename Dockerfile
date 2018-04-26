FROM ruby:2.4.3


RUN curl -sLf -o /dev/null 'https://deb.nodesource.com/node_8.x/dists/jessie/Release'
RUN apt-get update -yqq && \
		apt-cache policy nodejs && \
		apt-get install -y \
										nodejs \
										npm \
										libpq-dev \
										build-essential &&\
		apt-get clean && \
		rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV APP_HOME /Dog-Adoption
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

COPY Gemfile Gemfile.lock package.json yarn.lock $APP_HOME/
RUN gem install bundler
RUN bundle install

RUN npm install -g yarn 
RUN yarn install

ADD . $APP_HOME