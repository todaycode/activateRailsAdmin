<<<<<<< HEAD
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper') 
=======
require 'spec_helper'
>>>>>>> 960a08bf (whitespace cleanup)

<<<<<<< HEAD
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
=======
describe ActiveAdmin::Application do
  let(:application){ ActiveAdmin::Application.new }
  let(:controllers){ [ActiveAdmin::BaseController,            ActiveAdmin::Devise::SessionsController,
                      ActiveAdmin::Devise::UnlocksController, ActiveAdmin::Devise::PasswordsController] }

  it 'before_filter' do
    controllers.each{ |c| c.should_receive(:before_filter).and_return(true) }
    application.before_filter :my_filter, :only => :show
  end

  it 'skip_before_filter' do
    controllers.each{ |c| c.should_receive(:skip_before_filter).and_return(true) }
    application.skip_before_filter :my_filter, :only => :show
  end

  it 'after_filter' do
    controllers.each{ |c| c.should_receive(:after_filter).and_return(true) }
    application.after_filter :my_filter, :only => :show
  end

  it 'skip after_filter' do
    controllers.each{ |c| expect(c).to receive(:skip_after_filter).and_return(true) }
    application.skip_after_filter :my_filter, :only => :show
  end

  it 'around_filter' do
    controllers.each{ |c| c.should_receive(:around_filter).and_return(true) }
    application.around_filter :my_filter, :only => :show
>>>>>>> 9a9693b5 (hook filters into Devise controllers just like resource controllers)
  end
  
  it 'skip_filter' do
    controllers.each{ |c| c.should_receive(:skip_filter).and_return(true) }
    application.skip_filter :my_filter, :only => :show
  end
end
