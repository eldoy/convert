module Convert
  module Converters

    # Embed youtube by id
    def youtube_embed(string, options = {})
      options = {:width => 590, :height => 335}.merge(options)

      %{<iframe src="https://www.youtube.com/embed/#{string}?wmode=transparent&modestbranding=1&fs=1&rel=0" allowfullscreen="1" webkitallowfullscreen="1" mozallowfullscreen="1" width="#{options[:width]}" height="#{options[:height]}" frameborder="0"></iframe>}
    end

  end
end
