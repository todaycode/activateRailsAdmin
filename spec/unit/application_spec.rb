require 'spec_helper'
require 'fileutils'

describe ActiveAdmin::Application do

  let(:application) { ActiveAdmin::Application.new }

  around do |example|
    old_load_paths = application.load_paths
    # TODO: Figure out why load paths need to be overriden
    application.load_paths = [File.expand_path('app/admin', Rails.root)]

    example.call

    application.load_paths = old_load_paths
  end

  it "should have a default load path of ['app/admin']" do
    application.load_paths.should == [File.expand_path('app/admin', Rails.root)]
  end

  it "should remove app/admin from the autoload path to remove the possibility of conflicts" do
    ActiveSupport::Dependencies.autoload_paths.should_not include(File.join(Rails.root, "app/admin"))
  end

  it "should remove app/admin from the eager load paths (Active Admin deals with loading)" do
    Rails.application.config.eager_load_paths.should_not include(File.join(Rails.root, "app/admin"))
  end

  it "should store the site's title" do
    application.site_title.should == ""
  end

  it "should set the site title" do
    application.site_title = "New Title"
    application.site_title.should == "New Title"
  end

  it "should store the site's title link" do
    application.site_title_link.should == ""
  end

  it "should set the site's title link" do
    application.site_title_link = "http://www.mygreatsite.com"
    application.site_title_link.should == "http://www.mygreatsite.com"
  end

  it "should store the site's title image" do
    application.site_title_image.should == ""
  end

  it "should set the site's title image" do
    application.site_title_image = "http://railscasts.com/assets/episodes/stills/284-active-admin.png?1316476106"
    application.site_title_image.should == "http://railscasts.com/assets/episodes/stills/284-active-admin.png?1316476106"
  end

  it "should have a view factory" do
    application.view_factory.should be_an_instance_of(ActiveAdmin::ViewFactory)
  end

  it "should allow comments by default" do
    application.allow_comments.should == true
  end

  describe "authentication settings" do

    it "should have no default current_user_method" do
      application.current_user_method.should == false
    end

    it "should have no default authentication method" do
      application.authentication_method.should == false
    end

    it "should have a logout link path (Devise's default)" do
      application.logout_link_path.should == :destroy_admin_user_session_path
    end

    it "should have a logout link method (Devise's default)" do
      application.logout_link_method.should == :get
    end
  end

  describe "inheritable settings" do
    it "should set csv_options" do
      application.csv_options.should == {}
    end

    context "when deprecated" do
      it "should set and warn csv_column_separator" do
        ActiveAdmin::Deprecation.should_receive(:warn)
        application.csv_column_separator.should == ','
      end
    end
  end

  describe "files in load path" do
    it "should load files in the first level directory" do
      application.files.should include(File.expand_path("app/admin/dashboard.rb", Rails.root))
    end

    it "should load files from subdirectories" do
      FileUtils.mkdir_p(File.expand_path("app/admin/public", Rails.root))
      test_file = File.expand_path("app/admin/public/posts.rb", Rails.root)
      FileUtils.touch(test_file)
      application.files.should include(test_file)
    end
  end

  describe "#namespace" do

    it "should yield a new namespace" do
      application.namespace :new_namespace do |ns|
        ns.name.should == :new_namespace
      end
    end

    it "should return an instantiated namespace" do
      admin = application.namespace :admin
      admin.should == application.namespaces[:admin]
    end

    it "should yield an existing namespace" do
      expect {
        application.namespace :admin do |ns|
          ns.should == application.namespaces[:admin]
          raise "found"
        end
      }.to raise_error("found")
    end
<<<<<<< HEAD
=======

    it "should admit both strings and symbols" do
      expect {
        application.namespace "admin" do |ns|
          expect(ns).to eq application.namespaces[:admin]
          raise "found"
        end
      }.to raise_error("found")
    end

    it "should not pollute the global app" do
      expect(application.namespaces).to be_empty
      application.namespace(:brand_new_ns)
      expect(application.namespaces.names).to eq [:brand_new_ns]
      expect(ActiveAdmin.application.namespaces.names).to eq [:admin]
    end
>>>>>>> e0ac14d0 (Convert namespace to sym to prevent duplicate namespaces (#5931))
  end

  describe "#register_page" do
    it "finds or create the namespace and register the page to it" do
      namespace = mock
      application.should_receive(:namespace).with("public").and_return namespace
      namespace.should_receive(:register_page).with("My Page", {:namespace => "public"})

      application.register_page("My Page", :namespace => "public")
    end
  end

end
