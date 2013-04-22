<<<<<<< HEAD
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper') 
=======
require 'spec_helper'
>>>>>>> 960a08bf (whitespace cleanup)

describe ActiveAdmin::Namespace do

  context "when new" do
    let(:namespace){ ActiveAdmin::Namespace.new(:admin) }

    it "should have a name" do
      namespace.name.should == :admin
    end

    it "should have no resources" do
<<<<<<< HEAD
      namespace.resources.should == {}
=======
      namespace.resources.should be_empty
    end

    it "should not have any menu item" do
      if ActiveAdmin::Dashboards.built?
        # DEPRECATED behavior. If a dashboard was built while running this
        # spec, then an item gets added to the menu
        namespace.fetch_menu(:default).children.should_not be_empty
      else
        namespace.fetch_menu(:default).children.should be_empty
      end
    end
  end # context "when new"

  describe "settings" do
    let(:namespace){ ActiveAdmin::Namespace.new(application, :admin) }

    it "should inherit the site title from the application" do
      ActiveAdmin::Namespace.setting :site_title, "Not the Same"
      namespace.site_title.should == application.site_title
>>>>>>> 5a736047 (make ResourceCollection behave more like a Hash)
    end

    it "should have an empty menu" do
      namespace.menu.items.should be_empty
    end
  end

  describe "registering a resource" do

    let(:namespace){ ActiveAdmin::Namespace.new(:admin) }

    context "with no configuration" do
      before do
        namespace.register Category
      end
      it "should store the namespaced registered configuration" do
        namespace.resources.keys.should include('Category')
      end
      it "should create a new controller in the default namespace" do
        defined?(Admin::CategoriesController).should be_true
      end
      it "should create the dashboard controller" do
        defined?(Admin::DashboardController).should be_true
      end
      it "should create a menu item" do
        namespace.load_menu!
        namespace.menu["Categories"].should be_an_instance_of(ActiveAdmin::MenuItem)
        namespace.menu["Categories"].url.should == "/admin/categories"
      end
    end

    context "with a block configuration" do
      it "should be evaluated in the controller" do
        lambda {
          namespace.register Category do
            raise "Hello World"
          end
        }.should raise_error
      end
    end

    context "with a resource that's namespaced" do
      before do
        module ::Mock; class Resource; end; end
        namespace.register Mock::Resource
      end
      
      it "should store the namespaced registered configuration" do
        namespace.resources.keys.should include('MockResource')
      end
      it "should create a new controller in the default namespace" do
        defined?(Admin::MockResourcesController).should be_true
      end
      it "should create a menu item" do
        namespace.load_menu!
        namespace.menu["Mock Resources"].should be_an_instance_of(ActiveAdmin::MenuItem)
      end
      it "should use the resource as the model in the controller" do
        Admin::MockResourcesController.resource_class.should == Mock::Resource
      end
    end

    describe "adding to the menu" do

      describe "adding as a top level item" do
        before do
          namespace.register Category
          namespace.load_menu!
        end
        it "should add a new menu item" do
          namespace.menu['Categories'].should_not be_nil
        end
      end

      describe "adding as a child" do
        before do
          namespace.register Category do
            menu :parent => 'Blog'
          end
          namespace.load_menu!
        end
        it "should generate the parent menu item" do
          namespace.menu['Blog'].should_not be_nil
        end
        it "should generate its own child item" do
          namespace.menu['Blog']['Categories'].should_not be_nil
        end
      end

<<<<<<< HEAD
      describe "disabling the menu" do
        before do
          namespace.register Category do
            menu false
          end
          namespace.load_menu!
        end
        it "should not create a menu item" do
          namespace.menu["Category"].should be_nil
        end
=======
      namespace.fetch_menu(:test)["menu item"].should_not be_nil
    end
  end

  describe "utility navigation" do
    let(:namespace){ ActiveAdmin::Namespace.new(application, :admin) }
    let(:menu) do
      namespace.build_menu :utility_navigation do |menu|
        menu.add :label => "ActiveAdmin.info", :url => "http://www.activeadmin.info", :html_options => { :target => :blank }
        namespace.add_logout_button_to_menu menu, 1, :class => "matt"
>>>>>>> 960a08bf (whitespace cleanup)
      end
    end

  end  

end
