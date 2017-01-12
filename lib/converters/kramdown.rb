module Convert
  module Converters

    def kramdown(string, options = {})
      options = {
        :auto_ids => false,
        :entity_output => :as_char,
        :enable_coderay => true,
        :parse_block_html => true,
        :parse_span_html => true,
        :smart_quotes => ['apos', 'apos', 'quot', 'quot']
      }.merge(options)

      Kramdown::Document.new(string, options).to_html
    end

  end
end
