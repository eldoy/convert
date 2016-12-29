module Convert
  module Ted

    # Convert ted movie URL to embedded iframe
    def ted(string, options = {})
      # Original: 640 360
      options = {
        :width => 590,
        :height => 335,
        :scrolling => 'no',
        :frameborder => 0,
        :allow_full_screen => false
      }.merge(options)

      @regex = /https?:\/\/(www.|embed.)?ted\.com\/talks\/([A-Za-z0-9._%-]*)\.html((\?|#)\S+)?/

      string.gsub(@regex) do
        ted_page = $2
        width = options[:width]
        height = options[:height]
        frameborder = options[:frameborder]
        scrolling = options[:scrolling]
        allow_full_screen = options[:allow_full_screen]

        %{<iframe width="#{width}" height="#{height}" frameborder="#{frameborder}" scrolling="#{scrolling}" src="http://embed.ted.com/talks/#{ted_page}.html"#{allow_full_screen ? ' webkitAllowFullScreen mozallowfullscreen allowFullScreen' : ''}></iframe>}
      end
    end

  end
end
