module Convert
  module ImageTag

    # TODO: Define renderer lazily so we can defer loading redcarpet
    require 'redcarpet'

    class NoParagraphRenderer < ::Redcarpet::Render::XHTML
      def paragraph(text)
        text
      end
    end

    # Convert image to img html tag
    def image_tag(string, options = {})
      options = {:alt => '', :proxy => ''}.merge(options)

      r = Redcarpet::Markdown.new(NoParagraphRenderer)

      @regex = /https?:\/\/.+?\.(jpg|jpeg|bmp|gif|png)/i

      string.gsub(@regex) do |match|
        r.render("![#{options[:alt]}](#{options[:proxy]}#{match})")
      end
    end

  end
end
