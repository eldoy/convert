module Converters

  CONFIGS = [:custom, :full, :linebreaks, :simple, :restricted, :basic, :relaxed]

  def sanitize(string, options = {})
    return string if options[:config] == false
    options = {:config => nil}.merge(options)

    config = Object.const_get("Sanitize::Config::#{options[:config].to_s.upcase}") if CONFIGS.include?(options[:config])
    Sanitize.fragment(string, config || {})
  end

end
