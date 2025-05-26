FROM ruby:3.3.0

# Install nodejs, yarn, postgresql-client and dependencies for pg gem compilation
RUN apt-get update -qq && apt-get install -y \
  nodejs \
  yarn \
  postgresql-client \
  libpq-dev \
  build-essential \
  && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /myapp

# Copy Gemfiles
COPY Gemfile Gemfile.lock ./

# Install gems including pg
RUN bundle install

# Copy the rest of your app
COPY . .

# Precompile bootsnap cache (optional, as you had in your original Dockerfile)
RUN bundle exec bootsnap precompile --gemfile

# Command to run your server
CMD ["rails", "server", "-b", "0.0.0.0"]
