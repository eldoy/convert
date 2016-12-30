module Converters

  # Embed vimeo by id
  def vimeo_embed(string, options = {})
    {:width => 590, :height => 335}.merge(options)

    %{<iframe src="https://player.vimeo.com/video/#{string}?title=0&byline=0&portrait=0" width="#{options[:width]}" height="#{options[:height]}"></iframe>}
  end

end
