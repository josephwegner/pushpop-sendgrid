# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'pushpop-sendgrid/version'

Gem::Specification.new do |s|

  s.name        = "pushpop-sendgrid"
  s.version     = Pushpop::Sendgrid::VERSION
  s.authors     = ["Josh Dzielak"]
  s.email       = "josh@keen.io"
  s.homepage    = "https://github.com/pushpop-project/pushpop-sendgrid"
  s.summary     = "Sendgrid plugin for sending emails with Pushpop"

  s.add_dependency "pushpop"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end

