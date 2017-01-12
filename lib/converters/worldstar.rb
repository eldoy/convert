module Convert
  module Converters

    # Convert worldstar movie URL to embedded html
    def worldstar(string, options = {})
      # Original: 448 374
      options = {:width => 590, :height => 335}.merge(options)

      @regex = /http:\/\/www\.worldstarhiphop\.com\/videos\/video\.php\?v\=(wshh[A-Za-z0-9]+)/

      string.gsub(@regex) do
        video_id = $1
        width  = options[:width]
        height = options[:height]
        %{<object width="#{width}" height="#{height}"><param name="movie" value="http://www.worldstarhiphop.com/videos/e/16711680/#{video_id}"><param name="allowFullScreen" value="true"></param><embed src="http://www.worldstarhiphop.com/videos/e/16711680/#{video_id}" type="application/x-shockwave-flash" allowFullscreen="true" width="#{width}" height="#{height}"></embed></object>}
      end
    end

  end
end
