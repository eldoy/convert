module Convert
  module Converters

    # Remove query params
    def strip_params(url)
      uri = URI.parse(URI.encode(url.strip))
      uri.query = nil
      uri.to_s
    end

  end
end
