test 'Features'

test 'run'

t = Convert.run('string')

is t.strip, '<p>string</p>'

t = Convert.run('string', :markdown => false)

is t.strip, 'string'

test 'auto_link'

c = Convert.auto_link('http://crowdfundhq.com')
is c, %{<a href="http://crowdfundhq.com">http://crowdfundhq.com</a>}

test 'iframe_embed'

c = Convert.iframe_embed('http://crowdfundhq.com')
is c, %{<iframe frameborder="0" scrolling="no" height="436" width="231" src="http://crowdfundhq.com"></iframe>}

test 'dailymotion'

c = Convert.dailymotion('http://www.dailymotion.com/video/x3gpxwp_first-person-view-of-a-downhill-ice-cross-course-red-bull-crashed-ice-2015_sport')
is c, %{<object type="application/x-shockwave-flash" data="http://www.dailymotion.com/swf/x3gpxwp_first-person-view-of-a-downhill-ice-cross-course-red-bull-crashed-ice-2015_sport&related=0" width="590" height="335"><param name="movie" value="http://www.dailymotion.com/swf/x3gpxwp_first-person-view-of-a-downhill-ice-cross-course-red-bull-crashed-ice-2015_sport&related=0"></param><param name="allowFullScreen" value="true"></param><param name="allowScriptAccess" value="always"></param><a href="http://www.dailymotion.com/video/x3gpxwp_first-person-view-of-a-downhill-ice-cross-course-red-bull-crashed-ice-2015_sport?embed=1"><img src="http://www.dailymotion.com/thumbnail/video/x3gpxwp_first-person-view-of-a-downhill-ice-cross-course-red-bull-crashed-ice-2015_sport" width="590" height="335"/></a></object>}

test 'decode'

c = Convert.decode('string')

test 'encode'

c = Convert.encode('string')

test 'email_escape'

c = Convert.email_escape('string')

test 'flickr'

c = Convert.flickr('string')

test 'gist'

c = Convert.gist('string')

test 'google_maps'

c = Convert.google_maps('string')

test 'hashtag'

c = Convert.hashtag('string')

test 'escape_html'

c = Convert.escape_html('string')

test 'image_tag'

c = Convert.image_tag('https://crowdfundhq.com')
is c, %{<img src="https://crowdfundhq.com" alt="">}

test 'instagram'

c = Convert.instagram('string')

test 'kramdown'

c = Convert.kramdown('string')

test 'liveleak'

c = Convert.liveleak('string')

test 'markdown'

c = Convert.markdown('string')

test 'metacafe'

c = Convert.metacafe('string')

test 'redcarpet'

c = Convert.redcarpet('string')

test 'sanitize'

c = Convert.sanitize('string')

test 'simple_format'

c = Convert.simple_format('string')

test 'soundcloud'

c = Convert.soundcloud('string')

test 'strip_params'

t = Convert.strip_params('string?hello=0')
is t, 'string'

test 'ted'

c = Convert.ted('string')

test 'twitter'

c = Convert.twitter('string')

test 'unescape_html'

c = Convert.unescape_html('string')

test 'video_embed'

c = Convert.video_embed('string')

test 'vimeo'

c = Convert.vimeo('string')

test 'vimeo_embed'

c = Convert.vimeo_embed('string')

test 'worldstar'

c = Convert.worldstar('string')

test 'youtube'

c = Convert.youtube('string')

test 'youtube_embed'

c = Convert.youtube_embed('string')

test 'youtube_image'

c = Convert.youtube_image('string')

test 'youtube_js_api'

c = Convert.youtube_js_api('string')

test 'simpleidn to_ascii'

c = Convert.to_ascii('string')

test 'simpleidn to_unicode'

c = Convert.to_unicode('string')
