FROM ruby:3.3.7-slim

# Install system dependencies
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
    build-essential \
    curl \
    git \
    libpq-dev \
    libvips \
    nodejs \
    npm \
    pkg-config \
    && rm -rf /var/lib/apt/lists /var/cache/apt/archives

WORKDIR /rails

# Set environment
ENV RAILS_ENV="production" \
    BUNDLE_DEPLOYMENT="1" \
    BUNDLE_PATH="/usr/local/bundle" \
    BUNDLE_WITHOUT="development"

# Copy Gemfiles
COPY Gemfile Gemfile.lock ./

# Install gems (without bootsnap precompile)
RUN bundle lock --add-platform x86_64-linux && \
    bundle install && \
    rm -rf ~/.bundle/ "${BUNDLE_PATH}"/ruby/*/cache "${BUNDLE_PATH}"/ruby/*/bundler/gems/*/.git

# Copy application
COPY . .

# Make binfiles executable
RUN chmod +x bin/*

# Precompile assets
RUN SECRET_KEY_BASE_DUMMY=1 ./bin/rails assets:precompile

EXPOSE 3000

CMD ["./bin/rails", "server", "-b", "0.0.0.0"]