module Convert
  module Markdown

    # Converts the string into html
    def markdown(string, options = {})
      options = {
        :autolink => true,
        :fenced_code_blocks => true,
        :disable_indented_code_blocks => true,
        :no_intra_emphasis => true
      }.merge(options)

      Redcarpet::Markdown.new(
        Redcarpet::Render::HTML.new(:filter_html => false, :hard_wrap => true),
        options
      ).render(string)
    end

  end
end
