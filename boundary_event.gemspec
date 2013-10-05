# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'boundary_event/version'

Gem::Specification.new do |spec|
  spec.name          = "boundary_event"
  spec.version       = BoundaryEvent::VERSION
  spec.authors       = ["Nolan Davidson"]
  spec.email         = ["nolan.davidson@gmail.com"]
  spec.description   = "Wrapper for Boundary Event API"
  spec.summary       = "Wrapper for Boundary Event API"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 1.8.7"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_dependency "json"
end
