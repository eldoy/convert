module Convert
  module Converters

    def decode(string, options = {})
      HTMLEntities.new.decode(string)
    end

  end
end
