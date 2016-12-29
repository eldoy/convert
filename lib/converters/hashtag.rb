module Convert
  module Hashtag

    def hashtag(string, options = {})
      options = {:source => :twitter}.merge(options)
      @regex = /#([^\s]+)/

      if options[:source] == :twitter
        string.gsub(@regex, '<a href="http://twitter.com/search?q=%23\1&f=realtime" class="hashtag" target="_blank">#\1</a>')
      elsif options[:source] == :facebook
        string.gsub(@regex, '<a href="https://www.facebook.com/hashtag/\1" class="hashtag" target="_blank">#\1</a>')
      end
    end

  end
end
