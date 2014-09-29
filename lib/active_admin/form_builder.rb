require 'formtastic'

module ActiveAdmin
  class FormBuilder < ::Formtastic::SemanticFormBuilder

    attr_reader :form_buffers
    
    def initialize(*args)
      @form_buffers = ["".html_safe]
      super
    end

    def inputs(*args, &block)
<<<<<<< HEAD
      # Store that we are creating inputs without a block
      @inputs_with_block = block_given? ? true : false
      content = with_new_form_buffer { super }
      form_buffers.last << content.html_safe
=======
      @use_form_buffer = block_given?
      form_buffers.last << with_new_form_buffer{ super }
>>>>>>> fb69f7f7 (use the form buffer!)
    end

    # The input method returns a properly formatted string for
    # its contents, so we want to skip the internal buffering
    # while building up its contents
    def input(method, *args)
<<<<<<< HEAD
      return if polymorphic_belongs_to_association?(method)
      
      content = with_new_form_buffer { super }
      return content.html_safe unless @inputs_with_block
      form_buffers.last << content.html_safe
=======
      content = with_new_form_buffer{ super }
      @use_form_buffer ? form_buffers.last << content : content
>>>>>>> fb69f7f7 (use the form buffer!)
    end

    # The buttons method always needs to be wrapped in a new buffer
    def buttons(*args, &block)
      content = with_new_form_buffer do
        block_given? ? super : super { commit_button_with_cancel_link }
      end
      form_buffers.last << content.html_safe
    end

    def commit_button(*args)
      content = with_new_form_buffer{ super }
      form_buffers.last << content.html_safe
    end
    
    def cancel_link(url = nil, html_options = {}, li_attributes = {})
      li_attributes[:class] ||= "cancel"
      url ||= {:action => "index"}
      template.content_tag(:li, (template.link_to "Cancel", url, html_options), li_attributes)
    end
    
    def commit_button_with_cancel_link
      content = commit_button
      content << cancel_link
    end
    
    def datepicker_input(method, options)
      options = options.dup
      options[:input_html] ||= {}
      options[:input_html][:class] = [options[:input_html][:class], "datepicker"].compact.join(' ')
      options[:input_html][:size] ||= "10"
      string_input(method, options)
    end

    def has_many(association, options = {}, &block)
      options = { :for => association, :new_record => true }.merge(options)
      options[:class] ||= ""
      options[:class] << "inputs has_many_fields"

      # Add Delete Links
      form_block = proc do |has_many_form|
<<<<<<< HEAD
        block.call(has_many_form) + if has_many_form.object.new_record?
                                      template.content_tag :li do
                                        template.link_to "Delete", "#", :onclick => "$(this).closest('.has_many_fields').remove(); return false;", :class => "button"
                                      end
                                    else
                                    end
=======
        # @see https://github.com/justinfrench/formtastic/blob/2.2.1/lib/formtastic/helpers/inputs_helper.rb#L373
        contents = if block.arity == 1  # for backwards compatibility with REE & Ruby 1.8.x
          block.call(has_many_form)
        else
          index = parent_child_index(options[:parent]) if options[:parent]
          block.call(has_many_form, index)
        end

        if has_many_form.object.new_record?
          contents += template.content_tag(:li) do
            template.link_to I18n.t('active_admin.has_many_delete'), "#", :onclick => "$(this).closest('.has_many_fields').remove(); return false;", :class => "button"
          end
        elsif options[:allow_destroy]
          has_many_form.input :_destroy, :as => :boolean, :wrapper_html => {:class => "has_many_remove"},
                                                          :label => I18n.t('active_admin.has_many_remove')

        end

        contents
>>>>>>> 30186732 (Add :allow_destroy option to has_many forms)
      end

      content = with_new_form_buffer do
        template.content_tag :div, :class => "has_many #{association}" do
          form_buffers.last << template.content_tag(:h3, association.to_s.titlecase)
          inputs options, &form_block

