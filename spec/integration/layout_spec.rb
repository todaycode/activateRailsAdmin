require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

include ActiveAdminIntegrationSpecHelper

describe Admin::PostsController, :type => :controller do

  include RSpec::Rails::ControllerExampleGroup
  render_views

  it "should include the active admin stylesheet" do
    get :index
    response.should have_tag("link", :attributes => { :href => '/stylesheets/active_admin.css' })
  end

  it "should include active admin js" do
    get :index
    response.should have_tag("script", :attributes => { :src => '/javascripts/active_admin.js' })
  end

end
