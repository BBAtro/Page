FROM ruby:3-alpine

RUN apt-get update && apt-get install -y npm && npm install -g yarn

RUN mkdir -p /var/app
COPY . /var/app
WORKDIR /var/app

RUN bundle install

CMD ./bin/dev