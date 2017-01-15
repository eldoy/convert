module Convert
  module Converters

    # Convert chinese characters to URL safe format
    def to_ascii(string)
      SimpleIDN.to_ascii(string)
    end

     # Reverse safe format back to unicode
    def to_unicode(string)
      SimpleIDN.to_unicode(string)
    end

  end
end
