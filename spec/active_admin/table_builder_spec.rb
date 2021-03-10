require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

include ActiveAdmin

describe ActiveAdmin::TableBuilder do
  
  describe "when creating a simple column" do
    before(:each) do
      @builder = TableBuilder.new do |t|
        t.column :first_name
      end
    end
    
    it "should set the column title" do
      @builder.columns.first.title.should == 'First Name'
    end
    
    it "should set the column data" do
      @builder.columns.first.data.should == :first_name
    end
  end
  
  it "should generate multiple columns" do
    builder = TableBuilder.new do |t|
      t.column :username
      t.column :last_name
    end
    builder.columns.size.should == 2
  end
  
  describe 'when creating a column with a title' do
    before(:each) do
      @builder = TableBuilder.new do |t|
        t.column 'My Great Username', :username
      end
    end
    
    it "should set the column title" do
      @builder.columns.first.title.should == 'My Great Username'
    end
    
    it "should set the column data" do
      @builder.columns.first.data.should == :username
    end
  end
  
  describe 'when creating a column with a title and a block as the data' do
    before(:each) do
      @builder = TableBuilder.new do |t|
        t.column('Username'){ |u| u.username }
      end
    end
    
    it "should set the column title" do
      @builder.columns.first.title.should == 'Username'
    end
    
    it "should set the column data" do
      @builder.columns.first.data.should be_a(Proc)
    end
  end

  describe "column sorting" do
    before(:each) do
      @builder = TableBuilder.new
    end

    it "should default to true" do
      @builder.column :username
      @builder.columns.first.should be_sortable
    end

    it "should be set with a symbol" do
      @builder.column :username, :sortable => false
      @builder.columns.first.should_not be_sortable
    end

    it "should be set with a string and a symbol" do
      @builder.column "Username", :username, :sortable => false
      @builder.columns.first.should_not be_sortable
    end

    it "should set the default sort key to the column symbol data" do
      @builder.column :username
      @builder.columns.first.sort_key.should == "username"
    end

    it "should not be sortable if a block given and no sort key" do
      @builder.column('Username'){ @user.username }
      @builder.columns.first.should_not be_sortable
    end

    it "should be sortable if a block given and a string to sortable" do
      @builder.column('Username', :sortable => 'username'){ @user.pretty_username }
      @builder.columns.first.should be_sortable
      @builder.columns.first.sort_key.should == 'username'
    end
    
    it "should be sortable if a block given and a symbol to sortable" do
      @builder.column('Username', :sortable => :username){ @user.pretty_username }
      @builder.columns.first.should be_sortable
      @builder.columns.first.sort_key.should == 'username'
    end
  end

  describe "column conditionals" do
    before(:each) do
      @builder = TableBuilder.new
    end
    it "should default to true" do
      @builder.column :username
      @builder.columns.first.conditional_block.call.should be_true
    end
    it "should accept a lamdba" do
      @builder.column :username, :if => proc{ false }
      @builder.columns.first.conditional_block.call.should be_false
    end
  end


  it "should generate many columns" do
    builder = TableBuilder.new do |t|
      t.columns :first, :second, :third
    end
    builder.columns.size.should == 3
    builder.columns.first.data.should == :first
  end

  include ActiveAdminIntegrationSpecHelper

  describe "rendering" do
    context "when a table of objects" do
      let(:collection) { [ "Hello World", "Ruby Rocks", "Foo Bar" ] }
      let(:table_builder) do
        TableBuilder.new do |t|
          t.column :to_s
          t.column :size
          t.column("Underscored") { @string.underscore }
        end
      end
      let(:table) { TableBuilder::Renderer.new(action_view).to_html(table_builder,collection) }
      it "should have 3 rows and 1 header row" do
        table.scan('<tr').size.should == 3
      end
    end
  end
    
end
