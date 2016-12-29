module Convert
  module Redcarpet

    # Markown converter
    def redcarpet(string, options = {})
      options = {:renderer => Redcarpet::Render::HTML, :markdown_options => {}}.merge(options)

      Redcarpet::Markdown.new(options[:renderer], options[:markdown_options]).render(string)
    end

  end
end
