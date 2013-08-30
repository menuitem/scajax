# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'scajax/version'

Gem::Specification.new do |spec|
  spec.name          = "scajax"
  spec.version       = Scajax::VERSION
  spec.authors       = ["Lucjan Stepien"]
  spec.email         = ["lucjanstepien@gmail.com"]
  spec.description   = %q{Simply ajaxify your scaffold}
  spec.summary       = %q{Ajax Generator for Scaffolds}
  spec.homepage      = "http://github.com/menuitem/scajax"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rails", "~> 3.2.0"
end
