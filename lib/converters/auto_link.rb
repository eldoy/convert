module Converters

  # Convert URL to html link
  def auto_link(string, options = {})
    options = {
      :mode => :all,
      :link_attr => nil,
      :skip_tags => nil,
      :strip => false
    }.merge(options)

    Rinku.auto_link(string, options[:mode], options[:link_attr], options[:skip_tags]) do |url|
      # Remove query options (default false)
      url = strip_params(url) if options[:strip]
      url
    end
  end

end
