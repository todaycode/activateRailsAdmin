<<<<<<< HEAD
=======
require 'active_admin/resource/action_items'
require 'active_admin/resource/controllers'
require 'active_admin/resource/menu'
require 'active_admin/resource/page_presenters'
require 'active_admin/resource/pagination'
require 'active_admin/resource/routes'
require 'active_admin/resource/naming'
require 'active_admin/resource/scopes'
require 'active_admin/resource/scope_to'
require 'active_admin/resource/sidebars'
require 'active_admin/resource/belongs_to'

>>>>>>> b7fa1076 (Resolves #587 adding :if & :unless proc arguments to scope_to() method)
module ActiveAdmin
  class Resource

<<<<<<< HEAD
    attr_reader :namespace, :resource, :page_configs, :member_actions, :collection_actions,
                :parent_menu_item_name
    attr_accessor :resource_name, :sort_order, :scope_to, :scope_to_association_method,
                  :belongs_to

    def initialize(namespace, resource, options = {})
      @namespace = namespace
      @resource = resource
      @options = default_options.merge(options)
      @sort_order = @options[:sort_order]
      @page_configs = {}
      @member_actions, @collection_actions = [], []
    end

    # An underscored safe representation internally for this resource
    def underscored_resource_name
      @underscored_resource_name ||= if @options[:as]
        @options[:as].gsub(' ', '').underscore.singularize
      else
        resource.name.gsub('::','').underscore
      end
    end

    # A camelized safe representation for this resource
    def camelized_resource_name
      underscored_resource_name.camelize
    end

    # Returns the name to call this resource.
    # By default will use resource.model_name.human
    def resource_name
      @resource_name ||= if @options[:as] || !resource.respond_to?(:model_name)
        underscored_resource_name.titleize
      else
        resource.model_name.human.titleize
      end
    end

    # Returns the plural version of this resource
    def plural_resource_name
      @plural_resource_name ||= resource_name.pluralize
    end
=======
    # Event dispatched when a new resource is registered
    RegisterEvent = 'active_admin.resource.register'.freeze

    # The namespace this config belongs to
    attr_reader :namespace

    # The name of the resource class
    attr_reader :resource_class_name

    # An array of member actions defined for this resource
    attr_reader :member_actions

    # An array of collection actions defined for this resource
    attr_reader :collection_actions

    # The default sort order to use in the controller
    attr_accessor :sort_order

    # Set the configuration for the CSV
    attr_writer :csv_builder

    # Set breadcrumb builder
    attr_accessor :breadcrumb

    # Store a reference to the DSL so that we can dereference it during garbage collection.
    attr_accessor :dsl

    # The string identifying a class to decorate our resource with for the view.
    # nil to not decorate.
    attr_accessor :decorator_class_name

    module Base
      def initialize(namespace, resource_class, options = {})
        @namespace = namespace
        @resource_class_name = "::#{resource_class.name}"
        @options = default_options.merge(options)
        @sort_order = @options[:sort_order]
        @member_actions, @collection_actions = [], []
      end
    end

    include MethodOrProcHelper

    include Base
    include ActionItems
    include Authorization
    include Controllers
    include Menu
    include Naming
    include PagePresenters
    include Pagination
    include Scopes
    include ScopeTo
    include Sidebars
    include Menu
    include Routes
>>>>>>> b7fa1076 (Resolves #587 adding :if & :unless proc arguments to scope_to() method)

    # Returns a properly formatted controller name for this
    # resource within its namespace
    def controller_name
      [namespace.module_name, camelized_resource_name.pluralize + "Controller"].compact.join('::')
    end

    # Returns the controller for this resource
    def controller
      @controller ||= controller_name.constantize
    end

    # Returns the routes prefix for this resource
    def route_prefix
      namespace.module_name.try(:underscore)
    end

    # Returns a symbol for the route to use to get to the
    # collection of this resource
    def route_collection_path
      route = [route_prefix, controller.resources_configuration[:self][:route_collection_name]]

      if controller.resources_configuration[:self][:route_collection_name] ==
          controller.resources_configuration[:self][:route_instance_name]
        route << "index"
      end

      route << 'path'
      route.compact.join('_').to_sym
    end

    # Set the menu options
    def menu(options = {})
      @parent_menu_item_name = options[:parent]
    end

<<<<<<< HEAD
    # Returns the name to be displayed in the menu for this resource
    def menu_item_name
      @menu_item_name ||= plural_resource_name
    end
    
    # Returns the items priority for altering the default sort order
    def menu_item_priority
      @menu_options[:priority] || 10
    end
    
    # Returns a proc for deciding whether to display the menu item or not in the view
    def menu_item_display_if
      @menu_options[:if] || proc { true }
    end

=======
    # Clears all the member actions this resource knows about
>>>>>>> 7909a8cf (route_collection_path and route_instance_path both return the path as a String)
    def clear_member_actions!
      @member_actions = []
    end

    def clear_collection_actions!
      @collection_actions = []
    end

<<<<<<< HEAD
    # Returns the name of the controller class for this resource
    def dashboard_controller_name
      [namespace.module_name, "DashboardController"].compact.join("::")
=======
    # Return only defined resource actions
    def defined_actions
      controller.instance_methods.map(&:to_sym) & ResourceController::ACTIVE_ADMIN_ACTIONS
    end

    def belongs_to(target, options = {})
      @belongs_to = Resource::BelongsTo.new(self, target, options)
      self.navigation_menu_name = target unless @belongs_to.optional?
      controller.belongs_to(target, options.dup)
    end

    def belongs_to_config
      @belongs_to
>>>>>>> 6c2a9886 (improve Comments UI)
    end

    # Do we belong to another resource?
    def belongs_to?
<<<<<<< HEAD
      !belongs_to.nil?
=======
      !!belongs_to_config
>>>>>>> 5a736047 (make ResourceCollection behave more like a Hash)
    end

    private

    def default_options
      {
<<<<<<< HEAD
<<<<<<< HEAD
        :namespace  => ActiveAdmin.default_namespace,
        :sort_order => ActiveAdmin.default_sort_order,
=======
        :sort_order => (resource_class.respond_to?(:primary_key) ? resource_class.primary_key : 'id') + '_desc'
>>>>>>> 5a736047 (make ResourceCollection behave more like a Hash)
=======
        :sort_order => (resource_class.respond_to?(:primary_key) ? resource_class.primary_key.to_s : 'id') + '_desc'
>>>>>>> cc5577c5 (Some ORMs/ODMs return a Symbol for primary key, therefore we must call #to_s (or interpolate as was the case before @Daxter's 5a736047))
      }
    end

  end
end
