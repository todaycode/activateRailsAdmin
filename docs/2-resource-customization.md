# Working with Resources

Every Active Admin resource corresponds to a Rails model. So before creating a 
resource you must first create a regular Rails model.

## Create a Resource

The basic command for creating a resource is `rails generate active_admin:resource Post`. 
The resource's name uses CamelCase and must correspond to the model name. The generator 
will produce an empty `app/admin/post.rb` file with the following content:

    ActiveAdmin.register Post do
    
    end

All additional methods goes within the body of the `register` method.

## Enable CRUD Operations on a Resource

In Rails 4, to enable creating and updating records via the admin interface, add this to
`post.rb`:

    ActiveAdmin.register Post do
      controller do
        def permitted_params
          params.permit post: [:title, :content, :author]
        end
      end
    end

Due to the newly introduced [Strong Parameters](https://github.com/rails/strong_parameters) 
plug-in in Rails 4 you are required to explicitly allow attributes for mass updating and thus 
prevent them from accidentally being exposed.

If your resource is nested, declare `permit_params` after `belongs_to`:

```ruby
ActiveAdmin.register Post do
  belongs_to :user
  permit_params :title, :content, :publisher_id
end
```

The `permit_params` call creates a method called `permitted_params`. You should use this method when overriding `create` or `update` actions:

```ruby
ActiveAdmin.register Post do
  controller do
    def create
      # Good
      @post = Post.new(permitted_params[:post])
      # Bad
      @post = Post.new(params[:post])

      if @post.save
        # ...
      end
    end
  end
end
```

## Disabling Actions on a Resource

All default CRUD actions are enabled by default. These can be disabled for a given resource:

    ActiveAdmin.register Post do
      actions :all, except: [:update, :destroy]
    end

## Rename the Resource

By default, any references to the resource (menu, routes, buttons, etc) in the
interface will use the name of the class. You can rename the resource by using
the <tt>:as</tt> option.

    ActiveAdmin.register Post, :as => "Article"

The resource will then be available as /admin/articles.

This will also change the key of the resource params passed to the controller. In Rails 4, the `permitted_params` key will need to be changed from `:post` to `:article`.

## Customize the Namespace

By default, resources live in the "admin" namespace.

You can register resources in different namespaces:

    # Available at /today/posts
    ActiveAdmin.register Post, :namespace => "today"

    # Available at /posts
    ActiveAdmin.register Post, :namespace => false


## Customize the Menu

The resource will be displayed in the global navigation by default. To disable
the resource from being displayed in the global navigation, pass `false` to the
`menu` method:

    ActiveAdmin.register Post do
      menu false
    end

The menu method accepts a hash with the following options:

* `:label` - The string label to display in the menu
* `:parent` - The string label of the parent to set for this menu
* `:if` - A block or a symbol of a method to call to decide if the menu item
  should be displayed
* `:priority` - The integer value of the priority. Defaults to 10

### Labels

To change the name of the label in the menu:

    ActiveAdmin.register Post do
      menu :label => "My Posts"
    end

By default the menu uses a pluralized version of your resource name.

### Drop Down Menus

In many cases, a single level navigation will not be enough for the
administration of a production application. In that case, you can categorize
your resources and creating drop down menus to access them.

To add the menu as a child of another menu:

    ActiveAdmin.register Post do
      menu :parent => "Blog"
    end

Note, the "Blog" menu does not even have to exist yet. It will be generated on
the fly as a drop down list for you.

### Menu Priority

By default Active Admin sorts menus alphabetically. Some times you want specific
resources to show up at the beginning or the end of your menu.

Each menu item is given an integer priority value (default 10). You can set it
to edit the location of the menu item.

    ActiveAdmin.register Post do
      menu :priority => 1
    end

This would ensure that the Post menu item, is at the beginning of the menu.

### Conditionally Showing / Hiding Menu Items

Menu items can be shown or hidden at runtime using the `:if` option.

    ActiveAdmin.register Post do
      menu :if => proc{ current_admin_user.can_edit_posts? }
    end

The `proc` will be called in the context of the view, so you have access to all
your helpers and current user session information.

## Scoping the queries

If your administrators have different access levels, you may sometimes want to
scope what they have access to. Assuming your User model has the proper
has_many relationships, you can simply scope the listings and finders like so:

    ActiveAdmin.register Post do
      scope_to :current_user

      # or if the association doesn't have the default name.
      # scope_to :current_user, :association_method => :blog_posts
    end

That approach limits the posts an admin can access to ```current_user.posts```.

If you want to conditionally apply the scope, then there are options for that as well:

    ActiveAdmin.register Post do
      # Only scope the query if there is a user to scope to, helper provided via Devise
      scope_to :current_user, :if => proc{ admin_user_signed_in? }

      # Don't scope the query if the user is an admin
      scope_to :current_user, :unless => proc{ current_admin_user.admin? }

      # Get fancy and can combine with block syntax
      scope_to :if => proc{ admin_user_signed_in? } do
        User.most_popular
      end
    end

If you want to do something fancier, for example override a default scope, you can
also use :association_method parameter with a normal method on your User model.
The only requirement is that your method returns an instance of ActiveRecord::Relation.

    class Ad < ActiveRecord::Base
      default_scope lambda { where :published => true }
    end

    class User < ActiveRecord::Base
      def managed_ads
        # Overrides Ad's default_scope
        Ad.unscoped
      end
    end

    ActiveAdmin.register Ad do
      scope_to :current_user, :association_method => :managed_ads
    end

In case you just need to customize the query independently of the current user, you can
override the `scoped_collection` method on the controller:

    ActiveAdmin.register Post do
      controller do
        def scoped_collection
          Post.includes(:author)
        end
      end
    end

## Customizing resource retrieval

If you need to completely replace the record retrieving code (e.g., you have a custom
`to_param` implementation in your models), override the `resource` method on the controller:

    ActiveAdmin.register Post do
      controller do
        def resource
          Post.where(id: params[:id]).first!
        end
      end
    end

In fact, the controllers use [Inherited Resources](https://github.com/josevalim/inherited_resources),
so you can use all the
[customization features in Inherited Resources](https://github.com/josevalim/inherited_resources#overwriting-defaults).


## Belongs To

It's common to want to scope a series of resources to a relationship. For
example a Project may have many Milestones and Tickets. To nest the resource
within another, you can use the `belongs_to` method:

    ActiveAdmin.register Project do
    end

    ActiveAdmin.register Ticket do
      belongs_to :project
    end

Projects will be available as usual and tickets will be availble by visiting
"/admin/projects/1/tickets" assuming that a Project with the id of 1 exists.
Active Admin does not add "Tickets" to the global navigation because the routes
can only be generated when there is a project id.

To create links to the resource, you can add them to a sidebar (one of the many
possibilities for how you may with to handle your user interface):

    ActiveAdmin.register Project do

      sidebar "Project Details", only: [:show, :edit] do
        ul do
          li link_to("Tickets", admin_project_tickets_path(project))
          li link_to("Milestones", admin_project_milestones_path(project))
        end
      end

    end

    ActiveAdmin.register Ticket do
      belongs_to :project
    end

    ActiveAdmin.register Milestone do
      belongs_to :project
    end


In some cases (like Projects), there are many sub resources and you would
actually like the global navigation to switch when the user navigates "into" a
project. To accomplish this, Active Admin stores the `belongs_to` resources in a
seperate menu which you can use if you so wish. To use:

    ActiveAdmin.register Ticket do
      belongs_to   :project
      display_menu :project
    end

    ActiveAdmin.register Milestone do
      belongs_to   :project
      display_menu :project
    end

Now, when you navigate to the tickets section, the global navigation will
only display "Tickets" and "Milestones". When you navigate back to a
non-belongs_to resource, it will switch back to the default menu.
