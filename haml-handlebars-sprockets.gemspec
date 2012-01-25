# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "haml-handlebars-sprockets/version"

Gem::Specification.new do |s|
  s.name        = "haml-handlebars-sprockets"
  s.version     = Haml::Handlebars::Sprockets::VERSION
  s.authors     = ["Matthew Peck","Blake Chambers"]
  s.email       = ["matthewdpeck@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Make Sprockets handlebars and Haml play well}
  s.description = %q{Make Sprockets handlebars and Haml play well}

  s.rubyforge_project = "haml-handlebars-sprockets"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
  s.add_dependency "sprockets"
  s.add_dependency "haml"
end
