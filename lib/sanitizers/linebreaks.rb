class Sanitize
  module Config

    LINEBREAKS = {
      :elements => %w[p br a],
      :attributes => {
        'a' => ['href']
      }
    }

  end
end
