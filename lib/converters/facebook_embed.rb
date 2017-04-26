module Convert
  module Converters

    # Embed vimeo by id
    def facebook_embed(string, options = {})
      options = {:width => 590, :height => 335}.merge(options)

      %{<iframe src="https://www.facebook.com/plugins/video.php?href=https://www.facebook.com/facebook/videos/#{string}/&width=#{options[:width]}&show_text=false&height=#{options[:height]}" width="#{options[:width]}" height="#{options[:height]}" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowTransparency="true"></iframe>}
    end

  end
end
