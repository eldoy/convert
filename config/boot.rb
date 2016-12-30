require 'bundler/setup'
Bundler.require(:default, :development)

MODE = ENV['RACK_ENV'] || 'development'

# autoload :Redcarpet, 'redcarpet'
# autoload :Kramdown, 'kramdown'
# autoload :CodeRay, 'coderay'
# autoload :Rinku, 'rinku'

require './lib/convert.rb'
