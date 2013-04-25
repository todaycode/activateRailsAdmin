module ActiveAdmin
  module AssetRegistration

<<<<<<< HEAD
    # Stylesheets

    def register_stylesheet(name)
      stylesheets << name
=======
    def register_stylesheet(path, options = {})
      stylesheets[path] = options
>>>>>>> 34384c1e (prevent assets from being registered multiple times)
    end

    def stylesheets
      @stylesheets ||= {}
    end

    def clear_stylesheets!
      @stylesheets = {}
    end

    def register_javascript(name)
      javascripts.add name
    end

    def javascripts
      @javascripts ||= Set.new
    end

    def clear_javascripts!
<<<<<<< HEAD
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
=======
      @javascripts = Set.new
    end

  end
>>>>>>> 34384c1e (prevent assets from being registered multiple times)
end
