module Convert
  module UnescapeHtml

    def unescape_html(string, options = {})
      @regex = /(&lt;.*?[a-z]{0,12}?&gt;)+/i

      string.gsub(@regex) do |tag|
        tag.gsub("&lt;", "<").gsub("&gt;", ">")
      end
    end

  end
end
