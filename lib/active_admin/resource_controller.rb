require 'inherited_views'
require 'active_admin/pages'
require 'active_admin/resource_controller/actions'
require 'active_admin/resource_controller/collection'
require 'active_admin/resource_controller/scoping'
require 'active_admin/resource_controller/sidebars'
require 'active_admin/resource_controller/callbacks'

module ActiveAdmin
  class ResourceController < ::InheritedViews::Base

    include ActiveAdmin::ActionItems
    include ActiveAdmin::Filters
    include ActiveAdmin::ActionBuilder

    include Actions
    include Callbacks
    include Collection
    include Scoping
    include Sidebars

    # Add our views to the view path
    ActionController::Base.append_view_path File.expand_path('../views', __FILE__)
    self.default_views = 'active_admin_default'
    
    helper ::ActiveAdmin::ViewHelpers

    layout 'active_admin'
    
    class_inheritable_accessor :form_config

    respond_to :html, :xml, :json
    respond_to :csv, :only => :index

    before_filter :set_current_tab

<<<<<<< HEAD
    class << self
      # Ensure that this method is available for the DSL
      public :actions

      # Reference to the Resource object which initialized
      # this controller
      attr_accessor :active_admin_config
      
      def active_admin_config=(config)
        @active_admin_config = config
        defaults  :resource_class => config.resource,
                  :route_prefix => config.route_prefix
      end

      def set_page_config(page, config)
        active_admin_config.page_configs[page] = config
      end

      def get_page_config(page)
        active_admin_config.page_configs[page]
      end

      def reset_page_config!(page)
        active_admin_config.page_configs[page] = nil
      end


      # Setting the menu options
      def menu(options = {})
        active_admin_config.menu(options)
      end


      def belongs_to(target, options = {})
        active_admin_config.belongs_to = BelongsTo.new(active_admin_config, target, options)
        super(target, options.dup)
      end
     
      #
      # Index Config
      #

      # Configure the index page for the resource
      def index(options = {}, &block)
        options[:as] ||= :table
        set_page_config :index, ActiveAdmin::PageConfig.new(options, &block)
      end

      # Configure the show page for the resource
      def show(options = {}, &block)
        set_page_config :show, ActiveAdmin::PageConfig.new(options, &block)
      end

      # Define the getting and re-setter for each configurable page
      [:index, :show].each do |page|
        # eg: index_config
        define_method :"#{page}_config" do
          get_page_config(page)
        end

        # eg: reset_index_config!
        define_method :"reset_#{page}_config!" do
          reset_page_config! page
        end
      end


      #
      # Form Config
      #

      def form(options = {}, &block)
        options[:block] = block
        self.form_config = options
      end

      def form_config
        read_inheritable_attribute(:form_config) || default_form_config
      end

      def reset_form_config!
        self.form_config = nil
      end

      def default_form_config
        config = {}
        config[:block] = lambda do |f|
          f.inputs
          f.buttons
        end
        config
      end
      
    end

    # Default Sidebar Sections
    sidebar :filters, :only => :index do
      active_admin_filters_form_for @search, filters_config
    end

    # Default Action Item Links
    action_item :only => :show do
      if controller.action_methods.include?('edit')
        link_to "Edit #{active_admin_config.resource_name}", edit_resource_path(resource)
      end
    end

    action_item :only => :show do
      if controller.action_methods.include?("destroy")
        link_to "Delete #{active_admin_config.resource_name}",
          resource_path(resource), 
          :method => :delete, :confirm => "Are you sure you want to delete this?"
      end
    end

    action_item :except => [:new, :show] do
      if controller.action_methods.include?('new')
        link_to "+ New #{active_admin_config.resource_name}", new_resource_path
      end
    end

    protected

    # Set's @current_tab to be name of the tab to mark as current
    # Get's called through a before filter
    def set_current_tab
      @current_tab = if active_admin_config.belongs_to? && parent?
        active_admin_config.belongs_to.target.menu_item_name
      else
        [active_admin_config.parent_menu_item_name, active_admin_config.menu_item_name].compact.join("/")
      end
    end

    def active_admin_config
      self.class.active_admin_config
=======
    def self.active_admin_config=(config)
      if @active_admin_config = config
        defaults :resource_class => config.resource_class,
                 :route_prefix   => config.route_prefix,
                 :instance_name  => config.resource_name.singular
      end
    end

    # Inherited Resources uses the `self.inherited(base)` hook to add
    # in `self.resource_class`. To override it, we need to install
    # our resource_class method each time we're inherited from.
    def self.inherited(base)
      super(base)
      base.override_resource_class_methods!
>>>>>>> 93d1d866 (controller code cleanup)
    end
    helper_method :active_admin_config

    def index_config
      @index_config ||= self.class.index_config
    end
    helper_method :index_config

    def show_config
      @show_config ||= self.class.show_config
    end
    helper_method :show_config

    def form_config
      @form_config ||= self.class.form_config
    end
    helper_method :form_config

    def current_menu
      active_admin_config.namespace.menu
    end
    helper_method :current_menu

    # Returns the renderer class to use for the given action.
    #
    # TODO: This needs to be wrapped into a default config as well
    # as overrideable on each controller
    def renderer_for(action)
      {
        :index  => ::ActiveAdmin::Pages::Index,
        :new    => ::ActiveAdmin::Pages::New,
        :show   => ::ActiveAdmin::Pages::Show,
        :edit   => ::ActiveAdmin::Pages::Edit
      }[action]
    end
    helper_method :renderer_for

  end
end
