# Convert strings and HTML to links and embedded content

Convert any string or HTML to links and embedded content from a long list of providers and libraries.

### Installation
```
gem install convert
```
or add to Gemfile.

### Usage

```ruby
# Require convert if you're not using bundler
require 'convert'

# Run default converters. Pass :converters => [:auto_link, :decode]
Convert.run('string')

# Convert with Nokogiri, used by 'run'
Convert.scan('HTML string')

# URL to HTML link
Convert.auto_link('https://crowdfundhq.com')

# Embed dailymotion videos (https://dailymotion.com)
Convert.dailymotion('string')

# Decode HTML, opposite of above
Convert.decode('string')

# Encode HTML with HTMLEntities
Convert.encode('string')

# Remove embedded videos from emails
Convert.email_escape('string')

# Embed flickr content (https://flickr.com)
Convert.flickr('string')

# Embed a Github gist (https://gist.github.com)
Convert.gist('string')

# Embed classic google maps (https://maps.google.com)
Convert.google_maps('string')

# Twitter or Facebook hastag to HTML link
Convert.hashtag('#flat')

# Escape HTML
Convert.escape_html('html')

# Unescape HTML
Convert.unescape_html('string')

# Embed iframe
Convert.iframe_embed('https://crowdfundhq.com/campaigns/flatty.embed')

# Convert
Convert.image_tag('https://crowdfundhq.com/logo.png')

# URL to Instagram embedded content
Convert.instagram('string')

# String to markdown (https://kramdown.gettalong.org)
Convert.kramdown('string')

# Embed live leak videos
Convert.liveleak('string')

# Embed markdown with Redcarpet
Convert.redcarpet('string')

# Sanitize HTML with the Sanitize gem
Convert.sanitize('HTML string')

# Sanitize config: :custom, :full, :linebreaks, :simple, :restricted, :basic, :relaxed
# You can add your own config by adding a file like the ones here:
# https://github.com/fugroup/convert/tree/master/lib/sanitizers
Convert.sanitize('HTML string', :config => :custom)

# Strip parameters from URL
Convert.strip_params('URL string')

# Same as above, a few other options
Convert.markdown('string')

# Embed metacafe content (https://www.metacafe.com)
Convert.metacafe('string')

# New lines to HTML br tags
Convert.simple_format('string')

# Embed Soundcloud music (https://soundcloud.com)
Convert.soundcloud('string')

# Embed TED videos (https://www.ted.com)
Convert.ted('string')

# Twitter embed tweet (https://twitter.com)
Convert.twitter('string')

# Embed Youtube or Vimeo videos from URL
Convert.video_embed('string')

# Embed Vimeo video, full (https://vimeo.com)
Convert.vimeo('string')

# Embed Vimeo video, simple
Convert.vimeo_embed('string')

# Embed worldstar content
Convert.worldstar('string')

# Embed Youtube videos, full (https://youtube.com)
Convert.youtube('string')

# Embed Youtube videos, simple
Convert.youtube_embed('string')

# Embed Youtube image
Convert.youtube_image('string')

# Embed Youtube JS API
Convert.youtube_js_api('string')

# Convert Chinese and other non-standard characters to IDN
Convert.to_ascii('string')

# Reverse IDN conversion
Convert.to_unicode('string')
```

Created and maintained by [Fugroup Ltd.](https://www.fugroup.net) We are the creators of [CrowdfundHQ.](https://crowdfundhq.com)

`@authors: Vidar`
