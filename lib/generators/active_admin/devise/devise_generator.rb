require "active_admin/error"
require "active_admin/dependency"

module ActiveAdmin
  module Generators
    class DeviseGenerator < Rails::Generators::NamedBase
      desc "Creates an admin user and uses Devise for authentication"

      argument :name, :type => :string, :default => "AdminUser"

      class_option  :registerable, :type => :boolean, :default => false,
                    :desc => "Should the generated resource be registerable?"

      RESERVED_NAMES = [:active_admin_user]

      class_option  :default_user, :type => :boolean, :default => true,
                    :desc => "Should a default user be created inside the migration?"

      def install_devise
<<<<<<< HEAD
=======
        begin
          Dependency.devise! Dependency::DEVISE
        rescue DependencyError => e
          raise ActiveAdmin::GeneratorError, "#{e.message} If you don't want to use devise, run the generator with --skip-users."
        end

>>>>>>> 80ad7b34 (refactor DependencyError)
        require 'devise'
        if File.exists?(File.join(destination_root, "config", "initializers", "devise.rb"))
          log :generate, "No need to install devise, already done."
        else
          log :generate, "devise:install"
          invoke "devise:install"
        end
      end

      def create_admin_user
        if RESERVED_NAMES.include?(name.underscore)
          raise ActiveAdmin::GeneratorError, "The name #{name} is reserved by Active Admin"
        end
        invoke "devise", [name]
      end

      def remove_registerable_from_model
        unless options[:registerable]
          model_file = File.join(destination_root, "app", "models", "#{file_path}.rb")
          gsub_file model_file, /\:registerable([.]*,)?/, ""
        end
      end

      # This fixes a bug in the 3.0.0 release of Devise. For more info:
      # https://github.com/plataformatec/devise/issues/2515
      def add_attr_accessible_if_missing
        require 'devise/version'
        if ::Devise::VERSION == '3.0.0'
          if Rails::VERSION::MAJOR == 3 && !defined?(ActionController::StrongParameters)
            model = File.join(destination_root, "app", "models", "#{file_path}.rb")
            inject_into_file model, "\n  attr_accessible :email, :password, :password_confirmation, :remember_me\n",
                             :before => /end\s*\z/
          end
        end
      end

      def set_namespace_for_path
        routes_file = File.join(destination_root, "config", "routes.rb")
        gsub_file routes_file, /devise_for :#{table_name}/, "devise_for :#{table_name}, :path => '#{ActiveAdmin.default_namespace}'"
      end

<<<<<<< HEAD
=======
      def add_default_user_to_migration
        # Don't assume that we have a migration!
        devise_migration_file = Dir["db/migrate/*_devise_create_#{table_name}.rb"].first
        return if devise_migration_file.nil? || !options[:default_user]

        devise_migration_content = File.read(devise_migration_file)

        if devise_migration_content["def change"]
          inject_into_file  devise_migration_file,
                            "def migrate(direction)\n    super\n    # Create a default user\n    #{class_name}.create!(:email => 'admin@example.com', :password => 'password', :password_confirmation => 'password') if direction == :up\n  end\n\n  ",
                            :before => "def change"
        elsif devise_migration_content[/def (self.)?up/]
          inject_into_file  devise_migration_file,
                            "# Create a default user\n    #{class_name}.create!(:email => 'admin@example.com', :password => 'password', :password_confirmation => 'password')\n\n    ",
                            :before => "add_index :#{table_name}, :email"
        else
          puts devise_migration_content
          raise "Failed to add default admin user to migration."
        end
      end
>>>>>>> 960a08bf (whitespace cleanup)
    end
  end
end
