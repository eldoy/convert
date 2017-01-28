class Sanitize
  module Config

    FULL = {
      :elements => %w[
      a abbr b blockquote br caption cite code col colgroup dd del div dl
      dt nav em figcaption figure font form h1 h2 h3 h4 h5 h6 hgroup hr i img input ins li label link
      ol p pre s script small span strike strong style sub sup table tbody td
      tfoot th thead time tr u ul iframe
      ],

      :attributes => {
        :all => ['dir', 'lang', 'title', 'class', 'style', 'id'],
        'a' => ['href', 'target'],
        'blockquote' => ['cite'],
        'col' => ['span', 'width'],
        'colgroup' => ['span', 'width'],
        'del' => ['cite', 'datetime'],
        'img' => ['align', 'alt', 'height', 'src', 'width'],
        'ins' => ['cite', 'datetime'],
        'input' => ['name','placeholder', 'type', 'value', 'width'],
        'form' => ['action', 'method', 'name'],
        'link' => ['href', 'rel', 'type'],
        'ol' => ['start', 'reversed', 'type'],
        'q' => ['cite'],
        'table' => ['summary', 'width'],
        'td' => ['abbr', 'axis', 'colspan', 'rowspan', 'width'],
        'th' => ['abbr', 'axis', 'colspan', 'rowspan', 'scope', 'width'],
        'time' => ['datetime', 'pubdate'],
        'ul' => ['type'],
        'iframe' => ['width', 'height', 'src', 'allowFullScreen', 'allowfullscreen', 'frameborder'],
        'script' => ['src', 'type']
      },

      :protocols => {
        'a' => {'href' => ['ftp', 'http', 'https', 'mailto', :relative]},
        'img' => {'src' => ['http', 'https', :relative]},
        'ins' => {'cite' => ['http', 'https', :relative]},
        'q' => {'cite' => ['http', 'https', :relative]}
      },

      :add_attributes => {},

      :css => {
        :properties => %w[width height]
      }
    }

  end
end
