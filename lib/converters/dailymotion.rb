module Converters

  def dailymotion(string, options = {})
    # http://www.dailymotion.com/video/x3gpxwp_first-person-view-of-a-downhill-ice-cross-course-red-bull-crashed-ice-2015_sport

    # Original 480 360
    options = {:width => 590, :height => 335}.merge(options)

    @regex = /http:\/\/www\.dailymotion\.com.*\/video\/(.+)_*/

    string.gsub(@regex) do
      video_id = $1
      %{<object type="application/x-shockwave-flash" data="http://www.dailymotion.com/swf/#{video_id}&related=0" width="#{options[:width]}" height="#{options[:height]}"><param name="movie" value="http://www.dailymotion.com/swf/#{video_id}&related=0"></param><param name="allowFullScreen" value="true"></param><param name="allowScriptAccess" value="always"></param><a href="http://www.dailymotion.com/video/#{video_id}?embed=1"><img src="http://www.dailymotion.com/thumbnail/video/#{video_id}" width="#{options[:width]}" height="#{options[:height]}"/></a></object>}
    end
  end

end
