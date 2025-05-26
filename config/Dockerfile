FROM ruby:3.2.8

# Install dependencies needed for pg gem and general build
RUN apt-get update -qq && apt-get install -y \
    libpq-dev \
    build-essential \
    nodejs \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /myapp

# Copy gemfiles
COPY Gemfile Gemfile.lock ./

# Install gems
RUN bundle install && \
    rm -rf ~/.bundle/ "${BUNDLE_PATH}"/ruby/*/cache "${BUNDLE_PATH}"/ruby/*/bundler/gems/*/.git && \
    bundle exec bootsnap precompile --gemfile

# Copy application code
COPY . .

# Expose port
EXPOSE 3000

# Start the server
CMD ["rails", "server", "-b", "0.0.0.0"]