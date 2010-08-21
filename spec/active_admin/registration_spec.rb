require File.expand_path(File.dirname(__FILE__) + '/../spec_helper') 

describe "Registering an object to administer" do

  context "with no configuration" do
    before do
      ActiveAdmin.register Category
      reload_routes!
    end
    it "should store the namespaced registered configuration" do
      ActiveAdmin.resources.keys.should include('Admin::Category')
    end
    it "should create a new controller in the default namespace" do
      defined?(Admin::CategoriesController).should be_true
    end
    it "should create a menu item" do
      ActiveAdmin.menus[:admin]["Categories"].should be_an_instance_of(ActiveAdmin::MenuItem)
      ActiveAdmin.menus[:admin]["Categories"].url.should == "/admin/categories"
    end
  end

  context "with a different namespace" do
    before do
      ActiveAdmin.register Category, :namespace => :hello_world
      reload_routes!
    end
    it "should register the controller" do
      defined?(HelloWorld::CategoriesController).should be_true
    end
    it "should create a menu item" do
      ActiveAdmin.menus[:hello_world]["Categories"].should be_an_instance_of(ActiveAdmin::MenuItem)
      ActiveAdmin.menus[:hello_world]["Categories"].url.should == "/hello_world/categories"
    end
  end

  context "with no namespace" do
    before do
      ActiveAdmin.register Category, :namespace => false
      reload_routes!
    end
    it "should register the controller" do
      defined?(CategoriesController).should be_true
    end
    it "should create a menu item" do
      ActiveAdmin.menus[:root]["Categories"].should be_an_instance_of(ActiveAdmin::MenuItem)
      ActiveAdmin.menus[:root]["Categories"].url.should == "/categories"
    end    
  end

  context "with a block configuration" do
    it "should be evaluated in the controller" do
      lambda {
        ActiveAdmin.register Category do
          raise "Hello World"
        end
      }.should raise_error
    end
  end

  context "with a resource that's namespaced" do
    before do
      module ::Mock; class Resource; end; end
      ActiveAdmin.register Mock::Resource
      reload_routes!
    end
    
    it "should store the namespaced registered configuration" do
      ActiveAdmin.resources.keys.should include('Admin::MockResource')
    end
    it "should create a new controller in the default namespace" do
      defined?(Admin::MockResourcesController).should be_true
    end
    it "should create a menu item" do
      ActiveAdmin.menus[:admin]["Mock Resources"].should be_an_instance_of(ActiveAdmin::MenuItem)
      ActiveAdmin.menus[:admin]["Mock Resources"].url.should == "/admin/mock_resources"
    end
    it "should use the resource as the model in the controller" do
      Admin::MockResourcesController.resource_class.should == Mock::Resource
    end
  end


  describe "menu system" do

    describe "adding as a top level item" do
      before do
        ActiveAdmin.register Category
      end
      it "should add a new menu item" do
        ActiveAdmin.menus[:admin]['Categories'].should_not be_nil
      end
    end

    describe "adding as a child" do
      before do
        ActiveAdmin.register Category do
          menu :parent => 'Blog'
        end
      end
      it "should generate the parent menu item" do
        ActiveAdmin.menus[:admin]['Blog'].should_not be_nil
      end
      it "should generate its own child item" do
        ActiveAdmin.menus[:admin]['Blog']['Categories'].should_not be_nil
      end
    end

    describe "disabling the menu" do
      # TODO
      it "should not create a menu item"
    end
  end

end
