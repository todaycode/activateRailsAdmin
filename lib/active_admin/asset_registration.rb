module ActiveAdmin
  module AssetRegistration

    # Stylesheets

    def register_stylesheet(name)
      stylesheets << name
    end

    def stylesheets
      @stylesheets ||= []
    end

    def clear_stylesheets!
      @stylesheets = []
    end


    # Javascripts

    def register_javascript(name)
      javascripts << name
    end

    def javascripts
      @javascripts ||= []
    end

    def clear_javascripts!
      @javascripts = []
    end
<<<<<<< HEAD
    
  end
=======

  end

  # Wrapper class for stylesheet registration
  class Stylesheet

    attr_reader :options, :path

    def initialize(*args)
      @options = args.extract_options!
      @path = args.first if args.first
    end

  end

>>>>>>> 960a08bf (whitespace cleanup)
end
