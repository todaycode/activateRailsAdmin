require 'meta_search'
require 'devise'
require 'will_paginate'
require 'sass'
<<<<<<< HEAD
=======
require 'inherited_resources'
require 'jquery-rails'
require 'arbre'
require 'active_admin/dependency_checker'
require 'active_admin/sass/helpers'
require 'active_admin/engine'
>>>>>>> 960a08bf (whitespace cleanup)

module ActiveAdmin
  
  autoload :VERSION,              'active_admin/version'
  autoload :Namespace,            'active_admin/namespace'
  autoload :Resource,             'active_admin/resource'
  autoload :ResourceController,   'active_admin/resource_controller'
  autoload :Dashboards,           'active_admin/dashboards'
  autoload :Renderer,             'active_admin/renderer'
  autoload :TableBuilder,         'active_admin/table_builder'
  autoload :FormBuilder,          'active_admin/form_builder'
  autoload :TabsRenderer,         'active_admin/tabs_renderer'
  autoload :ViewHelpers,          'active_admin/view_helpers'
  autoload :Breadcrumbs,          'active_admin/breadcrumbs'
  autoload :Filters,              'active_admin/filters'
  autoload :PageConfig,           'active_admin/page_config'
  autoload :Pages,                'active_admin/pages'
  autoload :Sidebar,              'active_admin/sidebar'
  autoload :ActionItems,          'active_admin/action_items'
  autoload :AssetRegistration,    'active_admin/asset_registration'
  autoload :Menu,                 'active_admin/menu'
  autoload :MenuItem,             'active_admin/menu_item'
  autoload :ActionBuilder,        'active_admin/action_builder'
  autoload :BelongsTo,            'active_admin/belongs_to'
  autoload :Callbacks,            'active_admin/callbacks'

<<<<<<< HEAD
  extend AssetRegistration
=======
  autoload :VERSION,                  'active_admin/version'
  autoload :Application,              'active_admin/application'
  autoload :AssetRegistration,        'active_admin/asset_registration'
  autoload :Authorization,            'active_admin/authorization_adapter'
  autoload :AuthorizationAdapter,     'active_admin/authorization_adapter'
  autoload :Breadcrumbs,              'active_admin/breadcrumbs'
  autoload :CanCanAdapter,            'active_admin/cancan_adapter'
  autoload :Callbacks,                'active_admin/callbacks'
  autoload :Component,                'active_admin/component'
  autoload :BaseController,           'active_admin/base_controller'
  autoload :ControllerAction,         'active_admin/controller_action'
  autoload :CSVBuilder,               'active_admin/csv_builder'
  autoload :Dashboards,               'active_admin/dashboards'
  autoload :Deprecation,              'active_admin/deprecation'
  autoload :Devise,                   'active_admin/devise'
  autoload :DSL,                      'active_admin/dsl'
  autoload :Event,                    'active_admin/event'
  autoload :FormBuilder,              'active_admin/form_builder'
  autoload :Inputs,                   'active_admin/inputs'
  autoload :Iconic,                   'active_admin/iconic'
  autoload :Menu,                     'active_admin/menu'
  autoload :MenuCollection,           'active_admin/menu_collection'
  autoload :MenuItem,                 'active_admin/menu_item'
  autoload :Namespace,                'active_admin/namespace'
  autoload :Page,                     'active_admin/page'
  autoload :PagePresenter,            'active_admin/page_presenter'
  autoload :PageController,           'active_admin/page_controller'
  autoload :PageDSL,                  'active_admin/page_dsl'
  autoload :Reloader,                 'active_admin/reloader'
  autoload :Resource,                 'active_admin/resource'
  autoload :ResourceController,       'active_admin/resource_controller'
  autoload :ResourceDSL,              'active_admin/resource_dsl'
  autoload :Scope,                    'active_admin/scope'
  autoload :ScopeChain,               'active_admin/helpers/scope_chain'
  autoload :SidebarSection,           'active_admin/sidebar_section'
  autoload :TableBuilder,             'active_admin/table_builder'
  autoload :ViewFactory,              'active_admin/view_factory'
  autoload :ViewHelpers,              'active_admin/view_helpers'
  autoload :Views,                    'active_admin/views'

