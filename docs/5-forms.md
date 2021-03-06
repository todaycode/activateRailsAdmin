# Customizing the Form

Active Admin gives complete control over the output of the form by creating a thin DSL on top of
the fabulous DSL created by [Formtastic](http://github.com/justinfrench/formtastic).

    ActiveAdmin.register Post do

      form do |f|
        f.inputs "Details" do
          f.input :title
          f.input :published_at, :label => "Publish Post At"
          f.input :category
        end
        f.inputs "Content" do
          f.input :body
        end
        f.actions
      end

    end

Please view [the documentation](http://github.com/justinfrench/formtastic)
for Formtastic to see all the wonderful things you can do.

If you require a more custom form than can be provided through the DSL, you can pass
a partial in to render the form yourself.

For example:

    ActiveAdmin.register Post do
      form :partial => "form"
    end

Then implement app/views/admin/posts/_form.html.erb:

    <%= semantic_form_for [:admin, @post] do |f| %>
      <%= f.inputs :title, :body %>
      <%= f.actions :commit %>
    <% end %>

You can also use the `ActiveAdmin::FormBuilder` as builder in your Formtastic Form for use the same helpers are used in the admin file:

```ruby
  = semantic_form_for [:admin, @post], builder: ActiveAdmin::FormBuilder do |f|
    = f.inputs "Details" do
      = f.input :title
    - f.has_many :taggings, sortable: :position, sortable_start: 1 do |t|
      - t.input :tag
    = f.actions

```

## Nested Resources

You can create forms with nested models using the `has_many` method, even if your model uses `has_one`:

    ActiveAdmin.register Post do

      form do |f|
        f.inputs "Details" do
          f.input :title
          f.input :published_at, :label => "Publish Post At"
        end
        f.inputs "Content" do
          f.input :body
        end
        f.inputs do
          f.has_many :categories, :allow_destroy => true, :heading => 'Themes', :new_record => false do |cf|
            cf.input :title
          end
        end
        f.actions
      end

    end

The `:allow_destroy` option will add a checkbox to the end of the nested form allowing
removal of the child object upon submission. Be sure to set `:allow_destroy => true`
on the association to use this option.

The `:heading` option will add a custom heading to has_many form. You can hide a heading by setting `:heading => false`.

The `:new_record` option will show or hide new record link at the bottom of has_many form. It is set as true by default.

## Datepicker

ActiveAdmin offers the `datepicker` input, which uses the [jQueryUI datepicker](http://jqueryui.com/datepicker/).
The datepicker input accepts any of the options available to the standard jQueryUI Datepicker. For example:

```ruby
form do |f|
  f.input :starts_at, as: :datepicker, datepicker_options: { min_date: "2013-10-8",        max_date: "+3D" }
  f.input :ends_at,   as: :datepicker, datepicker_options: { min_date: 3.days.ago.to_date, max_date: "+1W +5D" }
end
```

## Displaying Errors

To display a list of all errors, include `semantic_errors` at top of form. Particularly useful to display errors on the base or virtual attributes.

    form do |f|
      f.semantic_errors *f.object.errors.keys
      f.inputs
      f.actions
    end

