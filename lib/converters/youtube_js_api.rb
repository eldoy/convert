module Convert
  module Converters

    def youtube_js_api(string, options = {})
      # Original: 390 250
      options = {:width => 590, :height => 335}.merge(options)

      @regex = /https?:\/\/(www.)?youtube\.com\/watch\?v=([A-Za-z0-9._%-]*)(\&\S+)?/

      string.gsub(@regex) do
        youtube_id = $2
        width = options[:width]
        height = options[:height]

        %{<object width="#{width}" height="#{height}"><param name="movie" value="//www.youtube.com/v/#{youtube_id}?enablejsapi=1&playerapiid=ytplayer"></param><param name="wmode" value="transparent"></param><param name="allowscriptaccess" value="always"></param><embed src="//www.youtube.com/v/#{youtube_id}?enablejsapi=1&playerapiid=ytplayer" type="application/x-shockwave-flash" wmode="transparent" width="#{width}" height="#{height}" allowscriptaccess="always"></embed></object>}
      end
    end

  end
end
