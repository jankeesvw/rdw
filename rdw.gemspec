# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rdw/version'

Gem::Specification.new do |spec|
  spec.name          = "rdw"
  spec.version       = Rdw::VERSION
  spec.authors       = ["Jankees van Woezik"]
  spec.email         = ["jankees@base42.nl"]
  spec.summary       = %q{Get Dutch car information from the RDW}
  spec.homepage      = "https://github.com/jankeesvw/rdw"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
