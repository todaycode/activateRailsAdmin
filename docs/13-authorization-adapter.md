# Authorization Adapter

Active Admin offers the ability to define and use your own authorization
adapter. If implemented, the '#authorized?' will be called when an action is
taken. By default, '#authorized?' returns true.


## Setting up your own AuthorizationAdapter

The following example shows how to set up and tie your authorization
adapter class to Active Admin:

    # app/models/only_authors_authorization.rb
    class OnlyAuthorsAuthorization < ActiveAdmin::AuthorizationAdapter

        def authorized?(action, subject = nil)
          case subject
          when normalized(Post)

            # Only let the author update and delete posts
            if action == :update || action == :destroy
              subject.author == user

            # If it's not an update or destroy, anyone can view it
            else
              true
            end

          else
            true
          end
        end

    end

In order to hook up `OnlyAuthorsAuthorization` to Active Admin, go to your
application's `config/initializers/active_admin.rb` and add/modify the line:

    config.authorization_adapter = "OnlyAuthorsAuthorization"

Authorization adapters can be configured per ActiveAdmin namespace as well, for example:

    ActiveAdmin.setup do |config|
      config.namespace :admin do |ns|
        ns.authorization_adapter = "AdminAuthorization"
      end
      config.namespace :my do |ns|
        ns.authorization_adapter = "DashboardAuthorization"
      end
    end

Now, whenever a controller action is performed, the `OnlyAuthorsAuthorization`'s
`#authorized?` method will be called.


## Getting Access to the Current User

From within your authorization adapter, you can call the `#user` method to
retrieve the current user.

    class OnlyAdmins < ActiveAdmin::AuthorizationAdapter

      def authorized?(action, subject = nil)
        user.admin?
      end

    end


## Scoping Collections in Authorization Adapters

`ActiveAdmin::AuthorizationAdapter` also provides a hook method (`#scope_collection`)
for the adapter to scope the resource's collection. For example, you may want to
centralize the scoping:

    class OnlyMyAccount < ActiveAdmin::AuthorizationAdapter

      def authorized?(action, subject = nil)
        subject.account == user.account
      end

      def scope_collection(collection, action = Auth::READ)
        collection.where(:account_id => user.account_id)
      end

    end

All collections presented on Index Screens will be passed through this method
and will be scoped accordingly.


## Managing Access to Pages

Pages, just like resources, get authorized too. When authorizing a page, the
subject will be an instance of `ActiveAdmin::Page`.

    class OnlyDashboard < ActiveAdmin::AuthorizationAdapter
      def authorized?(action, subject = nil)
        case subject
        when ActiveAdmin::Page
          if action == :read && subject.name == "Dashboard"
            true
          else
            false
          end
        else
          false
        end
      end
    end


## Action Types

By default Active Admin simplifies the controller actions into 4 actions:

* `:read` - This controls if the user can view the menu item as well as the
  index and show screens.
* `:create` - This controls if the user can view the new screen and submit
  the form to the create action.
* `:update` - This controls if the user can view the edit screen and submit
  the form to the update action.
* `:destroy` - This controls if the user can delete a resource.

Each of these actions is available as a constant. Eg: `:read` is available as
`ActiveAdmin::Authorization::READ`.


## Checking for Authorization in Controllers and Views

Active Admin provides a helper method to check if the current user is
authorized to perform an action on a subject.

Use the `#authorized?(action, subject)` method to check.

    ActiveAdmin.register Post do

      index do
        column :title
        column "" do |post|
          if authorized?(:update, post)
            link_to("Edit", admin_post_path(post))
          end
        end

      end

    end

If you are implementing a custom controller action, you can use the
`#authorize!` method to raise an `ActiveAdmin::AccessDenied` exception.

    ActiveAdmin.register Post do

      member_action :publish, :method => :post do
        post = Post.find(params[:id])

        authorize! :publish, post
        post.publish!

        flash[:notice] = "Post has been published"
        redirect_to [:admin, post]
      end

      action_item :only => :show do
        if !post.published? && authorized?(:publish, post)
          link_to("Publish", publish_admin_post_path(post), :method => :post)
        end
      end

    end


## Using the CanCan Adapter

Sub-classing `ActiveAdmin::AuthorizationAdapter` is fairly low level. Many times
it's nicer to have a simpler DSL for managing authorization. Active Admin
provides an adapter out of the box for [CanCan](https://github.com/ryanb/cancan).

To use the CanCan adapter, update the configuration in the Active Admin
initializer:

    config.authorization_adapter = ActiveAdmin::CanCanAdapter
    
You can also specify a method to be called on unauthorized access. This is necessary
in order to prevent a redirect loop that can happen if a user tries to access a page
they don't have permissions for (see [#2081](https://github.com/activeadmin/activeadmin/issues/2081)).

```ruby
config.on_unauthorized_access = :access_denied
```    

The method `access_denied` would be defined in `application_controller.rb`. Here is one
example that redirects the user from the page they don't have permission to
access to a resource they have permission to access (organizations in this case), and
also displays the error message in the browser:

```ruby
class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def access_denied(exception)
    redirect_to admin_organizations_path, :alert => exception.message
  end
end
```

By default this will use the ability class named "Ability". This can also be
changed from the initializer:

    config.cancan_ability_class = "MyCustomAbility"

Now you can simply use CanCan the way that you would expect and Active Admin
will use it for authorization:

    # app/models/ability.rb
    class Ability
      include CanCan::Ability

      def initialize(user)
        can :manage, Post
        can :read, User
        can :manage, User, :id => user.id
        can :read, ActiveAdmin::Page, :name => "Dashboard"
      end

    end

<<<<<<< HEAD
To view more details about the CanCan API, visit [https://github.com/ryanb/cancan](https://github.com/ryanb/cancan).
=======
You can simply use Pundit the way that you would expect and Active Admin will use it for authorization. Check Pundit's documentation to [set up Pundit in your application](https://github.com/elabs/pundit#installation). If you want to use batch actions just ensure that `destroy_all?` method is defined in your policy class. You can use this [template policy](https://github.com/activeadmin/activeadmin/blob/master/spec/support/templates/policies/application_policy.rb) in your application instead of default one generated by Pundit's `rails g pundit:install` command.
>>>>>>> 1e938ac5 (rename active_admin to activeadmin)
