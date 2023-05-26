FROM ruby:3.1.1

ENV LANG=C.UTF-8
ARG RUBYGEMS_VERSION=3.3.20

RUN apt-get update -qq \
  && apt-get install -y vim nodejs npm

RUN npm install -g dbdocs @dbml/cli

WORKDIR /active-dbml
COPY . .

RUN gem update --system ${RUBYGEMS_VERSION} && \
  bundle install

# Add a script to be executed every time the container starts.
# COPY entrypoint.sh /usr/bin/
# RUN chmod +x /usr/bin/entrypoint.sh
# ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]
