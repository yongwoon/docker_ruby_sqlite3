FROM ruby:2.5

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

RUN apt-get update && \
  apt-get install -y nodejs \
  mysql-client \
  postgresql-client \
  sqlite3 \
  --no-install-recommends && \
  rm -rf /var/lib/apt/lists/*

# WORKDIR /usr/src/app

# COPY Gemfile Gemfile.lock ./
# RUN bundle install

# COPY . .

# CMD ["./your-daemon-or-script.rb"]
