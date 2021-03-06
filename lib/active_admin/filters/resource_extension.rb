require 'active_admin/filters/active'

module ActiveAdmin
  module Filters

    module ResourceExtension

      def initialize(*)
        super
        add_filters_sidebar_section
        add_filter_summary_sidebar_section
      end

      # Returns the filters for this resource. If filters are not enabled,
      # it will always return an empty hash.
      #
      # @return [Array] Filters that apply for this resource
      def filters
        return [] unless filters_enabled?
        filter_lookup
      end

      # Setter to enable / disable filters on this resource.
      #
      # Set to `nil` to inherit the setting from the namespace
      def filters=(bool)
        @filters_enabled = bool
      end

      # @return [Boolean] If filters are enabled for this resource
      def filters_enabled?
        @filters_enabled.nil? ? namespace.filters : @filters_enabled
      end

      def preserve_default_filters!
        @preserve_default_filters = true
      end

      def preserve_default_filters?
        @preserve_default_filters == true
      end

      # Remove a filter for this resource. If filters are not enabled, this method
      # will raise a RuntimeError
      #
      # @param [Symbol] attribute The attribute to not filter on
      def remove_filter(attribute)
        unless filters_enabled?
          raise RuntimeError, "Can't remove a filter when filters are disabled. Enable filters with 'config.filters = true'"
        end

        @filters_to_remove ||= []
        @filters_to_remove << attribute
      end

      # Add a filter for this resource. If filters are not enabled, this method
      # will raise a RuntimeError
      #
      # @param [Symbol] attribute The attribute to filter on
      # @param [Hash] options The set of options that are passed through to
      #                       metasearch for the field definition.
      def add_filter(attribute, options = {})
        unless filters_enabled?
          raise RuntimeError, "Can't add a filter when filters are disabled. Enable filters with 'config.filters = true'"
        end

        @filters ||= []
        @filters << options.merge({ :attribute => attribute })
      end

      # Reset the filters to use defaults
      def reset_filters!
        @filters = nil
        @filters_to_remove = nil
      end

      private

      # Collapses the waveform, if you will, of which filters should be displayed.
      # Removes filters and adds in default filters as desired.
      def filter_lookup
        filters = @filters.try(:dup) || []
        filters.push *default_filters if filters.empty? || preserve_default_filters?

        if @filters_to_remove
          @filters_to_remove.each do |attr|
            filters.delete_if{ |f| f.fetch(:attribute) == attr }
          end
        end

        filters
      end

      # @return [Array] The array of default filters for this resource
      def default_filters
        default_association_filters + default_content_filters
      end

      # Returns a default set of filters for the associations
      def default_association_filters
        if resource_class.respond_to?(:reflections)
          block = if Rails::VERSION::MAJOR == 3 && Rails::VERSION::MINOR == 0
            proc{ |_,r| [r.options[:foreign_type], r.primary_key_name] }
          else
            proc{ |_,r| [r.foreign_type, r.foreign_key] }
          end

          poly, not_poly = resource_class.reflections.partition{ |_,r| r.macro == :belongs_to && r.options[:polymorphic] }
          filters        = poly.map(&block).flatten + not_poly.map(&:first)
          filters.collect{ |name| { :attribute => name.to_sym } }
        else
          []
        end
      end

      # Returns a default set of filters for the content columns
      def default_content_filters
        if resource_class.respond_to?(:content_columns)
          resource_class.content_columns.collect{|c| { :attribute => c.name.to_sym } }
        else
          []
        end
      end

      def add_filters_sidebar_section
        self.sidebar_sections << filters_sidebar_section
      end

      def filters_sidebar_section
        ActiveAdmin::SidebarSection.new(:filters, :only => :index, :if => proc{ active_admin_config.filters.any? } ) do
          active_admin_filters_form_for assigns[:search], active_admin_config.filters
        end
      end

      def add_filter_summary_sidebar_section
        self.sidebar_sections << filter_summary_section
      end

      def filter_summary_section
        ActiveAdmin::SidebarSection.new :filter_summary, only: :index, if: -> { params[:q] } do
          active = ActiveAdmin::Filters::Active.new(resource_class, params)

          span do
            h4 "Scope:", style: 'display: inline'
            b active.scope, style: "display: inline"

            div style: "margin-top: 10px" do
              h4 "Current filters:", style: 'margin-bottom: 10px'
              ul do
                active.filters.each do |filter|
                  li do
                    span filter[:description]
                    b filter[:value]
                  end
                end
              end
            end
          end
        end
      end
    end

  end
end
