module Converters

  # Vimeo and Youtube embed markdown extension
  def video_embed(string, options = {})
    @regex = /\?\[(youtube|vimeo)\]\(https?:\/\/(www\.)?(vimeo\.com\/|youtu\.be\/|youtube\.com\/watch\?v=)(\S+)\)/

    string.scan(@regex).each do |type, prefix, url, id|
      r = if('vimeo' == type)
        vimeo_embed(options)
      elsif('youtube' == type)
        youtube_embed(options)
      else
        nil
      end
      # Substitute the original text with the embedded version
      # OLD, optional https not supported:
      # @text.gsub!("?[#{type}](https://#{prefix}#{url}#{id})", r) if r
      x = %r{\?\[#{type}\]\(https?:\/\/#{Regexp.escape(prefix)}#{Regexp.escape(url)}#{id}\)}i
      string.gsub!(x, r) if r
    end
    string
  end

end
