FROM ruby:2.2

RUN mkdir -p /opt/src/app
WORKDIR /usr/src/app

RUN gem install bundler

ADD Gemfile Gemfile.lock ./
RUN bundle install

ADD . .

CMD ["ruby", "run.rb"]
