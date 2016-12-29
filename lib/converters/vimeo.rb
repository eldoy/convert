module Convert
  module Vimeo

    # Convert vimeo movie URL to embedded iframe
    def vimeo(string, options = {})
      # Original: 440 248
      options = {
        :width => 590,
        :height => 335,
        :show_title => false,
        :show_byline => false,
        :show_portrait => false,
        :allow_fullscreen => true
      }.merge(options)

      @regex = /https?:\/\/(www.)?vimeo\.com\/([A-Za-z0-9._%-]*)((\?|#)\S+)?/

      string.gsub(@regex) do
        vimeo_id = $2
        width = options[:width]
        height = options[:height]
        show_title = "title=0"    unless options[:show_title]
        show_byline = "byline=0"   unless options[:show_byline]
        show_portrait = "portrait=0" unless options[:show_portrait]
        allow_fullscreen = " allowfullscreen" if options[:allow_fullscreen]
        frameborder = options[:frameborder] || 0
        query_string_variables = [show_title, show_byline, show_portrait].compact.join("&")
        query_string = "?" + query_string_variables unless query_string_variables.empty?

        %{<iframe src="//player.vimeo.com/video/#{vimeo_id}#{query_string}" width="#{width}" height="#{height}" frameborder="#{frameborder}"#{allow_fullscreen}></iframe>}
      end
    end

  end
end
