module Convert
  module Converters

    # Iframe embed code
    def iframe_embed(url, options = {})
      options = {:width => 231, :height => 436, :scrolling => 'no', :frameborder => 0}.merge(options)

      %{<iframe frameborder="#{options[:frameborder]}" scrolling="#{options[:scrolling]}" height="#{options[:height]}" width="#{options[:width]}" src="#{url}"></iframe>}
    end

  end
end
