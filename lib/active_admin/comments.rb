require 'active_admin/comments/comment'
require 'active_admin/comments/views'
require 'active_admin/comments/show_page_helper'
require 'active_admin/comments/namespace_helper'
require 'active_admin/comments/resource_helper'

# Add the comments configuration
ActiveAdmin::Application.inheritable_setting :allow_comments,             true
ActiveAdmin::Application.inheritable_setting :show_comments_in_menu,      true
ActiveAdmin::Application.inheritable_setting :comments_registration_name, 'Comment'

# Add the comments module to ActiveAdmin::Namespace
ActiveAdmin::Namespace.send :include, ActiveAdmin::Comments::NamespaceHelper

# Add the comments module to ActiveAdmin::Resource
ActiveAdmin::Resource.send :include, ActiveAdmin::Comments::ResourceHelper

# Add the module to the show page
ActiveAdmin.application.view_factory.show_page.send :include, ActiveAdmin::Comments::ShowPageHelper

# Walk through all the loaded resources after they are loaded
ActiveAdmin.after_load do |app|
  app.namespaces.values.each do |namespace|
    if namespace.comments?
      namespace.register ActiveAdmin::Comment, :as => namespace.comments_registration_name do
        actions :index, :show, :create

        menu false unless namespace.show_comments_in_menu

        config.comments      = false # Don't allow comments on comments
        config.batch_actions = false # The default destroy batch action isn't showing up anyway...

        scope :all, :show_count => false
        # Register a scope for every namespace that exists.
        # The current namespace will be the default scope.
        app.namespaces.values.map(&:name).each do |name|
          scope name, :default => namespace.name == name do |scope|
            scope.where :namespace => name.to_s
          end
        end

        # Store the author and namespace
        before_save do |comment|
          comment.namespace = active_admin_config.namespace.name
          comment.author    = current_active_admin_user
        end

        # Redirect to the resource show page after comment creation
        controller do
          # Prevent N+1 queries
          def scoped_collection
            resource_class.includes :author, :resource
          end unless Rails::VERSION::MAJOR == 3 && Rails::VERSION::MINOR == 0
          def create
            create! do |success, failure|
              success.html{ redirect_to :back }
              failure.html do
                flash[:error] = I18n.t 'active_admin.comments.errors.empty_text'
                redirect_to :back
              end
            end
          end
        end

        index do
          column I18n.t('active_admin.comments.resource_type'), :resource_type
          column I18n.t('active_admin.comments.author_type'),   :author_type
          column I18n.t('active_admin.comments.resource'),      :resource
          column I18n.t('active_admin.comments.author'),        :author
          column I18n.t('active_admin.comments.body'),          :body
          actions
        end
      end
    end
  end
end
