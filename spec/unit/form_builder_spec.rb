require File.expand_path(File.dirname(__FILE__) + '/../spec_helper') 

describe_with_render ActiveAdmin::FormBuilder do

  def build_form(&block)
    Admin::PostsController.form(&block)
    get :new
  end

  context "in general" do
    before do
      build_form do |f|
        f.inputs do
          f.input :title
          f.input :body
        end
        f.buttons do
          f.commit_button "Submit Me"
          f.commit_button "Another Button"
        end
      end
    end
    it "should generate a text input" do
      response.should have_tag("input", :attributes => { :type => "text",
                                                     :name => "post[title]" })
    end
    it "should generate a textarea" do
      response.should have_tag("textarea", :attributes => { :name => "post[body]" })
    end
    it "should only generate the form once" do
      response.body.scan(/Title/).size.should == 1
    end
    it "should generate buttons" do
      response.should have_tag("input", :attributes => {  :type => "submit",
                                                          :value => "Submit Me" })
      response.should have_tag("input", :attributes => {  :type => "submit",
                                                          :value => "Another Button" })
    end
  end

  context "when polymorphic relationship" do
    
    let(:body) do
      comment = ActiveAdmin::Comment.new
      
      active_admin_form_for comment, :url => "admins/comments" do |f|
        f.inputs :resource
      end
      
    end
    
    it "should not generate any field" do
      body.should have_tag("form", :attributes => { :method => 'post' })
      body.should_not have_tag("select")
    end
  end

  describe "passing in options" do
    before do
      Admin::PostsController.form :html => { :multipart => true } do |f|
        f.inputs :title
        f.buttons
      end
      get :new
    end
    it "should pass the options on to the form" do
      response.should have_tag("form", :attributes => { :enctype => "multipart/form-data" })
    end
  end

  context "with default settings" do
    before do
      Admin::PostsController.reset_form_config!
      get :new
    end
    it "should generate one post title field" do
      response.body.scan('id="post_title"').size.should == 1
    end
  end

  context "with buttons" do
    it "should generate the form once" do
      build_form do |f|
        f.inputs do
          f.input :title
        end
        f.buttons
      end
      response.body.scan(/id=\"post_title\"/).size.should == 1
    end
    it "should generate one button and a cancel link" do
      build_form do |f|
        f.buttons
      end
      response.body.scan(/type=\"submit\"/).size.should == 1
      response.body.scan(/class=\"cancel\"/).size.should == 1
    end
    it "should generate multiple buttons" do
      build_form do |f|
        f.buttons do
          f.commit_button "Create & Continue"
          f.commit_button "Create & Edit"
        end
      end
      response.body.scan(/type=\"submit\"/).size.should == 2
      response.body.scan(/class=\"cancel\"/).size.should == 0
    end

  end

  context "without passing a block to inputs" do
    before do
      build_form do |f|
        f.inputs :title, :body
      end
    end
    it "should have a title input" do
      response.should have_tag("input", :attributes => { :type => "text",
                                                          :name => "post[title]" })
    end
    it "should have a body textarea" do
      response.should have_tag("textarea", :attributes => { :name => "post[body]" })
    end
  end

  context "with semantic fields for" do
    before do
      build_form do |f|
        f.inputs do
          f.input :title
          f.input :body
        end
        f.instance_eval do
          @object.author = User.new
        end
        f.semantic_fields_for :author do |author|
          author.inputs :first_name, :last_name
        end
      end
    end
    it "should generate a nested text input once" do
      response.body.scan("post_author_attributes_first_name_input").size.should == 1
    end
  end

  context "with collection inputs" do
    before do
      User.create :first_name => "John", :last_name => "Doe"
      User.create :first_name => "Jane", :last_name => "Doe"
    end

    describe "as select" do
      before do
        build_form do |f|
          f.input :author
        end
      end
      it "should create 2 options" do
        response.body.scan(/\<option/).size.should == 3
      end
    end

    describe "as radio buttons" do
      before do
        build_form do |f|
          f.input :author, :as => :radio
        end
      end
      it "should create 2 radio buttons" do
        response.body.scan(/type=\"radio\"/).size.should == 2
      end
    end
  end

  context "with inputs 'for'" do
    before do
      build_form do |f|
        f.inputs do
          f.input :title
          f.input :body
        end
        f.instance_eval do
          @object.author = User.new
        end
        f.inputs :name => 'Author', :for => :author do |author|
          author.inputs :first_name, :last_name
        end
      end
    end
    it "should generate a nested text input once" do
      response.body.scan("post_author_attributes_first_name_input").size.should == 1
    end
    it "should add an author first name field" do
      response.body.should have_tag("input", :attributes => { :name => "post[author_attributes][first_name]"})
    end
  end

  context "with wrapper html" do
    it "should set a class" do
      build_form do |f|
        f.input :title, :wrapper_html => { :class => "important" }
      end
      response.should have_tag("li", :attributes => {:class => "string optional important"})
    end
  end


<<<<<<< HEAD
  { 
    "input :title, :as => :string"        => /id\=\"post_title\"/,
    "input :title, :as => :text"          => /id\=\"post_title\"/,
    "input :created_at, :as => :time"     => /id\=\"post_created_at_2i\"/,
    "input :created_at, :as => :datetime" => /id\=\"post_created_at_2i\"/,
    "input :created_at, :as => :date"     => /id\=\"post_created_at_2i\"/,
=======
      it "should add a link to add new nested records" do
        Capybara.string(body).should have_css(".has_many > fieldset > ol > li > a", :class => "button", :href => "#", :content => "Add New Post")
      end
    end

    describe "with complex block" do
      let :body do
        build_form({:url => '/categories'}, Category.new) do |f|
          f.object.posts.build
          f.has_many :posts do |p,i|
            p.input :title, :label => "Title #{i}"
          end
        end
      end

      it "should accept a block with a second argument" do
        body.should have_tag("label", "Title 1")
      end
    end

    describe "with allow destroy" do
      context "with an existing post" do
        let :body do
          build_form({:url => '/categories'}, Category.new) do |f|
            f.object.posts.build.stub!(:new_record? => false)
            f.has_many :posts, :allow_destroy => true do |p|
              p.input :title
            end
          end
        end

        it "should include a boolean field for _destroy" do
          body.should have_tag("input", :attributes => {:name => "category[posts_attributes][0][_destroy]"})
        end

        it "should have a check box with 'Remove' as its label" do
          body.should have_tag("label", :attributes => {:for => "category_posts_attributes_0__destroy"}, :content => "Remove")
        end

        it "should wrap the destroy field in an li with class 'has_many_remove'" do
          Capybara.string(body).should have_css(".has_many > fieldset > ol > li.has_many_remove > input")
        end
      end

      context "with a new post" do
        let :body do
          build_form({:url => '/categories'}, Category.new) do |f|
            f.object.posts.build
            f.has_many :posts, :allow_destroy => true do |p|
              p.input :title
            end
          end
        end

        it "should not have a boolean field for _destroy" do
          body.should_not have_tag("input", :attributes => {:name => "category[posts_attributes][0][_destroy]"})
        end

        it "should not have a check box with 'Remove' as its label" do
          body.should_not have_tag("label", :attributes => {:for => "category_posts_attributes_0__destroy"}, :content => "Remove")
        end
      end
    end

    pending "should render the block if it returns nil" do
      body = build_form({:url => '/categories'}, Category.new) do |f|
        f.object.posts.build
        f.has_many :posts do |p|
          p.input :title
          nil
        end
      end

      body.should have_tag("input", :attributes => {:name => "category[posts_attributes][0][title]"})
    end
  end

  {
    "input :title, :as => :string"               => /id\=\"post_title\"/,
    "input :title, :as => :text"                 => /id\=\"post_title\"/,
    "input :created_at, :as => :time_select"     => /id\=\"post_created_at_2i\"/,
    "input :created_at, :as => :datetime_select" => /id\=\"post_created_at_2i\"/,
    "input :created_at, :as => :date_select"     => /id\=\"post_created_at_2i\"/,
>>>>>>> 30186732 (Add :allow_destroy option to has_many forms)
  }.each do |source, regex|
   it "should properly buffer #{source}" do
     build_form do |f|
       f.inputs do
         f.instance_eval(source)
         f.instance_eval(source)
       end
     end
     response.body.scan(regex).size.should == 2
   end
  end

  describe "datepicker input" do
    before do
      build_form do |f|
        f.inputs do
          f.input :created_at, :as => :datepicker
        end
      end
    end
    it "should generate a text input with the class of datepicker" do
      response.should have_tag("input", :attributes => {  :type => "text",
                                                          :class => "datepicker",
                                                          :name => "post[created_at]" })
    end
  end

end
