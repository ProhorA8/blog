FROM ruby:3.1.2
RUN apt-get update \
  apt-get install -y nodejs \
  build-base \
  postgresql-dev \
  apt-get install -y nodejs \
  apt install imagemagick libvips \
  tzdata \
  nodejs \
  postgresql-dev
COPY Gemfile* .
RUN bundle install
WORKDIR /app
COPY --from=dependencies /usr/local/bundle /usr/local/bundle
COPY . .
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
