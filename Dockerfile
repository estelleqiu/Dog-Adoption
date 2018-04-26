FROM ruby:2.4.3
RUN gem install bundler

RUN apt-get update -yqq && \
    apt-get install -y \
								nodejs \
								libpq-dev \
								build-essential &&\
		apt-get clean && \
		rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV APP_HOME /Dog-Adoption
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

COPY Gemfile Gemfile.lock $APP_HOME/
RUN bundle install

ADD . $APP_HOME