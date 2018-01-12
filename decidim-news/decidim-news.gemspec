# frozen_string_literal: true

$LOAD_PATH.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "decidim/news/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.version = Decidim::News.version
  s.authors = ["Mijail Rondon"]
  s.email = ["mijail.rondon@gmail.com"]
  s.license = "AGPL-3.0"
  s.homepage = "https://github.com/decidim/decidim"
  s.required_ruby_version = ">= 2.3.1"

  s.name = "decidim-news"
  s.summary = "Organization news"
  s.description = "Organization global news."
  s.files = Dir["{app,config,db,lib,vendor}/**/*", "Rakefile", "README.md"]

  s.add_dependency "active_link_to", "~> 1.0.0"
  s.add_dependency "decidim-core", Decidim::News.version
  s.add_dependency "devise", "~> 4.2"
  s.add_dependency "devise-i18n", "~> 1.2.0"
  s.add_dependency "devise_invitable", "~> 1.7.0"
  s.add_dependency "jquery-rails", "~> 4.3.1"
  s.add_dependency "sassc-rails", "~> 1.3.0"
  s.add_dependency "select2-rails", "~> 4.0.3"

  s.add_development_dependency "decidim-dev", Decidim::News.version
  s.add_development_dependency "decidim-admin", Decidim::News.version
end
