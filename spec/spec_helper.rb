<<<<<<< HEAD
$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH << File.expand_path('../support', __FILE__)

ENV['BUNDLE_GEMFILE'] = File.expand_path('../../Gemfile', __FILE__)

require 'rubygems'
require "bundler"
Bundler.setup

# Setup autoloading of ActiveAdmin and the load path
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
autoload :ActiveAdmin, 'active_admin'

=======
require 'spec_helper_without_rails'
>>>>>>> 9d2dc18a (improve test perf by deferring garbage collection)

module ActiveAdminIntegrationSpecHelper

  extend self

  def load_defaults!
    ActiveAdmin.register(Category)
    ActiveAdmin.register(User)
    ActiveAdmin.register(Post){ belongs_to :user, :optional => true }
    reload_menus!
  end

  def reload_menus!
    ActiveAdmin.namespaces.values.each{|n| n.load_menu! }
  end

  # Sometimes we need to reload the routes within
  # the application to test them out
  def reload_routes!
    Rails.application.reload_routes!
  end

<<<<<<< HEAD
  # Sets up a describe block where you can render controller 
=======
  # Helper method to load resources and ensure that Active Admin is
  # setup with the new configurations.
  #
  # Eg:
  #   load_resources do
  #     ActiveAdmin.regiser(Post)
  #   end
  #
  def load_resources
    ActiveAdmin.unload!
    yield
    reload_menus!
    reload_routes!
  end

  # Sets up a describe block where you can render controller
>>>>>>> 960a08bf (whitespace cleanup)
  # actions. Uses the Admin::PostsController as the subject
  # for the describe block
  def describe_with_render(*args, &block)
    describe *args do
      include RSpec::Rails::ControllerExampleGroup
<<<<<<< HEAD
      render_views  
      metadata[:behaviour][:describes] = Admin::PostsController
=======
      render_views
      # metadata[:behaviour][:describes] = ActiveAdmin.namespaces[:admin].resources['Post'].controller
>>>>>>> 960a08bf (whitespace cleanup)
      module_eval &block
    end
  end

  # Setup a describe block which uses capybara and rails integration
  # test methods.
  def describe_with_capybara(*args, &block)
    require 'integration_example_group'
    describe *args do
      include RSpec::Rails::IntegrationExampleGroup
      module_eval &block
    end
  end

  # Returns a fake action view instance to use with our renderers
  def mock_action_view(assigns = {})
    controller = ActionView::TestCase::TestController.new
    ActionView::Base.send :include, ActionView::Helpers
    ActionView::Base.send :include, ActiveAdmin::ViewHelpers
    ActionView::Base.new(ActionController::Base.view_paths, assigns, controller)
  end
  alias_method :action_view, :mock_action_view

end

ENV['RAILS'] ||= '3.0.0'
ENV['RAILS_ENV'] = 'test'

if ENV['RAILS'] == '3.0.0'
  ENV['RAILS_ROOT'] = File.expand_path('../rails/rails-3.0.0', __FILE__)

  # Create the test app if it doesn't exists
  unless File.exists?(ENV['RAILS_ROOT'])
    system 'rake setup'  
  end

  require ENV['RAILS_ROOT'] + '/config/environment'
  require 'rspec/rails'

  # Setup Some Admin stuff for us to play with
  include ActiveAdminIntegrationSpecHelper
  load_defaults!
  reload_routes!

  # Disabling authentication in specs so that we don't have to worry about
  # it allover the place
  ActiveAdmin.authentication_method = false

  # Don't add asset cache timestamps. Makes it easy to integration
  # test for the presence of an asset file
  ENV["RAILS_ASSET_ID"] = ''

  Rspec.configure do |config|
    config.use_transactional_fixtures = true
    config.use_instantiated_fixtures = false
  end

  # Ensure this is defined for Ruby 1.8
  module MiniTest; class Assertion < Exception; end; end

  Rspec::Matchers.define :have_tag do |*args|

<<<<<<< HEAD
    match_unless_raises Test::Unit::AssertionFailedError do |response|
      tag = args.shift
      content = args.first.is_a?(Hash) ? nil : args.shift
      
      options = {
        :tag => tag
      }.merge(args[0] || {})
      
      options[:content] = content if content
=======
  match_unless_raises Test::Unit::AssertionFailedError do |response|
    tag = args.shift
    content = args.first.is_a?(Hash) ? nil : args.shift

    options = {
      :tag => tag.to_s
    }.merge(args[0] || {})

    options[:content] = content if content
>>>>>>> 960a08bf (whitespace cleanup)

      begin
        begin
          assert_tag(options)
        rescue NoMethodError
          # We are not in a controller, so let's do the checking ourselves
          doc = HTML::Document.new(response, false, false)
          tag = doc.find(options)
          assert tag, "expected tag, but no tag found matching #{options.inspect} in:\n#{response.inspect}"
        end
      # In Ruby 1.9, MiniTest::Assertion get's raised, so we'll
      # handle raising a Test::Unit::AssertionFailedError
      rescue MiniTest::Assertion => e
        raise Test::Unit::AssertionFailedError, e.message
      end
    end
  end

end

<<<<<<< HEAD

=======
# improve the performance of the specs suite by not logging anything
# see http://blog.plataformatec.com.br/2011/12/three-tips-to-improve-the-performance-of-your-test-suite/
Rails.logger.level = 4


# Improves performance by forcing the garbage collector to run less often.
unless ENV['DEFER_GC'] == '0' || ENV['DEFER_GC'] == 'false'
  require 'support/deferred_garbage_collection'
  RSpec.configure do |config|
    config.before(:all) { DeferredGarbageCollection.start }
    config.after(:all)  { DeferredGarbageCollection.reconsider }
  end
end
>>>>>>> 9d2dc18a (improve test perf by deferring garbage collection)
