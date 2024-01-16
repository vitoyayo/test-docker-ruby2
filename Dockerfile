FROM ruby:3.1.2
ENV BUNDLER_VERSION=2.3.24

# throw errors if Gemfile has been modified since Gemfile.lock
RUN apt-get update -qq && apt-get install -y bash  openssl vim curl git  less
RUN bundle config --global frozen 1

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

CMD ["bash"]
