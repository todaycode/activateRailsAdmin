# These resources are needed to setup the test env
source 'http://rubygems.org'

# Rails & ActiveAdmin Dependencies
gem 'rails',          '3.0.0'
gem 'sqlite3-ruby',   :require => 'sqlite3'
gem 'devise',         '1.1.3'
gem 'haml',           '3.0.18'
gem 'formtastic',     '1.1.0.beta'
gem 'will_paginate',  '3.0.pre2'
gem "meta_search",    '0.9.2'
gem 'inherited_views'
gem 'jeweler'

<<<<<<< HEAD
# Testing Dependencies
gem 'rspec',          '2.0.0.beta.22'
gem 'rspec-rails',    '2.0.0.beta.22'
gem 'capybara',       '0.3.9'
=======
ACTIVE_ADMIN_PATH = File.dirname(__FILE__) unless defined?(ACTIVE_ADMIN_PATH)

require File.expand_path('spec/support/detect_rails_version', ACTIVE_ADMIN_PATH)

rails_version = detect_rails_version
gem 'rails', rails_version
gem 'bourbon'

case rails_version
when /^3\.0/
  # Do nothing, bundler should figure it out
when /^3\.(1|2)/
  # These are the gems you have to have for Rails 3.1 to be happy
  gem 'sass-rails'
  gem 'uglifier'
else
  raise "Rails #{rails_version} is not supported yet"
end

gem 'sprockets', '<= 2.11.0' # Hold back sprockets, ref: #3005

group :development do
  gem 'better_errors',     '~> 0.9.0' # Web UI to debug exceptions. Go to /__better_errors to access the latest one
  gem 'binding_of_caller', '~> 0.7.1' # Retrieve the binding of a method's caller in MRI Ruby >= 1.9.2
end

group :development, :test do
  gem 'haml', '~> 3.1.7',  :require => false
  gem 'rake', '~> 10.0.2', :require => false
  gem 'rails-i18n' # Provides default i18n for many languages
  gem 'rdiscount'  # Markdown implementation (for yard)
  gem 'sprockets'
  gem 'yard'
end

group :test do
  gem 'cancan'
  gem 'capybara',        '1.1.2'
  gem 'cucumber-rails',  '1.3.0', :require => false
  gem 'database_cleaner', '<= 1.0.1'
  gem 'guard-coffeescript'
  gem 'guard-rspec'
  gem 'jasmine'
  gem 'jslint_on_rails', '~> 1.1.1'
  gem 'launchy'
  gem 'parallel_tests'
  gem 'rspec-rails',     '~> 2.9.0'
  gem 'shoulda-matchers'
  gem 'sqlite3'
end
>>>>>>> 241ed417 (add better_errors to improve debugging experience)
