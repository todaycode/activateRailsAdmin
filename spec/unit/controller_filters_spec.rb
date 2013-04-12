<<<<<<< HEAD
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper') 
=======
require 'spec_helper'
>>>>>>> 960a08bf (whitespace cleanup)

describe ActiveAdmin, "filters" do

  describe "before filters" do
<<<<<<< HEAD
    it "should add a new before filter to ActiveAdmin::ResourceController" do
      ActiveAdmin::ResourceController.should_receive(:before_filter).and_return(true)
      ActiveAdmin.before_filter :my_filter, :only => :show
=======
    it "should add a new before filter to ActiveAdmin::BaseController" do
      ActiveAdmin::BaseController.should_receive(:before_filter).and_return(true)
      application.before_filter :my_filter, :only => :show
    end
  end

  describe "skip before filters" do
    it "should add a new skip before filter to ActiveAdmin::BaseController" do
      ActiveAdmin::BaseController.should_receive(:skip_before_filter).and_return(true)
      application.skip_before_filter :my_filter, :only => :show
>>>>>>> 960a08bf (whitespace cleanup)
    end
  end

  describe "after filters" do
    it "should add a new after filter to ActiveAdmin::ResourceController" do
      ActiveAdmin::ResourceController.should_receive(:after_filter).and_return(true)
      ActiveAdmin.after_filter :my_filter, :only => :show
    end
  end

  describe "around filters" do
    it "should add a new around filter to ActiveAdmin::ResourceController" do
      ActiveAdmin::ResourceController.should_receive(:around_filter).and_return(true)
      ActiveAdmin.around_filter :my_filter, :only => :show
    end
  end

end
