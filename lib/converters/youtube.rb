module Convert
  module Youtube

    # Convert youtube movie URL to embedded iframe
    def youtube(string, options = {})
      # Original: 420 315
      options = {
        :width => 590,
        :height => 335,
        :frameborder => 0,
        :wmode => 'transparent',
        :autoplay => false,
        :hide_related => true,
        :fs => true,
        :modestbranding => true,
        :allow_fullscreen => true
      }.merge(options)

      @regex = /(https?:\/\/)?(www.)?(youtube\.com\/watch\?v=|youtu\.be\/|youtube\.com\/watch\?feature=player_embedded&v=)([A-Za-z0-9_-]*)(\&\S+)?(\?\S+)?/

      string.gsub(@regex) do
        youtube_id = $4
        src = "https://www.youtube.com/embed/#{youtube_id}"
        width = options[:width]
        height = options[:height]
        allow_fullscreen = " allowfullscreen" if options[:allow_fullscreen]
        frameborder = options[:frameborder]

        a = []
        a << "wmode=#{options[:wmode]}" if options[:wmode]
        a << "autoplay=1" if options[:autoplay]
        a << "rel=0" if options[:hide_related]
        a << "modestbranding=1" if options[:modestbranding]
        a << "fs=1" if options[:fs]

        src += "?#{a.join '&'}" unless a.empty?

        %{<iframe width="#{width}" height="#{height}" src="#{src}" frameborder="#{frameborder}"#{allow_fullscreen}></iframe>}
      end
    end

  end
end
