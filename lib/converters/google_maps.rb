module Converters

  def google_maps(string, options = {})
    options = {
      :width => 420,
      :height => 315,
      :style => "color:#000;text-align:left",
      :link_text => "View Larger Map",
      :show_info => true,
      :type => :normal,
      :zoom => 18,
      :more => ''
    }.merge(options)

    map_type = {:normal => '&t=m', :satellite => '&t=k', :terrain => '&t=p', :hybrid => '&t=h'}

    @regex = /(https?):\/\/maps\.google\.([a-z\.]+)\/maps\?(.*)/

    string.gsub(@regex) do
      domain_country = $2
      map_query = $3
      width = options[:width]
      height = options[:height]
      style = options[:style]
      link_text = options[:link_text]
      type = options[:type].to_sym
      map_options = (options[:show_info] ? '' : '&iwloc=near')
      map_options << map_type[type] if map_type.has_key?(type)
      map_options << "&z=#{options[:zoom]}"
      map_options << options[:more]
      %{<iframe width="#{width}" height="#{height}" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="//maps.google.#{domain_country}/maps?f=q&source=s_q&#{map_query}&output=embed#{map_options}"></iframe><br><small><a href="//maps.google.#{domain_country}/maps?f=q&source=embed&#{map_query}" style="#{style}">#{link_text}</a></small>}
    end
  end

end
