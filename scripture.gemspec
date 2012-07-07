# -*- encoding: utf-8 -*-
require File.expand_path('../lib/scripture/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Ryan Robeson"]
  gem.email         = ["ryan.robeson@gmail.com"]
  gem.description   = %q{}
  gem.summary       = %q{A simple gem for acquiring bible verses.}
  gem.homepage      = "https://github.com/ryan-robeson/scripture-gem"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "scripture"
  gem.require_paths = ["lib"]
  gem.version       = Scripture::VERSION

  # Dependencies
  %w[thor httparty].each do |g|
    gem.add_dependency g
  end

  # Development Dependencies
  %w[rake rdoc].each do |g|
    gem.add_development_dependency g
  end
end
