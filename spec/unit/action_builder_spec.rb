<<<<<<< HEAD
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper') 
=======
require 'spec_helper'
>>>>>>> 960a08bf (whitespace cleanup)

describe ActiveAdmin::ActionBuilder do

  let(:controller){ Admin::PostsController }

  describe "generating a new member action" do
    before do
      action!
      reload_routes!
    end

    after(:each) do
      controller.clear_member_actions!
    end

    context "with a block" do
      let(:action!) do
        controller.member_action :comment do
          # Do nothing
        end
      end

      it "should create a new public instance method" do
        controller.public_instance_methods.collect(&:to_s).should include("comment")
      end
      it "should add itself to the member actions config" do
        controller.active_admin_config.member_actions.size.should == 1
      end
      it "should create a new named route" do
        Rails.application.routes.url_helpers.methods.collect(&:to_s).should include("comment_admin_post_path")
      end
    end

    context "without a block" do
<<<<<<< HEAD
      let(:action!){ controller.member_action :comment }
=======
      let(:action!) do
        ActiveAdmin.register Post do
          member_action :comment
        end
      end
>>>>>>> 960a08bf (whitespace cleanup)
      it "should still generate a new empty action" do
        controller.public_instance_methods.collect(&:to_s).should include("comment")
      end
    end
<<<<<<< HEAD
=======

    context "with :title" do
      let(:action!) do
        ActiveAdmin.register Post do
          member_action :comment, :title => "My Awesome Comment"
        end
      end

      subject { find_before_filter controller, :comment }

      it { should set_page_title_to "My Awesome Comment" }
    end
>>>>>>> 960a08bf (whitespace cleanup)
  end

  describe "generate a new collection action" do
    before do
      action!
      reload_routes!
    end
    after(:each) do
      controller.clear_collection_actions!
    end

    context "with a block" do
      let(:action!) do
        controller.collection_action :comments do
          # Do nothing
        end
      end
      it "should create a new public instance method" do
        controller.public_instance_methods.collect(&:to_s).should include("comments")
      end
      it "should add itself to the member actions config" do
        controller.active_admin_config.collection_actions.size.should == 1
      end
      it "should create a new named route" do
        Rails.application.routes.url_helpers.methods.collect(&:to_s).should include("comments_admin_posts_path")
      end
    end
    context "without a block" do
<<<<<<< HEAD
      let(:action!){ controller.collection_action :comments }
=======
      let(:action!) do
        ActiveAdmin.register Post do
          collection_action :comments
        end
      end
>>>>>>> 960a08bf (whitespace cleanup)
      it "should still generate a new empty action" do
        controller.public_instance_methods.collect(&:to_s).should include("comments")
      end
    end
<<<<<<< HEAD
=======
    context "with :title" do
      let(:action!) do
        ActiveAdmin.register Post do
          collection_action :comments, :title => "My Awesome Comments"
        end
      end

      subject { find_before_filter controller, :comments }

      it { should set_page_title_to "My Awesome Comments" }
    end
  end

  def find_before_filter(controller, action)
    controller._process_action_callbacks.detect { |f| f.kind == :before && f.options[:only] == [action] }
>>>>>>> 960a08bf (whitespace cleanup)
  end

end
