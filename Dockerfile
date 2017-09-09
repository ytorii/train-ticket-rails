FROM ruby:2.4.1-alpine

RUN sed -i -e 's/v3\.4/edge/g' /etc/apk/repositories
RUN apk update && apk upgrade && apk add --update --no-cache sqlite-dev nodejs alpine-sdk tzdata udev ttf-freefont 'chromium>59.0' 'chromium-chromedriver>59.0'

RUN mkdir /app
WORKDIR /app
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
ADD . /app

RUN bin/setup
