module Converters

  # Remove stuff from email body that is going to be stripped anyway.
  def email_escape(string, options = {})

    # No options at the moment
    options = {}.merge(options)

    # Youtube videos
    @regex = /<iframe.+src=['"].+\/embed\/(.+)[?].+['"].+iframe>/
    string = string.gsub(@regex, "https://youtu.be/#{'\1'}")

    # Vimeo videos
    # Example: https://vimeo.com/59437462
    @regex = /<iframe.+src=['"]\/\/player\.vimeo.com\/video\/(.+)[?]{1}.+['"].+iframe>/
    string = string.gsub(@regex, "https://vimeo.com/#{'\1'}")
    string
  end

end
