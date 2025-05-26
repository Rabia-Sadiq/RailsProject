FROM ruby:3.3.0

# Install system dependencies
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs \
    npm \
    git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /myapp

# Copy Gemfile and Gemfile.lock
COPY Gemfile Gemfile.lock ./

# Configure bundle and install gems
RUN bundle config set --local deployment true && \
    bundle config set --local without 'development test' && \
    bundle lock --add-platform x86_64-linux && \
    bundle install --jobs=4 --retry=3

# Copy the rest of the application
COPY . .

# Expose port
EXPOSE 3000

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]