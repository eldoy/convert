module Convert
  module Converters

    # Convert twitter URL to embedded html
    def twitter(string, options = {})
      @regex = %r{(?<!href=")https://twitter\.com(/#!)?/[A-Za-z0-9_]{1,15}/status(es)?/\d+(/?)}

      string.gsub(@regex) do |match|
        params = {:url => match}.merge(options)

        uri = URI("https://api.twitter.com/1/statuses/oembed.json")
        uri.query = URI.encode_www_form(params)

        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true

        response = JSON.parse(http.get(uri.request_uri).body)
        response['html']
      end
    end

  end
end
