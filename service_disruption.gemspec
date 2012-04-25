# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "service_disruption/version"

Gem::Specification.new do |s|
  s.name        = "service_disruption"
  s.version     = ServiceDisruption::VERSION
  s.authors     = ["Adam Carlile"]
  s.email       = ["adam@benchmedia.co.uk"]
  s.homepage    = ""
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
  # s.add_development_dependency "rspec"
  s.add_runtime_dependency "thor"
  s.add_runtime_dependency "httparty"
  s.add_runtime_dependency "eventmachine"
  s.add_runtime_dependency "rainbow"
  s.add_runtime_dependency "active_support"
  s.add_runtime_dependency "daemons"
end
