# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'phpcs/version'

Gem::Specification.new do |spec|
  spec.name          = 'phpcs'
  spec.version       = Phpcs::VERSION
  spec.authors       = ['Kevin Chavanne']
  spec.email         = ['kevin@craftsmen.io']
  spec.summary       = %q{Ruby wrapper for phpcs}
  spec.description   = %q{Ruby wrapper for phpcs}
  spec.homepage      = 'https://github.com/craftsmen/phpcs-rb'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest', '~> 5.4'
  spec.add_dependency 'json', '~> 1.8'
end
