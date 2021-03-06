module ActiveAdmin
  module Dashboards
    class DashboardController < ResourceController

      before_filter :skip_sidebar!

	  actions :index

      # Render from here if not overriden
      self.default_views = 'active_admin_dashboard'

      clear_action_items!

      def index
        @dashboard_sections = find_sections
        render_or_default 'index'
      end

      protected

      def set_current_tab
        @current_tab = "Dashboard"
      end

      def find_sections
        sections = ActiveAdmin::Dashboards.sections_for_namespace(namespace)
        sections.select do |section|
          if section.options.has_key?(:if)
            symbol_or_proc = section.options[:if]
            case symbol_or_proc
            when Symbol, String then self.send(symbol_or_proc)
            when Proc           then instance_exec(&symbol_or_proc)
            else symbol_or_proc
            end
          else
            true
          end
        end
      end

      def namespace
        class_name = self.class.name
        if class_name.include?('::')
          self.class.name.split('::').first.underscore.to_sym
        else
          :root
        end
      end

      # Return the current menu for the view. This is a helper method
      def current_menu
        ActiveAdmin.namespaces[namespace].menu
      end

    end
  end
end
