FROM ruby:2.4.2
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev && rm -rf /var/lib/apt/lists/*

# Node.js
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - \
&& apt-get install -y nodejs

# yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -\
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update \
&& apt-get install -y yarn

# App specific installations are run separatelly so previous is a rehused container
RUN apt-get install -y imagemagick && rm -rf /var/lib/apt/lists/*

ENV INSTALL_PATH /app
ENV BUNDLE_PATH /app/vendor/bundle
RUN mkdir -p $INSTALL_PATH
WORKDIR $INSTALL_PATH

RUN mkdir -p vendor/bundle
RUN mkdir -p log
COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install --jobs 20 --retry 5 --without development test
COPY . ./

RUN bundle exec bin/rails assets:precompile
