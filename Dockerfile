FROM ruby:2.5.3
WORKDIR /usr/src/app
COPY Gemfile Gemfile.lock ./
RUN bundle install
EXPOSE 9292
COPY . .
CMD ["bundle", "exec", "rackup", "-o", "0.0.0.0"]
