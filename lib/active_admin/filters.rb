<<<<<<< HEAD
module ActiveAdmin
  module Filters
    extend ActiveSupport::Concern

    included do
      helper_method :filters_config
    end

    module ClassMethods
      def filter(attribute, options = {})
        return false if attribute.nil?
        @filters ||= []
        @filters << options.merge(:attribute => attribute)
      end

      def filters_config
        @filters && @filters.any? ? @filters : default_filters_config
      end

      def reset_filters!
        @filters = []
      end

      # Returns a sane set of filters by default for the object
      def default_filters_config
        default_association_filters + default_content_filters
      end

      # Returns a default set of filters for the associations
      def default_association_filters
        if resource_class.respond_to?(:reflections)
          resource_class.reflections.collect{|name, r| { :attribute => name }}
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
    end

    module InstanceMethods
      def filters_config
        self.class.filters_config
      end
    end

    class FormBuilder < FormBuilder
    
      def filter(method, options = {})
        return "" if method.nil? || method == ""
        options[:as] ||= default_filter_type(method)
        return "" unless options[:as]
        content = with_new_form_buffer do
          send("filter_#{options.delete(:as)}_input", method, options)
        end
        @form_buffers.last << template.content_tag(:div, content, :class => "filter-form-field")
      end

      protected

      def filter_string_input(method, options = {})
        field_name = "#{method}_contains"

        [ label(field_name, "Search #{method.to_s.titlecase}"),
          text_field(field_name)
        ].join("\n").html_safe
      end

      def filter_date_range_input(method, options = {})
        gt_field_name = "#{method}_gte"
        lt_field_name = "#{method}_lte"

        [ label(gt_field_name, method.to_s.titlecase),
          filter_date_text_field(gt_field_name),
          " - ",
          filter_date_text_field(lt_field_name)
        ].join("\n").html_safe
      end

      def filter_date_text_field(method)
        current_value = @object.send(method)
        text_field(method, :size => 12, :class => "datepicker", :max => 10, :value => current_value.respond_to?(:strftime) ? current_value.strftime("%Y-%m-%d") : "")
      end

      def filter_numeric_input(method, options = {})
        filters = numeric_filters_for_method(method, options.delete(:filters) || default_numeric_filters)
        current_filter = current_numeric_scope(filters)
        filter_select = @template.select_tag '', @template.options_for_select(filters, current_filter), 
                                    :onchange => "document.getElementById('#{method}_numeric').name = 'q[' + this.value + ']';"
        filter_input = text_field current_filter, :size => 10, :id => "#{method}_numeric"

        [ label(method),
          filter_select,
          " ",
          filter_input
        ].join("\n").html_safe
      end
      
      def numeric_filters_for_method(method, filters)
        filters.collect{|scope| [scope[0], [method,scope[1]].join("_") ] }
      end

      # Returns the scope for which we are currently searching. If no search is available
      # it returns the first scope
      def current_numeric_scope(filters)
        filters[1..-1].inject(filters.first){|a,b| object.send(b[1].to_sym) ? b : a }[1]
      end

      def default_numeric_filters
        [['Equal To', 'eq'], ['Greater Than', 'gt'], ['Less Than', 'lt']]
      end

      def filter_select_input(method, options = {})
        association_name = method.to_s.gsub(/_id$/, '').to_sym
        input_name = (generate_association_input_name(method).to_s + "_eq").to_sym
        collection = find_collection_for_column(association_name, options)

        [ label(input_name, method.to_s.titlecase),
          select(input_name, collection, options.merge(:include_blank => 'Any'))
        ].join("\n").html_safe
      end

      def filter_check_boxes_input(method, options = {})
        input_name = (generate_association_input_name(method).to_s + "_in").to_sym
        collection = find_collection_for_column(method, options)
        selected_values = @object.send(input_name) || []
        checkboxes = collection.map do |c|
          label = c.is_a?(Array) ? c.first : c
          value = c.is_a?(Array) ? c.last : c
          "<label><input type=\"checkbox\" name=\"q[#{input_name}][]\" value=\"#{value}\" #{selected_values.include?(value) ? "checked" : ""}/> #{label}</label>"
        end.join("\n").html_safe

        [ label(input_name, method.to_s.titlecase),
          checkboxes
        ].join("\n").html_safe
      end

      # Override the standard finder to accept a proc
      def find_collection_for_column(method, options = {})
        options = options.dup
        case options[:collection]
        when Proc
          options[:collection] = options[:collection].call
        end
        super(method, options)
      end

      # Returns the default filter type for a given attribute
      def default_filter_type(method)
        if column = column_for(method)
          case column.type
          when :date, :datetime
            return :date_range
          when :string, :text
            return :string
          when :integer
            return :select if method.to_s =~ /_id$/
            return :numeric
          when :float, :decimal
            return :numeric
          end
        end

        if reflection = reflection_for(method)
          return :select if reflection.macro == :belongs_to
        end
      end

      # Returns the column for an attribute on the object being searched
      # if it exists. Otherwise returns nil
      def column_for(method)
        @object.base.columns_hash[method.to_s] if @object.base.respond_to?(:columns_hash)
      end

      # Returns the association reflection for the method if it exists
      def reflection_for(method)
        @object.base.reflect_on_association(method) if @object.base.respond_to?(:reflect_on_association)
      end

    end    
  end
end
=======
require 'active_admin/filters/dsl'
require 'active_admin/filters/resource_extension'
require 'active_admin/filters/formtastic_addons'
require 'active_admin/filters/forms'

# Add our Extensions
ActiveAdmin::ResourceDSL.send :include, ActiveAdmin::Filters::DSL
ActiveAdmin::Resource.send    :include, ActiveAdmin::Filters::ResourceExtension
ActiveAdmin::ViewHelpers.send :include, ActiveAdmin::Filters::ViewHelper
>>>>>>> bbf6233a (better filter defaults)
