# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'wordsmith/version'

Gem::Specification.new do |spec|
  spec.name          = "wordsmith-ruby-sdk"
  spec.version       = Wordsmith::VERSION
  spec.authors       = ["Robert Tillery"]
  spec.email         = ["rtillery@automatedinsights.com"]

  spec.summary       = %q{Wordsmith SDK for Ruby}
  spec.description   = %q{Provides API clients for Wordsmith.}
  spec.homepage      = "https://github.com/AutomatedInsightsInc/wordsmith-ruby-sdk"

  spec.required_ruby_version = '~> 2.0'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.8"
  spec.add_development_dependency "dotenv", "~> 2.1"
  spec.add_development_dependency "codeclimate-test-reporter"

  spec.add_dependency 'faraday', '~> 0.9'
  spec.add_dependency 'hashie', '~> 3.4'
end
