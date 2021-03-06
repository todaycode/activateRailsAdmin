require 'rubygems'
require "bundler"
Bundler.setup

require 'rake'

desc "Creates a test rails app for the specs to run against"
task :setup do
  system("mkdir spec/rails") unless File.exists?("spec/rails")
  system "bundle exec rails new spec/rails/rails-3.0.0 -m spec/support/rails_template.rb"
end

require "rspec/core/rake_task"
RSpec::Core::RakeTask.new(:spec)

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.rcov = true
end

# Run the specs & cukes
task :default do
  # Force spec files to be loaded and ran in alphabetical order.
  specs_unit = Dir['spec/unit/**/*_spec.rb'].sort.join(' ')
  specs_integration = Dir['spec/integration/**/*_spec.rb'].sort.join(' ')
  exit [
    cmd("export RAILS=3.0.5 && export RAILS_ENV=test && bundle exec rspec #{specs_unit}"),
    cmd("export RAILS=3.0.5 && export RAILS_ENV=test && bundle exec rspec #{specs_integration}"),
    cmd("export RAILS=3.0.5 && export RAILS_ENV=cucumber && bundle exec cucumber features"),
  ].uniq == [true]
end

namespace :spec do
  
  desc "Run specs for all versions of rails"
  task :all do
    puts "Runing for Rails 2.3.5"
    out = `rake spec`
    puts out
    puts "Running for Rails 3"
    out = `rake spec RAILS=3.0.0`
    puts out
  end
  
end

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "active_admin #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "activeadmin"
    gem.summary = "The administration framework for Ruby on Rails."
    gem.description = "The administration framework for Ruby on Rails."
    gem.email = "gregdbell@gmail.com"
    gem.homepage = "http://activeadmin.info"
    gem.authors = ["Greg Bell"]

    gem.files.exclude 'spec/rails'
    gem.test_files.exclude 'spec/rails'

    require File.join(File.dirname(File.expand_path(__FILE__)), 'lib', 'active_admin', 'version')
    gem.version = ActiveAdmin::VERSION

    gem.add_dependency 'rails',           '>= 3.0.0'
    gem.add_dependency 'formtastic',      '>= 1.1.0'
    gem.add_dependency 'will_paginate',   '>= 3.0.pre2'
    gem.add_dependency "meta_search",     '>= 0.9.2'
    gem.add_dependency 'inherited_views'
    gem.add_dependency 'devise'
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler not available. Install it with: gem install jeweler"
end