<<<<<<< HEAD
  class Railtie < ::Rails::Railtie
    config.after_initialize do
      # Add load paths straight to I18n, so engines and application can overwrite it.
      require 'active_support/i18n'
      I18n.load_path.unshift *Dir[File.expand_path('../active_admin/locales/*.yml', __FILE__)]
      I18n.reload!
    end
  end
>>>>>>> 0f0bd9e6 (Fix https://github.com/gregbell/active_admin/issues/1999: translation_missing error)

  # The default namespace to put controllers and routes inside. Set this
  # in config/initializers/active_admin.rb using:
  # 
  #   ActiveAdmin.default_namespace = :super_admin
  #
  @@default_namespace = :admin
  mattr_accessor :default_namespace
=======
  class << self
>>>>>>> 8d4b7804 (Remove Railtie, Use Rails Engine)

  # The default number of resources to display on index pages
  @@default_per_page = 30
  mattr_accessor :default_per_page

  # The default sort order for index pages
  @@default_sort_order = 'id_desc'
  mattr_accessor :default_sort_order

  # A hash of all the registered namespaces
  @@namespaces = {}
  mattr_accessor :namespaces

  # The title which get's displayed in the main layout
  @@site_title = ""
  mattr_accessor :site_title

  # Load paths for admin configurations. Add folders to this load path
  # to load up other resources for administration. External gems can
  # include thier paths in this load path to provide active_admin UIs
  @@load_paths = [File.expand_path('app/admin', Rails.root)]
  mattr_accessor :load_paths

  # Stores if everything has been loaded or we need to reload
  @@loaded = false

  # The class to use to render the tabs in the interface
  @@tabs_renderer = ActiveAdmin::TabsRenderer
  mattr_accessor :tabs_renderer

  class << self

    # Get's called within the initializer
    def setup
      # Register the default assets
      register_stylesheet 'active_admin.css'
      register_javascript 'active_admin_vendor.js'
      register_javascript 'active_admin.js'

      # Since we're dealing with all our own file loading, we need
      # to remove our paths from the ActiveSupport autoload paths.
      # If not, file nameing becomes very important and can cause clashes.
      ActiveSupport::Dependencies.autoload_paths.reject!{|path| load_paths.include?(path) }

      # Don't eagerload our configs, we'll deal with them ourselves
      Rails.application.config.eager_load_paths = Rails.application.config.eager_load_paths.reject do |path| 
        load_paths.include?(path)
      end

      # Dispatch request which gets triggered once in production
      # and on every require in development mode
      ActionDispatch::Callbacks.to_prepare :active_admin do
        ActiveAdmin.unload!
        Rails.application.reload_routes!
      end

      yield self
    end

    # Registers a brand new configuration for the given resource.
    #
    # TODO: Setup docs for registration options
    def register(resource, options = {}, &block)
      namespace_name = options[:namespace] == false ? :root : (options[:namespace] || default_namespace)
      namespace = namespaces[namespace_name] ||= Namespace.new(namespace_name)
      namespace.register(resource, options, &block)
    end

    # Returns true if all the configuration files have been loaded.
    def loaded?
      @@loaded
    end

<<<<<<< HEAD
    # Removes all the controllers that were defined by registering
    # resources for administration.
    #
    # We remove them, then load them on each request in development
    # to allow for changes without having to restart the server.
    def unload!
      namespaces.values.each{|namespace| namespace.unload! }
      @@loaded = false
    end
=======
    # Migration MoveAdminNotesToComments generated with version 0.2.2 might reference
    # to ActiveAdmin.default_namespace.
    delegate :default_namespace, :to => :application
    ActiveAdmin::Deprecation.deprecate self, :default_namespace,
      "ActiveAdmin.default_namespace is deprecated. Please use ActiveAdmin.application.default_namespace"
>>>>>>> 960a08bf (whitespace cleanup)

    # Loads all of the ruby files that are within the load path of
    # ActiveAdmin.load_paths. This should load all of the administration
    # UIs so that they are available for the router to proceed.
    #
    # The files are only loaded if we haven't already loaded all the files
    # and they aren't marked for re-loading. To mark the files for re-loading
    # you must first call ActiveAdmin.unload!
    def load!
      # No work to do if we've already loaded
      return false if loaded?

      # Load files
      load_paths.flatten.compact.uniq.each do |path|
        Dir["#{path}/*.rb"].each{|f| load f }
      end

      # If no configurations, let's make sure you can still login
      load_default_namespace if namespaces.values.empty?

      # Load Menus
      namespaces.values.each{|namespace| namespace.load_menu! }

      @@loaded = true
    end

    # Creates all the necessary routes for the ActiveAdmin configurations
    #
    # Use this within the routes.rb file:
    #
    #   Application.routes.draw do |map|
    #     ActiveAdmin.routes(self)
    #   end
    #
    def routes(router)
      # Ensure that all the configurations (which define the routes)
      # are all loaded
      load!

      # Define any necessary dashboard routes
      router.instance_exec(namespaces.values) do |namespaces|
        namespaces.each do |namespace|
          if namespace.root?
            match '/' => 'dashboard#index', :as => 'dashboard'
          else
            name = namespace.name
            match name.to_s => "#{name}/dashboard#index", :as => "#{name.to_s}_dashboard"
          end
        end
      end

      # Now define the routes for each resource
      router.instance_exec(namespaces) do |namespaces|
        resources = namespaces.values.collect{|n| n.resources.values }.flatten
        resources.each do |config|

          # Define the block the will get eval'd within the namespace
          route_definition_block = Proc.new do
            resources config.underscored_resource_name.pluralize do

              # Define any member actions
              member do
                config.member_actions.each do |action|
                  # eg: get :comment
                  send(action.http_verb, action.name)
                end
              end

              # Define any collection actions
              collection do
                config.collection_actions.each do |action|
                  send(action.http_verb, action.name)
                end
              end
            end
          end

          # Add in the parent if it exists
          if config.belongs_to?
            routes_for_belongs_to = route_definition_block.dup
            route_definition_block = Proc.new do
              # If its optional, make the normal resource routes
              instance_eval &routes_for_belongs_to if config.belongs_to.optional?

              # Make the nested belongs_to routes
              resources config.belongs_to.target.underscored_resource_name.pluralize do
                instance_eval &routes_for_belongs_to
              end
            end
          end

          # Add on the namespace if required
          if !config.namespace.root?
            routes_in_namespace = route_definition_block.dup
            route_definition_block = Proc.new do
              namespace config.namespace.name do
                instance_eval(&routes_in_namespace)
              end
            end
          end

          instance_eval &route_definition_block
        end
      end
    end

    def load_default_namespace
      namespaces[default_namespace] ||= Namespace.new(default_namespace)
    end

    #
    # Add before, around and after filters to each registered resource.
    #
    # eg:
    #
    #   ActiveAdmin.before_filter :authenticate_admin!
    #
    def before_filter(*args, &block)
      ResourceController.before_filter(*args, &block)
    end

    def after_filter(*args, &block)
      ResourceController.after_filter(*args, &block)
    end

    def around_filter(*args, &block)
      ResourceController.around_filter(*args, &block)
    end

    # Helper method to add a dashboard section
    def dashboard_section(name, options = {}, &block)
      ActiveAdmin::Dashboards.add_section(name, options, &block)
    end

  end
end
