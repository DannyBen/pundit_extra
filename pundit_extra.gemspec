lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pundit_extra/version'

Gem::Specification.new do |s|
  s.name        = 'pundit_extra'
  s.version     = PunditExtra::VERSION
  s.summary     = 'Additions for Pundit'
  s.description = 'Add some helpers and additional functionality to Pundit.'
  s.authors     = ['Danny Ben Shitrit']
  s.email       = 'db@dannyben.com'
  s.files       = Dir['README.md', 'lib/**/*.rb']
  s.homepage    = 'https://github.com/DannyBen/pundit_extra'
  s.license     = 'MIT'

  s.required_ruby_version = '>= 3.0.0'

  s.metadata['rubygems_mfa_required'] = 'true'
end
