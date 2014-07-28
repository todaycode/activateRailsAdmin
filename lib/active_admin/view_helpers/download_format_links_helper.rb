module ActiveAdmin
  module ViewHelpers
    module DownloadFormatLinksHelper

      module ClassMethods

        # A ready only of formats to make available in index/paginated
        # collection view.
        # @return [Array]
        # @see add_format for information on adding custom download link
        # formats
        def formats
          @formats ||= [:csv, :xml, :json]
          @formats.clone
        end

        # Adds a mime type to the list of available formats available for data
        # export. You must register the extension prior to adding it here.
        # @param [Symbol] format the mime type to add
        # @return [Array] A copy of the updated formats array.
        def add_format(format)
          unless Mime::Type.lookup_by_extension format
            raise ArgumentError, "Please register the #{format} mime type with `Mime::Type.register`"
          end
          @formats << format unless formats.include? format
          formats
        end
      end

      # TODO: Refactor to new HTML DSL
      def build_download_format_links(formats = self.class.formats)
        links = formats.collect do |format|
          link_to format.to_s.upcase, { :format => format}.merge(request.query_parameters.except(:commit, :format))
        end
        div :class => "download_links" do
          text_node [I18n.t('active_admin.download'), links].flatten.join("&nbsp;").html_safe
        end
      end

      def self.included base
        base.extend ClassMethods
      end
    end
  end
end

