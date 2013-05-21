require File.expand_path(File.dirname(__FILE__) + '/../spec_helper') 

describe_with_render ActiveAdmin::FormBuilder do

  def build_form(&block)
    Admin::PostsController.form(&block)
    get :new
  end

<<<<<<< HEAD
  context "in general" do
    before do
=======
  context "in general with actions" do
    let :body do
>>>>>>> 97293a7b (remove redundant set of tests)
      build_form do |f|
        f.inputs do
          f.input :title
          f.input :body
        end
<<<<<<< HEAD
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
=======
        f.actions do
          f.action :submit, :label => "Submit Me"
          f.action :submit, :label => "Another Button"
        end
      end
    end

   it "should generate a text input" do
      body.should have_tag("input", :attributes => { :type => "text",
                                                     :name => "post[title]" })
    end
    it "should generate a textarea" do
      body.should have_tag("textarea", :attributes => { :name => "post[body]" })
    end
    it "should only generate the form once" do
      body.scan(/Title/).size.should == 1
    end
    it "should generate actions" do
      body.should have_tag("input", :attributes => {  :type => "submit",
                                                          :value => "Submit Me" })
      body.should have_tag("input", :attributes => {  :type => "submit",
>>>>>>> 97293a7b (remove redundant set of tests)
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

<<<<<<< HEAD
  context "with buttons" do
=======
  context "with actions" do
>>>>>>> 7810ac38 ([Added] option to hide new record link for has_many form and changed documentation.)
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
=======
  context "with has many inputs" do
    describe "with simple block" do
      let :body do
        build_form({:url => '/categories'}, Category.new) do |f|
          f.object.posts.build
          f.has_many :posts do |p|
            p.input :title
          end
        end
      end

      it "should translate the association name in header" do
        begin
          I18n.backend.store_translations(:en, :activerecord => { :models => { :post => { :one => "Blog Post", :other => "Blog Posts" } } })
          body.should have_tag('h3', 'Blog Posts')
        ensure
          I18n.backend.reload!
        end
      end

      it "should use model name when there is no translation for given model in header" do
        body.should have_tag('h3', 'Post')
      end

      it "should translate the association name in has many new button" do
        begin
          I18n.backend.store_translations(:en, :activerecord => { :models => { :post => { :one => "Blog Post", :other => "Blog Posts" } } })
          body.should have_tag('a', 'Add New Blog Post')
        ensure
          I18n.backend.reload!
        end
      end

      it "should translate the attribute name" do
        begin
          I18n.backend.store_translations :en, :activerecord => { :attributes => { :post => { :title => 'A very nice title' } } }
          body.should have_tag 'label', 'A very nice title'
        ensure
          I18n.backend.reload!
        end
      end

      it "should use model name when there is no translation for given model in has many new button" do
        body.should have_tag('a', 'Add New Post')
      end

      it "should render the nested form" do
        body.should have_tag("input", :attributes => {:name => "category[posts_attributes][0][title]"})
      end

      it "should add a link to remove new nested records" do
        Capybara.string(body).should have_css(".has_many > fieldset > ol > li.has_many_delete > a", :class => "button", :href => "#", :content => "Delete")
      end

      it "should include the nested record's class name in the js" do
        body.should have_tag("a", :attributes => { :onclick => /NEW_POST_RECORD/ })
      end
>>>>>>> b7cb8877 (add test to ensure that form attribute labels are translated)

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

      it "should add a custom header" do
        body.should have_tag('h3', 'Post')
      end 

    end

    describe "without heading and new record link" do
      let :body do
        build_form({:url => '/categories'}, Category.new) do |f|
          f.object.posts.build
          f.has_many :posts, :heading => false, :new_record => false do |p|
            p.input :title
          end
        end
      end

      it "should not add a header" do
        body.should_not have_tag('h3', 'Post')
      end 

      it "should not add link to new nested records" do
        body.should_not have_tag('a', 'Add New Post')
      end 

    end  

    describe "with custom heading" do
      let :body do
        build_form({:url => '/categories'}, Category.new) do |f|
          f.object.posts.build
          f.has_many :posts, :heading => "Test heading" do |p|
            p.input :title
          end
        end
      end

      it "should add a custom header" do
        body.should have_tag('h3', 'Test heading')
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
