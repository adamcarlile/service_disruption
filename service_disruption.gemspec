# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "service_disruption"

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
    BOOM!
  }

  s.rubyforge_project = "service_disruption"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency 'rake', '~> 0.9.2'
  s.add_development_dependency 'rspec', '~> 2.9.0'
  s.add_development_dependency 'fakeweb', '~> 1.3.0'
  s.add_development_dependency 'fuubar', '~> 1.0.0'

  s.add_runtime_dependency "thor", '~> 0.14.6'
  s.add_runtime_dependency "httparty", '~> 0.8.3'
  s.add_runtime_dependency "eventmachine", '~> 0.12.10'
  s.add_runtime_dependency "rainbow", '~> 1.1.3'
  s.add_runtime_dependency "activesupport", '~> 3.2.0'
  s.add_runtime_dependency "ruby_gntp", '~> 0.3.4'
end
