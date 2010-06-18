module ActiveAdmin
  class IndexBuilder

    def renderer
      self.class.const_get("Renderer")
    end
    
    def render(view, collection)
      renderer.new(view).to_html(self, collection)
    end
    
  end
end
