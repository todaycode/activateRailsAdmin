# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{activeadmin}
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Greg Bell"]
  s.date = %q{2011-01-31}
  s.description = %q{The administration framework for Ruby on Rails.}
  s.email = %q{gregdbell@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    "CHANGELOG.rdoc",
    "Gemfile",
    "LICENSE",
    "README.rdoc",
    "Rakefile",
    "activeadmin.gemspec",
    "cucumber.yml",
    "features/index_as_table.feature",
    "features/logging_in.feature",
    "features/logging_out.feature",
    "features/specifying_actions.feature",
    "features/step_definitions/additional_web_steps.rb",
    "features/step_definitions/configuration_steps.rb",
    "features/step_definitions/factory_steps.rb",
    "features/step_definitions/user_steps.rb",
    "features/step_definitions/web_steps.rb",
    "features/support/env.rb",
    "features/support/paths.rb",
    "lib/active_admin.rb",
    "lib/active_admin/action_items.rb",
    "lib/active_admin/admin_notes.rb",
    "lib/active_admin/admin_notes/note.rb",
    "lib/active_admin/admin_notes/notes_controller.rb",
    "lib/active_admin/admin_notes/renderers.rb",
    "lib/active_admin/asset_registration.rb",
    "lib/active_admin/callbacks.rb",
    "lib/active_admin/controller_action.rb",
    "lib/active_admin/dashboards.rb",
    "lib/active_admin/dashboards/dashboard_controller.rb",
    "lib/active_admin/dashboards/renderer.rb",
    "lib/active_admin/dashboards/section.rb",
    "lib/active_admin/dashboards/section_renderer.rb",
    "lib/active_admin/devise.rb",
    "lib/active_admin/dsl.rb",
    "lib/active_admin/form_builder.rb",
    "lib/active_admin/helpers/optional_display.rb",
    "lib/active_admin/menu.rb",
    "lib/active_admin/menu_item.rb",
    "lib/active_admin/namespace.rb",
    "lib/active_admin/page_config.rb",
    "lib/active_admin/pages.rb",
    "lib/active_admin/pages/base.rb",
    "lib/active_admin/pages/base/header.rb",
    "lib/active_admin/pages/edit.rb",
    "lib/active_admin/pages/index.rb",
    "lib/active_admin/pages/index/block.rb",
    "lib/active_admin/pages/index/blog.rb",
    "lib/active_admin/pages/index/table.rb",
    "lib/active_admin/pages/index/thumbnails.rb",
    "lib/active_admin/pages/new.rb",
    "lib/active_admin/pages/show.rb",
    "lib/active_admin/renderer.rb",
    "lib/active_admin/resource.rb",
    "lib/active_admin/resource/belongs_to.rb",
    "lib/active_admin/resource_controller.rb",
    "lib/active_admin/resource_controller/action_builder.rb",
    "lib/active_admin/resource_controller/actions.rb",
    "lib/active_admin/resource_controller/callbacks.rb",
    "lib/active_admin/resource_controller/collection.rb",
    "lib/active_admin/resource_controller/filters.rb",
    "lib/active_admin/resource_controller/form.rb",
    "lib/active_admin/resource_controller/menu.rb",
    "lib/active_admin/resource_controller/page_configurations.rb",
    "lib/active_admin/resource_controller/scoping.rb",
    "lib/active_admin/resource_controller/sidebars.rb",
    "lib/active_admin/sidebar.rb",
    "lib/active_admin/sidebar/renderer.rb",
    "lib/active_admin/sidebar/section.rb",
    "lib/active_admin/table_builder.rb",
    "lib/active_admin/tabs_renderer.rb",
    "lib/active_admin/version.rb",
    "lib/active_admin/view_helpers.rb",
    "lib/active_admin/view_helpers/admin_notes_helper.rb",
    "lib/active_admin/view_helpers/breadcrumb_helper.rb",
    "lib/active_admin/view_helpers/filter_form_helper.rb",
    "lib/active_admin/view_helpers/flash_message_helper.rb",
    "lib/active_admin/view_helpers/form_helper.rb",
    "lib/active_admin/view_helpers/pagination_helper.rb",
    "lib/active_admin/view_helpers/renderer_helper.rb",
    "lib/active_admin/view_helpers/sidebar_helper.rb",
    "lib/active_admin/view_helpers/sortable_helper.rb",
    "lib/active_admin/view_helpers/status_tag_helper.rb",
    "lib/active_admin/view_helpers/table_helper.rb",
    "lib/active_admin/view_helpers/title_helper.rb",
    "lib/active_admin/views/active_admin/devise/mailer/reset_password_instructions.html.erb",
    "lib/active_admin/views/active_admin/devise/mailer/unlock_instructions.html.erb",
    "lib/active_admin/views/active_admin/devise/passwords/edit.html.erb",
    "lib/active_admin/views/active_admin/devise/passwords/new.html.erb",
    "lib/active_admin/views/active_admin/devise/sessions/new.html.erb",
    "lib/active_admin/views/active_admin/devise/shared/_links.erb",
    "lib/active_admin/views/active_admin/devise/unlocks/new.html.erb",
    "lib/active_admin/views/active_admin_dashboard/index.html.erb",
    "lib/active_admin/views/active_admin_default/edit.html.erb",
    "lib/active_admin/views/active_admin_default/index.csv.erb",
    "lib/active_admin/views/active_admin_default/index.html.erb",
    "lib/active_admin/views/active_admin_default/new.html.erb",
    "lib/active_admin/views/active_admin_default/show.html.erb",
    "lib/active_admin/views/belongs_to.rb",
    "lib/active_admin/views/layouts/active_admin.html.erb",
    "lib/active_admin/views/layouts/active_admin_logged_out.html.erb",
    "lib/activeadmin.rb",
    "lib/generators/active_admin/devise/devise_generator.rb",
    "lib/generators/active_admin/install/install_generator.rb",
    "lib/generators/active_admin/install/templates/active_admin.css",
    "lib/generators/active_admin/install/templates/active_admin.js",
    "lib/generators/active_admin/install/templates/active_admin.rb",
    "lib/generators/active_admin/install/templates/active_admin_vendor.js",
    "lib/generators/active_admin/install/templates/create_admin_notes.rb",
    "lib/generators/active_admin/install/templates/dashboards.rb",
    "lib/generators/active_admin/install/templates/images/admin_notes_icon.png",
    "lib/generators/active_admin/install/templates/images/loading.gif",
    "lib/generators/active_admin/install/templates/images/nested_menu_arrow.gif",
    "lib/generators/active_admin/install/templates/images/nested_menu_arrow_dark.gif",
    "lib/generators/active_admin/install/templates/images/orderable.gif",
    "lib/generators/active_admin/resource/resource_generator.rb",
    "lib/generators/active_admin/resource/templates/admin.rb",
    "spec/integration/belongs_to_spec.rb",
    "spec/integration/dashboard_spec.rb",
    "spec/integration/index_as_block_spec.rb",
    "spec/integration/index_as_blog_spec.rb",
    "spec/integration/index_as_csv_spec.rb",
    "spec/integration/index_as_table_spec.rb",
    "spec/integration/index_as_thumbnails_spec.rb",
    "spec/integration/layout_spec.rb",
    "spec/integration/new_view_spec.rb",
    "spec/integration/show_view_spec.rb",
    "spec/spec_helper.rb",
    "spec/support/integration_example_group.rb",
    "spec/support/rails_template.rb",
    "spec/support/templates/cucumber.rb",
    "spec/unit/action_builder_spec.rb",
    "spec/unit/action_items_spec.rb",
    "spec/unit/active_admin_spec.rb",
    "spec/unit/admin_note_spec.rb",
    "spec/unit/admin_notes_controller_spec.rb",
    "spec/unit/asset_registration_spec.rb",
    "spec/unit/belongs_to_spec.rb",
    "spec/unit/breadcrumbs_spec.rb",
    "spec/unit/controller_filters_spec.rb",
    "spec/unit/dashboard_controller_spec.rb",
    "spec/unit/dashboard_section_spec.rb",
    "spec/unit/dashboards_spec.rb",
    "spec/unit/filter_form_builder_spec.rb",
    "spec/unit/form_builder_spec.rb",
    "spec/unit/menu_item_spec.rb",
    "spec/unit/menu_spec.rb",
    "spec/unit/namespace_spec.rb",
    "spec/unit/registration_spec.rb",
    "spec/unit/renderer_spec.rb",
    "spec/unit/resource_controller_spec.rb",
    "spec/unit/resource_spec.rb",
    "spec/unit/routing_spec.rb",
    "spec/unit/sidebar_spec.rb",
    "spec/unit/table_builder_spec.rb",
    "spec/unit/tabs_renderer_spec.rb"
  ]
  s.homepage = %q{http://github.com/gregbell/active_admin}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{The administration framework for Ruby on Rails.}
  s.test_files = [
    "spec/integration/belongs_to_spec.rb",
    "spec/integration/dashboard_spec.rb",
    "spec/integration/index_as_block_spec.rb",
    "spec/integration/index_as_blog_spec.rb",
    "spec/integration/index_as_csv_spec.rb",
    "spec/integration/index_as_table_spec.rb",
    "spec/integration/index_as_thumbnails_spec.rb",
    "spec/integration/layout_spec.rb",
    "spec/integration/new_view_spec.rb",
    "spec/integration/show_view_spec.rb",
    "spec/spec_helper.rb",
    "spec/support/integration_example_group.rb",
    "spec/support/rails_template.rb",
    "spec/support/templates/cucumber.rb",
    "spec/unit/action_builder_spec.rb",
    "spec/unit/action_items_spec.rb",
    "spec/unit/active_admin_spec.rb",
    "spec/unit/admin_note_spec.rb",
    "spec/unit/admin_notes_controller_spec.rb",
    "spec/unit/asset_registration_spec.rb",
    "spec/unit/belongs_to_spec.rb",
    "spec/unit/breadcrumbs_spec.rb",
    "spec/unit/controller_filters_spec.rb",
    "spec/unit/dashboard_controller_spec.rb",
    "spec/unit/dashboard_section_spec.rb",
    "spec/unit/dashboards_spec.rb",
    "spec/unit/filter_form_builder_spec.rb",
    "spec/unit/form_builder_spec.rb",
    "spec/unit/menu_item_spec.rb",
    "spec/unit/menu_spec.rb",
    "spec/unit/namespace_spec.rb",
    "spec/unit/registration_spec.rb",
    "spec/unit/renderer_spec.rb",
    "spec/unit/resource_controller_spec.rb",
    "spec/unit/resource_spec.rb",
    "spec/unit/routing_spec.rb",
    "spec/unit/sidebar_spec.rb",
    "spec/unit/table_builder_spec.rb",
    "spec/unit/tabs_renderer_spec.rb"
  ]

<<<<<<< HEAD
<<<<<<< HEAD
  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, ["= 3.0.0"])
      s.add_runtime_dependency(%q<sqlite3-ruby>, [">= 0"])
      s.add_runtime_dependency(%q<devise>, ["= 1.1.3"])
      s.add_runtime_dependency(%q<haml>, ["= 3.0.18"])
      s.add_runtime_dependency(%q<formtastic>, ["= 1.1.0.beta"])
      s.add_runtime_dependency(%q<will_paginate>, ["= 3.0.pre2"])
      s.add_runtime_dependency(%q<meta_search>, ["= 0.9.2"])
      s.add_runtime_dependency(%q<inherited_views>, [">= 0"])
      s.add_runtime_dependency(%q<jeweler>, ["= 1.5.2"])
      s.add_runtime_dependency(%q<rspec>, ["= 2.0.0.beta.22"])
      s.add_runtime_dependency(%q<rspec-rails>, ["= 2.0.0.beta.22"])
      s.add_runtime_dependency(%q<capybara>, ["= 0.3.9"])
      s.add_runtime_dependency(%q<cucumber>, ["= 0.9.2"])
      s.add_runtime_dependency(%q<cucumber-rails>, ["= 0.3.2"])
      s.add_runtime_dependency(%q<shoulda>, ["= 2.11.2"])
      s.add_runtime_dependency(%q<launchy>, [">= 0"])
      s.add_runtime_dependency(%q<rails>, [">= 3.0.0"])
      s.add_runtime_dependency(%q<formtastic>, [">= 1.1.0"])
      s.add_runtime_dependency(%q<will_paginate>, [">= 3.0.pre2"])
      s.add_runtime_dependency(%q<meta_search>, [">= 0.9.2"])
      s.add_runtime_dependency(%q<inherited_views>, [">= 0"])
      s.add_runtime_dependency(%q<devise>, [">= 0"])
    else
      s.add_dependency(%q<rails>, ["= 3.0.0"])
      s.add_dependency(%q<sqlite3-ruby>, [">= 0"])
      s.add_dependency(%q<devise>, ["= 1.1.3"])
      s.add_dependency(%q<haml>, ["= 3.0.18"])
      s.add_dependency(%q<formtastic>, ["= 1.1.0.beta"])
      s.add_dependency(%q<will_paginate>, ["= 3.0.pre2"])
      s.add_dependency(%q<meta_search>, ["= 0.9.2"])
      s.add_dependency(%q<inherited_views>, [">= 0"])
      s.add_dependency(%q<jeweler>, ["= 1.5.2"])
      s.add_dependency(%q<rspec>, ["= 2.0.0.beta.22"])
      s.add_dependency(%q<rspec-rails>, ["= 2.0.0.beta.22"])
      s.add_dependency(%q<capybara>, ["= 0.3.9"])
      s.add_dependency(%q<cucumber>, ["= 0.9.2"])
      s.add_dependency(%q<cucumber-rails>, ["= 0.3.2"])
      s.add_dependency(%q<shoulda>, ["= 2.11.2"])
      s.add_dependency(%q<launchy>, [">= 0"])
      s.add_dependency(%q<rails>, [">= 3.0.0"])
      s.add_dependency(%q<formtastic>, [">= 1.1.0"])
      s.add_dependency(%q<will_paginate>, [">= 3.0.pre2"])
      s.add_dependency(%q<meta_search>, [">= 0.9.2"])
      s.add_dependency(%q<inherited_views>, [">= 0"])
      s.add_dependency(%q<devise>, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>, ["= 3.0.0"])
    s.add_dependency(%q<sqlite3-ruby>, [">= 0"])
    s.add_dependency(%q<devise>, ["= 1.1.3"])
    s.add_dependency(%q<haml>, ["= 3.0.18"])
    s.add_dependency(%q<formtastic>, ["= 1.1.0.beta"])
    s.add_dependency(%q<will_paginate>, ["= 3.0.pre2"])
    s.add_dependency(%q<meta_search>, ["= 0.9.2"])
    s.add_dependency(%q<inherited_views>, [">= 0"])
    s.add_dependency(%q<jeweler>, ["= 1.5.2"])
    s.add_dependency(%q<rspec>, ["= 2.0.0.beta.22"])
    s.add_dependency(%q<rspec-rails>, ["= 2.0.0.beta.22"])
    s.add_dependency(%q<capybara>, ["= 0.3.9"])
    s.add_dependency(%q<cucumber>, ["= 0.9.2"])
    s.add_dependency(%q<cucumber-rails>, ["= 0.3.2"])
    s.add_dependency(%q<shoulda>, ["= 2.11.2"])
    s.add_dependency(%q<launchy>, [">= 0"])
    s.add_dependency(%q<rails>, [">= 3.0.0"])
    s.add_dependency(%q<formtastic>, [">= 1.1.0"])
    s.add_dependency(%q<will_paginate>, [">= 3.0.pre2"])
    s.add_dependency(%q<meta_search>, [">= 0.9.2"])
    s.add_dependency(%q<inherited_views>, [">= 0"])
    s.add_dependency(%q<devise>, [">= 0"])
  end
