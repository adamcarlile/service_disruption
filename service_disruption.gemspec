# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'service_disruption/version'

Gem::Specification.new do |s|
  s.name        = "service_disruption"
  s.version     = ServiceDisruption::VERSION
  s.authors     = ["Adam Carlile"]
  s.email       = ["adam@benchmedia.co.uk"]
  s.homepage    = "http://adamcarlile.com"
  s.summary     = %q{
    A simple gem to track the current status of London Underground services
  }
  s.description = %q{
    A simple gem to track the current status of London Underground services, it polls the TFL endpoint and will alert
    you if there is an issue, also provides a nice interface to TFL's tube data, still very beta, please give me a poke on github with suggestions and enhancements.
  }

  s.license = "MIT"

  s.files         = `git ls-files -z`.split("\x0")
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]

  s.add_dependency "faraday"
  s.add_dependency "faraday_middleware"
  s.add_dependency "virtus"
  s.add_dependency "activesupport"

  s.add_development_dependency "minitest"
  s.add_development_dependency "bundler", "~> 1.6"
  s.add_development_dependency "rake", "~> 10.0"
  s.add_development_dependency "pry"
end
