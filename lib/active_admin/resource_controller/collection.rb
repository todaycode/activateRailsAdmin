module ActiveAdmin
  class ResourceController < ::InheritedViews::Base

    # This module deals with the retrieval of collections for resources
    # within the resource controller.
    module Collection
      extend ActiveSupport::Concern

      included do
        before_filter :setup_pagination_for_csv
      end

      module BaseCollection
        protected

        def collection
          get_collection_ivar || set_collection_ivar(active_admin_collection)
        end

        def active_admin_collection
          scoped_collection
        end


        # Override this method in your controllers to modify the start point
        # of our searches and index.
        #
        # This method should return an ActiveRecord::Relation object so that
        # the searching and filtering can be applied on top
        #
        # Note, unless you are doing something special, you should use the 
        # scope_to method from the Scoping module instead of overriding this
        # method.
        def scoped_collection
          end_of_association_chain
        end
      end


      module Sorting
        protected

        def active_admin_collection
          sort_order(super)
        end

        def sort_order(chain)
          params[:order] ||= active_admin_config.sort_order
          if params[:order] && params[:order] =~ /^([\w\_\.]+)_(desc|asc)$/
            chain.order("#{$1} #{$2}")
          else
            chain # just return the chain
          end
        end
      end


      module Search
        protected

        def active_admin_collection
          search(super)
        end

        def search(chain)
          @search = chain.search(clean_search_params(params[:q]))
        end

        def clean_search_params(search_params)
          return {} unless search_params.is_a?(Hash)
          search_params = search_params.dup
          search_params.delete_if do |key, value|
            value == ""
          end
          search_params
        end
      end


      module Pagination
        protected

        def active_admin_collection
          paginate(super)
        end

        # Allow more records for csv files
        def setup_pagination_for_csv
          @per_page = 10_000 if request.format == 'text/csv'
        end

        def paginate(chain)
          chain.paginate(:page => params[:page], :per_page => @per_page || ActiveAdmin.default_per_page)
        end
      end

      # Include all the Modules. BaseCollection must be first
      # and pagination should be last
      include BaseCollection
      include Sorting
      include Search
      include Pagination

    end
  end
end
