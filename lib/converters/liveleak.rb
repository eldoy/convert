module Convert
  module Liveleak

    def liveleak(string, options = {})
      options = {
        :width => 420,
        :height => 315,
        :frameborder => 0,
        :wmode => nil,
        :autoplay => false,
        :hide_related => false
      }.merge(options)

      @regex = %r{http://www\.liveleak\.com/(?:ll_embed|view)\?.=(\w+)}

      string.gsub(@regex) do
        a = []
        a << "wmode=#{options[:wmode]}" if options[:wmode]
        a << "autoplay=1" if options[:autoplay]
        a << "rel=0" if options[:hide_related]

        src = "http://www.liveleak.com/ll_embed?f=#{$1}"
        src += "?#{a.join '&'}" unless a.empty?

        %{<iframe width="#{options[:width]}" height="#{options[:height]}" src="#{src}" frameborder="#{options[:frameborder]}" allowfullscreen></iframe>}
      end
    end

  end
end
