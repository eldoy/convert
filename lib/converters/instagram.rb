module Converters

  def instagram(string, options = {})
    options = {:height => 714, :width => 616}.merge(options)
    @regex = %r{https?:\/\/(www.)?instagr(am\.com|\.am)/p/.+}

    string.gsub(@regex) do
      string += '/' unless string.end_with?('/')
      %{<iframe src="#{string}embed" height="#{options[:height]}" width="#{options[:width]}" frameborder="0" scrolling="no"></iframe>}
    end
  end

end
