require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')



describe ActiveAdmin, "Routing" do

  before :each do
    load_defaults!
    reload_routes!
  end

  include Rails.application.routes.url_helpers

  describe "standard resources" do
    it "should route the index path" do
      admin_posts_path.should == "/admin/posts"
    end

    it "should route the show path" do
      admin_post_path(1).should == "/admin/posts/1"
    end

<<<<<<< HEAD
    it "should route the new path" do
      new_admin_post_path.should == "/admin/posts/new"
    end

    it "should route the edit path" do
      edit_admin_post_path(1).should == "/admin/posts/1/edit"
=======
    context "with member action" do
      context "without an http verb" do
        before do
          load_resources do
            ActiveAdmin.register(Post){ member_action "do_something" }
          end
        end

        it "should default to GET" do
          {:get  => "/admin/posts/1/do_something"}.should     be_routable
          {:post => "/admin/posts/1/do_something"}.should_not be_routable
        end
      end

      context "with one http verb" do
        before do
          load_resources do
            ActiveAdmin.register(Post){ member_action "do_something", :method => :post }
          end
        end

        it "should properly route" do
          {:post => "/admin/posts/1/do_something"}.should be_routable
        end
      end

      context "with two http verbs" do
        before do
          load_resources do
            ActiveAdmin.register(Post){ member_action "do_something", :method => [:put, :delete] }
          end
        end

        it "should properly route the first verb" do
          {:put => "/admin/posts/1/do_something"}.should be_routable
        end

        it "should properly route the second verb" do
          {:delete => "/admin/posts/1/do_something"}.should be_routable
        end
      end
>>>>>>> 960a08bf (whitespace cleanup)
    end
  end

  describe "belongs to resource" do
    it "should route the nested index path" do
      admin_user_posts_path(1).should == "/admin/users/1/posts"
    end

    it "should route the nested show path" do
      admin_user_post_path(1,2).should == "/admin/users/1/posts/2"
    end

    it "should route the nested new path" do
      new_admin_user_post_path(1).should == "/admin/users/1/posts/new"
    end

    it "should route the nested edit path" do
      edit_admin_user_post_path(1,2).should == "/admin/users/1/posts/2/edit"
    end
  end

end
