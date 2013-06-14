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
    A simple gem to track the current status of London Underground services, it polls the TFL endpoint and will alert
    you if there is an issue, also provides a nice interface to TFL's tube data, still very beta, please give me a poke on github with suggestions and enhancements.
  }

  s.rubyforge_project = "service_disruption"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'fakeweb'
  s.add_development_dependency 'fuubar'

  s.add_runtime_dependency "thor"
  s.add_runtime_dependency "httparty"
  s.add_runtime_dependency "eventmachine"
  s.add_runtime_dependency "rainbow"
  s.add_runtime_dependency "activesupport"
  s.add_runtime_dependency "ruby_gntp"
  s.add_runtime_dependency "terminal-notifier"
  s.add_runtime_dependency "daemons"
end
