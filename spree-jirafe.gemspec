# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'spree/jirafe/version'

Gem::Specification.new do |spec|
  spec.name          = "spree-jirafe"
  spec.version       = Spree::Jirafe::VERSION
  spec.authors       = ["Washington Luiz"]
  spec.email         = ["huoxito@gmail.com"]
  spec.description   = "Integrate Spree with Jirafe frontend events"
  spec.summary       = "Integrate Spree with Jirafe frontend events"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_runtime_dependency "spree", "~> 2.0"
end
