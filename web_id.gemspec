# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'web_id/version'

Gem::Specification.new do |spec|
  spec.name          = 'web-id'
  spec.version       = WebID::VERSION
  spec.authors       = ['Kryptykfysh']
  spec.email         = ['kryptykfysh@kryptykfysh.co.uk']

  spec.summary       = 'A Ruby implementation of the WebID standard.'
  spec.description   = File.read('README.md')
  spec.homepage      = 'https://github.com/kryptykfysh/webid'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/}) ||
      File.extname(f) == '.gem'
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.12', '>= 1.12.5'
  spec.add_development_dependency 'guard-rspec', '~> 4.7', '>= 4.7.3'
  spec.add_development_dependency 'rake', '~> 10.5', '>= 10.5.0'
  spec.add_development_dependency 'reek', '~> 4.2', '>= 4.2.3'
  spec.add_development_dependency 'rspec', '~> 3.5', '>= 3.5.0'
  spec.add_development_dependency 'rubocop', '~> 0.42', '>= 0.42.0'
  spec.add_development_dependency 'simplecov', '~> 0.12', '>= 0.12.0'
  spec.add_development_dependency 'yard', '~> 0.9', '>= 0.9.5'

  spec.add_runtime_dependency 'rest-client', '~> 2.0', '>= 2.0.0'
end
