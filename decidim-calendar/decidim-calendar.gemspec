# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

# Mantain your gem's version
require 'decidim/calendar/version'

# Describe gem and declar its dependencies:
Gem::Specification.new do |s|
  s.version = Decidim::Calendar.version
  s.authors = ['Mijail Rondon Viloria']
  s.email = ['mijail@gnu.org.ve']
  s.license = 'AGPL-3.0'
  s.homepage = 'https://github.com/alabs/decideclm'
  s.required_ruby_version = '>= 2.4.1'

  s.name = 'decidim-calendar'
  s.summary = 'Calendar engine for decidim'
  s.description = s.summary

  s.files = Dir['{app,config,db,lib,vendor}/**/*', 'Rakefile', 'README.md']
  s.add_dependency 'decidim-core', Decidim::Calendar.version

  s.add_development_dependency 'decidim-dev', Decidim::Calendar.version
end
