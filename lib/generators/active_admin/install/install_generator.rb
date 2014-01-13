module ActiveAdmin
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc "Installs ActiveAdmin in a rails 3 application"

      def self.source_root
        @_active_admin_source_root ||= File.expand_path("../templates", __FILE__)
      end  

      def copy_initializer
        template 'active_admin.rb', 'config/initializers/active_admin.rb'
      end

      def setup_directory
        empty_directory "app/admin"
        template 'dashboards.rb', 'app/admin/dashboards.rb'
      end

      def setup_routes
        if ARGV.include? "--skip-users"
          route "ActiveAdmin.routes(self)"
        else # Ensure Active Admin routes occur after Devise routes so that Devise has higher priority
          inject_into_file "config/routes.rb", "\n  ActiveAdmin.routes(self)", :after => /devise_for .*, ActiveAdmin::Devise\.config/
        end
      end

      def copy_assets
        template 'active_admin.css',        'public/stylesheets/active_admin.css'
        template 'active_admin_vendor.js',  'public/javascripts/active_admin_vendor.js'
        template 'active_admin.js',         'public/javascripts/active_admin.js'
        directory 'images', 'public/images/active_admin'
      end
    end
  end
end
