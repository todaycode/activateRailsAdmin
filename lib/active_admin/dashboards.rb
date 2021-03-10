module ActiveAdmin
  module Dashboards

    autoload :DashboardController,  'active_admin/dashboards/dashboard_controller'
    autoload :Renderer,             'active_admin/dashboards/renderer'
    autoload :Section,              'active_admin/dashboards/section'
    autoload :SectionRenderer,      'active_admin/dashboards/section_renderer'

    @@sections = {}
    mattr_accessor :sections

    class << self

      # Eval an entire block in the context of this module to build
      # dashboards quicker.
      #
      # Example:
      #
      #   ActiveAdmin::Dashboards.build do
      #     section "Recent Post" do
      #       # return a list of posts
      #     end
      #   end
      #
      def build(&block)
        module_eval(&block)
      end

      # Add a new dashboard section to a namespace. If no namespace is given
      # it will be added to the default namespace.
      #
      # Options include:
      #   :namespace => only display for specified namespace.
      #   :if        => specify a method or block to determine whether the section is rendered at run time.
      def add_section(name, options = {}, &block)
<<<<<<< HEAD
        namespace = options.delete(:namespace) || ActiveAdmin.default_namespace || :root
        self.sections[namespace] ||= [] 
=======
        namespace = options.delete(:namespace) || ActiveAdmin.application.default_namespace || :root
        self.sections[namespace] ||= []
>>>>>>> 960a08bf (whitespace cleanup)
        self.sections[namespace] << Section.new(namespace, name, options, &block)
        self.sections[namespace].sort!
      end
      alias_method :section, :add_section

      def sections_for_namespace(namespace)
        @@sections[namespace] || []
      end

      def clear_all_sections!
        @@sections = {}
      end

<<<<<<< HEAD
=======
      # Called from MenuBuilder to register dashboard to menu.
      def add_to_menu(namespace, menu)
        return unless ActiveAdmin::Dashboards.built?

        dashboard_path = namespace.root? ? :dashboard_path : "#{namespace.name}_dashboard_path".to_sym

        menu.add :id => "dashboard",
                 :label => proc{ I18n.t("active_admin.dashboard") },
                 :url => dashboard_path,
                 :priority => 1
      end
>>>>>>> 960a08bf (whitespace cleanup)
    end

  end
end
