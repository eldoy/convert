module Convert

  # # # # # #
  # Convert strings and HTML from a long list of providers
  # @homepage: https://github.com/fugroup/convert
  # @author:   Vidar <vidar@fugroup.net>, Fugroup Ltd.
  # @license:  MIT, contributions are welcome.
  # # # # # #

  class << self; attr_accessor :converters; end

  # Set which converters to run: Convert.converters = [:markdown, :auto_html]
  # Default is all

  @converters = [
    :auto_link,
    :iframe_embed,
    :dailymotion,
    :email_escape,
    :flickr,
    :gist,
    :google_maps,
    :hashtag,
    :html_escape,
    :image_tag,
    :instagram,
    :kramdown,
    :liveleak,
    :markdown,
    :metacafe,
    :redcarpet,
    :simple_format,
    :soundcloud,
    :ted,
    :twitter,
    :unescape_html,
    :video_embed,
    :vimeo,
    :vimeo_embed,
    :worldstar,
    :youtube,
    :youtube_embed,
    :youtube_image,
    :youtube_js_api
  ]

  # Only run the ones set in Convert.converters, see above.
  Convert.converters.each do |c|

    # Require
    require_relative "converters/#{c}"

    # Extend
    extend Object.const_get("Convert::#{c.to_s.split('_').map(&:capitalize).join}")
  end
end