=======
  s.add_dependency("rails", ">= 3.0.0")
  s.add_dependency("jquery-rails", ">= 1.0.0", "< 3.0.0")
  s.add_dependency("bourbon", ">= 1.0.0")
  s.add_dependency("meta_search", ">= 0.9.2")
  s.add_dependency("devise", ">= 1.1.2")
  s.add_dependency("formtastic", ">= 2.0.0")
  s.add_dependency("inherited_resources", ">= 1.3.1")
  s.add_dependency("kaminari", ">= 0.13.0")
  s.add_dependency("sass", ">= 3.1.0")
  s.add_dependency("fastercsv", ">= 0")
  s.add_dependency("arbre", ">= 1.0.1")
>>>>>>> 1d29474c (Fix jquery-rails dependency version)
=======
  s.add_dependency 'arbre',               '~> 1.0', '>= 1.0.2'
  s.add_dependency 'bourbon'
  s.add_dependency 'coffee-rails'
  s.add_dependency 'formtastic',          '~> 3.0', '< 3.1' # unitl #3544 is implemented
  s.add_dependency 'formtastic_i18n'
  s.add_dependency 'inherited_resources', '~> 1.6'
  s.add_dependency 'jquery-rails'
  s.add_dependency 'jquery-ui-rails'
  s.add_dependency 'kaminari',            '>= 0.15', '< 2.0'
  s.add_dependency 'railties',            '>= 3.2', '< 5.1'
  s.add_dependency 'ransack',             '~> 1.3'
  s.add_dependency 'sass-rails'
>>>>>>> 36edd084 (use Arbre 1.0.2)
end

