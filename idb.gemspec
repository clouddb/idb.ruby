# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "idb/version"

Gem::Specification.new do |s|
  s.name        = "idb"
  s.version     = IDB::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Riceball LEE"]
  s.email       = ["snowyu.lee@gmail.com"]
  s.homepage    = "https://www.github.com/snowyu/idb.ruby"
  s.summary     = %q{A Ruby gem for iDB NOSQL Database.}
  s.description = %q{This gem is designed to provide a Ruby interface to the iDB database system.}

  s.rubyforge_project = "idb"

  s.add_development_dependency "rspec", "~> 2.9.0"
  s.add_development_dependency "forgery", "~> 0.5.0"
  s.add_development_dependency "rdoc", "~> 3.12"
  s.add_development_dependency "simplecov", "~> 0.6.2"
  s.add_dependency "ffi-xattr", ">= 0.0.4"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
