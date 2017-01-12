module Convert
  module Converters

    def gist(string, options = {})
      # https://gist.github.com/1710276

      # No options at the moment
      options = {}.merge(options)

      @regex = %r{https?://gist\.github\.com/(\w+/)?(\d+)}

      string.gsub(@regex) do
        gist_id = $2
        %{<script src="https://gist.github.com/#{gist_id}.js"></script>}
      end
    end

  end
end
