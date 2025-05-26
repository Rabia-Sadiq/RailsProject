FROM ruby:3.3.0

# Install dependencies needed for pg gem and general build
RUN apt-get update -qq && apt-get install -y libpq-dev build-essential

WORKDIR /myapp

COPY Gemfile Gemfile.lock ./

RUN bundle install && \
    rm -rf ~/.bundle/ "${BUNDLE_PATH}"/ruby/*/cache "${BUNDLE_PATH}"/ruby/*/bundler/gems/*/.git && \
    bundle exec bootsnap precompile --gemfile

COPY . .

CMD ["rails", "server", "-b", "0.0.0.0"]
