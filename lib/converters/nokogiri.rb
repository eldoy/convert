module Convert
  module Converters

    SKIP = ['a', 'pre', 'code', 'kbd', 'script', 'iframe', 'img', 'link']

    # Scan a string with Nokogiri and convert if match string
    def scan(string, options = {})
      return string if options[:converters].empty?

      doc = Nokogiri::HTML.fragment(string)

      doc.search('.//text()').each do |el|
        t = el.text
        if t.strip.size > 0
          t = convert(t, options) if convertable?(el)
        end
        el.replace(t)
      end

      doc.to_html
    end

    # Loop converters and convert
    def convert(string, options = {})
      options[:converters].each{|c| string = send(c, string)}
      string
    end

    # Checks if a node is convertable by scanning the parents
    def convertable?(node)
      while(node = node.parent) do
        return false if SKIP.include?(node.name)
      end
      true
    end

  end
end
