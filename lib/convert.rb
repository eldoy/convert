root = Gem::Specification.find_by_name('convert').gem_dir

# Require the converters
Dir["#{root}/lib/converters/*.rb"].each{|f| require f}

# Require the sanitizers
Dir["#{root}/lib/sanitizers/*.rb"].each{|f| require f}

# Convert strings and HTML from a long list of converters
# @homepage: https://github.com/fugroup/convert
# @author:   Vidar <vidar@fugroup.net>, Fugroup Ltd.
# @license:  MIT, contributions are welcome.
module Convert

  # Autoload for faster loading
  module Converters
    autoload :Redcarpet, 'redcarpet'
    autoload :Kramdown, 'kramdown'
    autoload :Rinku, 'rinku'
    autoload :Sanitize, 'sanitize'
    autoload :HTMLEntities, 'htmlentities'
    autoload :Nokogiri, 'nokogiri'
    autoload :SimpleIDN, 'simpleidn'
  end

  # Some of the matchers are taken from https://github.com/dejan/auto_html

  CONVERTERS = [:iframe_embed, :dailymotion, :email_escape, :flickr, :gist, :google_maps, :hashtag, :escape_html, :image_tag, :instagram, :liveleak, :markdown, :metacafe, :redcarpet, :soundcloud, :ted, :twitter, :video_embed, :vimeo, :vimeo_embed, :worldstar, :youtube, :youtube_embed, :youtube_js_api, :auto_link, :encode, :decode, :strip_params, :sanitize, :scan, :to_ascii, :to_unicode]

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
