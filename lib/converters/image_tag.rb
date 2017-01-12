module Convert
  module Converters

    # Convert image to img html tag
    def image_tag(src, options = {})
      options = {:alt => ''}.merge(options)
      %{<img src="#{src}" alt="#{options[:alt]}">}
    end

  end
end
