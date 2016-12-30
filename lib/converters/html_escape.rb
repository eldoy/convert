module Converters

  # Escape html
  def html_escape(string, options = {})
    options = {:map => {'&' => '&amp;', '>' => '&gt;', '<' => '&lt;', '"' => '&quot;' }}.merge(options)

    @regex = /[&"><]/
    string.gsub(@regex){|m| options[:map][m]}
  end

end
