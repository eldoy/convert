module Convert
  module Converters

    def encode(string, options = {})
      HTMLEntities.new.encode(string)
    end

  end
end
