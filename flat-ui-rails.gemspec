# -*- encoding: utf-8 -*-
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "flat-ui-rails/version"

Gem::Specification.new do |gem|
  gem.name          = "flat-ui-rails"
  gem.version       = FlatUi::Rails::VERSION
  gem.authors       = ["Jakub Arnold"]
  gem.email         = ["darthdeus@gmail.com"]
  gem.description   = %q{Flat-UI bundled for Rails Asset Pipeline}
  gem.summary       = %q{Flat-UI bundled for Rails Asset Pipeline}
  gem.homepage      = "https://github.com/darthdeus/flat-ui-rails"

  gem.files         = `git ls-files`.split($/)
  gem.require_paths = ["lib"]
end
