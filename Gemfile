# frozen_string_literal: true

source 'https://rubygems.org'

ruby RUBY_VERSION
DECIDIM_VERSION = { git: 'https://github.com/decidim/decidim', branch: '0.14-stable' }
gem 'decidim', DECIDIM_VERSION
# gem 'decidim-calendar', path: 'decidim-calendar'
gem 'decidim-news', path: 'decidim-news'

gem 'airbrake', '~> 5.0'
gem 'daemons'
gem 'delayed_job_active_record'
gem 'faker', '~> 1.8.4'
gem 'puma', '~> 3.0'
gem 'therubyracer'
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'decidim-dev', DECIDIM_VERSION
end

group :development do
  gem 'listen', '~> 3.1.0'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console'

  # deploy
  gem 'capistrano', '3.8.0', require: false
  gem 'capistrano-bundler', '~> 1.2', require: false
  gem 'capistrano-passenger'
  gem 'capistrano-rails', '1.1.8', require: false
  gem 'capistrano-rbenv'
  gem 'capistrano3-delayed-job', '~> 1.0'
end

group :staging, :development do
  gem 'letter_opener_web', '~> 1.3.0'
end
