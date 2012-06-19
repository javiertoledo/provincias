# -*- encoding: utf-8 -*-
require File.expand_path('../lib/provincias/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Javier Toledo"]
  gem.email         = ["javier@theagilemonkeys.com"]
  gem.description   = %q{Provides a Provincia class to search for spanish province names with numeric ids to link to your application data.}
  gem.summary       = %q{Stop storing spanish provinces in a static table in your database. Use this gem with its class Provincia, reclaim a few bytes of your storage quota and sanitize your DB structure from unuseful static data.}
  gem.homepage      = "https://github.com/agilemonkeys/provincias"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "provincias"
  gem.require_paths = ["lib"]
  gem.version       = Provincias::VERSION
end
