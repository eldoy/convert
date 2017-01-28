Gem::Specification.new do |s|
  s.name        = 'convert'
  s.version     = '0.1.5'
  s.date        = '2017-01-28'
  s.summary     = "Convert strings and HTML to links and embedded content"
  s.description = "Easily convert any string and replace with links and embedded content from a long list of providers and libraries."
  s.authors     = ["Fugroup Limited"]

  s.add_runtime_dependency 'redcarpet', '~> 3.4'
  s.add_runtime_dependency 'kramdown', '~> 1.9'
  s.add_runtime_dependency 'rinku', '~> 2.0'
  s.add_runtime_dependency 'sanitize', '~> 4.4'
  s.add_runtime_dependency 'htmlentities', '~> 4.3'
  s.add_runtime_dependency 'nokogiri', '~> 1.6'
  s.add_runtime_dependency 'simpleidn', '>= 0'
  s.add_development_dependency 'futest', '>= 0'

  s.email       = 'mail@fugroup.net'
  s.homepage    = 'https://github.com/fugroup/convert'
  s.license     = 'MIT'

  s.require_paths = ['lib']
  s.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
end
