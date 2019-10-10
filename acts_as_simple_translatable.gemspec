lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'acts_as_simple_translatable/version'

Gem::Specification.new do |spec|
  spec.name          = 'acts_as_simple_translatable'
  spec.version       = ActsAsSimpleTranslatable::VERSION
  spec.authors       = ['Stjepan Hadjic']
  spec.email         = ['d4be4st@gmail.com']
  spec.summary       = 'acts as simple translatable'
  spec.description   = 'Took acts_as_translatable and stripped it down'
  spec.homepage      = 'https://github.com/infinum/acts_as_simple_translatable'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'rake'
end
