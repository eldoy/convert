# Require the converters
Dir['./lib/converters/*.rb'].each{|f| require f}

# Require the sanitizers
Dir['./lib/sanitizers/*.rb'].each{|f| require f}

# Autoload for faster loading

module Converters
  autoload :Redcarpet, 'redcarpet'
  autoload :Kramdown, 'kramdown'
  autoload :Rinku, 'rinku'
  autoload :Sanitize, 'sanitize'
  autoload :HTMLEntities, 'htmlentities'
end
autoload :Nokogiri, 'nokogiri'

# # # # # #
# The Convert module is responsible for converting strings
#
class Convert

  # # # # # #
  # Convert strings and HTML from a long list of converters
  # @homepage: https://github.com/fugroup/convert
  # @author:   Vidar <vidar@fugroup.net>, Fugroup Ltd.
  # @license:  MIT, contributions are welcome.
  # # # # # #

  # Some of the matchers are taken from https://github.com/dejan/auto_html

  CONVERTERS = [:iframe_embed, :dailymotion, :email_escape, :flickr, :gist, :google_maps, :hashtag, :escape_html, :image_tag, :instagram, :liveleak, :markdown, :metacafe, :redcarpet, :soundcloud, :ted, :twitter, :video_embed, :vimeo, :vimeo_embed, :worldstar, :youtube, :youtube_embed, :youtube_js_api, :auto_link, :encode, :decode, :strip_params, :sanitize, :nokogiri]

  DEFAULT = [:dailymotion, :flickr, :gist, :google_maps, :instagram, :liveleak, :metacafe, :soundcloud, :ted, :twitter, :vimeo, :worldstar, :youtube, :auto_link]

  # Include converters
  extend Converters

  # Run all the converters or the ones you sent to the initializers
  def self.run(string, options = {})
    return '' if !string

    # Setup
    options = {:markdown => true, :config => :custom, :converters => DEFAULT}.merge(options)

    # Include
    options[:converters] += options[:include] if options[:include]

    # Exclude
    options[:converters] -= options[:exclude] if options[:exclude]

    # Markdown
    string = markdown(string, :autolink => false) if options[:markdown]

    # Scan
    string = scan(string, options)

    # Sanitize
    string = sanitize(string, :config => options[:config])

    string
  end

end
