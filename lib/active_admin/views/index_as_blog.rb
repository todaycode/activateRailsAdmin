module ActiveAdmin
  module Views

    # = Index as Blog
    #
    # Render your index page as a set of posts. The post has two main options:
    # title and body.
    #
    #     index :as => :blog do
    #       title :my_title # Calls #my_title on each resource
    #       body  :my_body  # Calls #my_body on each resource
    #     end
    #
    # == Post Title
    #
    # The title is the content that will be rendered within a link to the
    # resource. There are two main ways to set the content for the title
    #
    # First, you can pass in a method to be called on your
    # resource. For example:
    #
    #     index :as => :blog do
    #       title :a_method_to_call
    #     end
    #
    # This will result in the title of the post being the return value of
    # Resource#a_method_to_call
    #
    # Second, you can pass a block to the tile option which will then be
    # used as the contents of the title. The resource being rendered
    # is passed in to the block. For Example:
    #
    #     index :as => :blog do
    #       title do |post|
    #         span post.title, :class => 'title'
    #         span post.created_at, :class => 'created_at'
    #       end
    #     end
    #
    # == Post Body
    #
    # The body is rendered underneath the title of each post. The same two
    # style of options work as the Post Title above.
    #
    # Call a method on the resource as the body:
    #
    #     index :as => :blog do
    #       title :my_title
    #       body :my_body # Return value of #my_body will be the body
    #     end
    #
    # Or, render a block as the body:
    #
    #     index :as => :blog do
    #       title :my_title
    #       body do |post|
    #         div truncate(post.title)
    #         div :class => 'meta' do
    #           span "Post in #{post.categories.join(', ')}"
    #         end
    #       end
    #     end
    #
    class IndexAsBlog < ActiveAdmin::Component

      def build(page_presenter, collection)
        @page_presenter = page_presenter
        @collection = collection

        # Call the block passed in. This will set the
        # title and body methods
        instance_eval &page_presenter.block if page_presenter.block

        add_class "index"
        build_posts
      end

      # Setter method for the configuration of the title
      def title(method = nil, &block)
        if block_given? || method
          @title = block_given? ? block : method
        end
        @title
      end


      # Setter method for the configuration of the body
      #
      def body(method = nil, &block)
        if block_given? || method
          @body = block_given? ? block : method
        end
        @body
      end

      def self.index_name
        "blog"
      end

      private

      def build_posts
        resource_selection_toggle_panel if active_admin_config.batch_actions.any?
        @collection.each do |post|
          build_post(post)
        end
      end

      def build_post(post)
        div :for => post do
          resource_selection_cell(post) if active_admin_config.batch_actions.any?
          build_title(post)
          build_body(post)
        end
      end

      def build_title(post)
        if @title
          h3 do
            a(:href => resource_path(post)) do
             render_method_on_post_or_call_proc post, @title
            end
          end
        else
          h3 do
            auto_link(post)
          end
        end
      end

      def build_body(post)
        if @body
          div :class => 'content' do
            render_method_on_post_or_call_proc post, @body
          end
        end
      end

      def render_method_on_post_or_call_proc(post, proc)
        case proc
        when String,Symbol
          post.send proc
        else
          instance_exec post, &proc
        end
      end

    end # Posts
  end
end