<<<<<<< HEAD
          # Capture the ADD JS
          js = with_new_form_buffer do
            inputs_for_nested_attributes  :for => [association, object.class.reflect_on_association(association).klass.new],
                                          :class => "inputs has_many_fields",
                                          :for_options => {
                                            :child_index => "NEW_RECORD"
                                          }, &form_block
          end
=======
          js = options[:new_record] ? js_for_has_many(association, form_block, template) : ""
          form_buffers.last << js.html_safe
        end
      end
    end

    def semantic_errors(*args)
      form_buffers.last << with_new_form_buffer{ super }
    end

    # These methods are deprecated and removed from Formtastic, however are
    # supported here to help with transition.
    module DeprecatedMethods
>>>>>>> 7810ac38 ([Added] option to hide new record link for has_many form and changed documentation.)

          js = template.escape_javascript(js)
          js = template.link_to "Add New #{association.to_s.singularize.titlecase}", "#", :onclick => "$(this).before('#{js}'.replace(/NEW_RECORD/g, new Date().getTime())); return false;", :class => "button"

          form_buffers.last << js.html_safe
        end
      end
      form_buffers.last << content.html_safe
    end
<<<<<<< HEAD
    
    def semantic_errors(*args)
      content = with_new_form_buffer { super }
      form_buffers.last << content.html_safe unless content.nil?
=======

    # Overrides Formtastic's version to include ActiveAdmin::Inputs::*
    def input_class_with_const_defined(as)
      input_class_name = custom_input_class_name(as)

      if ::Object.const_defined?(input_class_name)
        input_class_name.constantize
      elsif ActiveAdmin::Inputs.const_defined?(input_class_name)
        active_admin_input_class_name(as).constantize
      elsif Formtastic::Inputs.const_defined?(input_class_name)
        standard_input_class_name(as).constantize
      else
        raise Formtastic::UnknownInputError, "Unable to find input class #{input_class_name}"
      end
>>>>>>> 1b96e23c (modularize the search method dropdown for the filter form)
    end

<<<<<<< HEAD
    private
=======
    # use auto-loading in development environment
    def input_class_by_trying(as)
      begin
        custom_input_class_name(as).constantize
      rescue NameError
        begin
          active_admin_input_class_name(as).constantize
        rescue NameError
          standard_input_class_name(as).constantize
        end
      end
    rescue NameError
      raise Formtastic::UnknownInputError, "Unable to find input class for #{as}"
    end
>>>>>>> 02960bb5 (one too many begin/end blocks)

    # Pass in a method to check if it's a polymorphic association
    def polymorphic_belongs_to_association?(method)
      reflection = reflection_for(method)
      
      reflection && reflection.macro == :belongs_to && reflection.options[:polymorphic]
    end

    def with_new_form_buffer
      form_buffers << "".html_safe
      return_value = yield
      form_buffers.pop
      return_value
    end
<<<<<<< HEAD
    
=======

    # Capture the ADD JS
    def js_for_has_many(association, form_block, template)
      assoc_reflection = object.class.reflect_on_association(association)
      assoc_name       = assoc_reflection.klass.model_name
      placeholder      = "NEW_#{assoc_name.to_s.underscore.upcase.gsub(/\//, '_')}_RECORD"
      opts = {
        :for         => [association, assoc_reflection.klass.new],
        :class       => "inputs has_many_fields",
        :for_options => { :child_index => placeholder }
      }
      js = with_new_form_buffer{ inputs_for_nested_attributes opts, &form_block }
      js = template.escape_javascript js

      onclick = "$(this).before('#{js}'.replace(/#{placeholder}/g, new Date().getTime())); return false;"
      text    = I18n.t 'active_admin.has_many_new', :model => assoc_name.human

      template.link_to(text, "#", :onclick => onclick, :class => "button").html_safe
    end

>>>>>>> 8c57442a (fix Rails 4 problem with form builder ("undefined method `upcase'"))
  end
end
