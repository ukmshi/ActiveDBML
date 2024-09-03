ARG RUBY_VERSION=3.2
FROM ruby:${RUBY_VERSION}-bullseye

ENV LANG=C.UTF-8 \
    RUBYGEMS_VERSION=3.3.20

# Set the working directory
WORKDIR /usr/src/app

# Install system packages
RUN apt-get update -qq && \
    apt-get install -y default-mysql-client postgresql postgresql-contrib vim && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set environment variables
ENV AR_VERSION=7.0

# Copy all files
COPY . .

# RUN bundle install

CMD ["irb"]
