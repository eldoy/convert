module Convert
  module SimpleFormat

    # Convert newlines to br tags
    def simple_format(string, options = {})
      options = {:config => :simple}.merge(options)
      sanitize(string.gsub(%r{(\r\n|\n|\r)}, '<br>'), options)
    end

  end
end
