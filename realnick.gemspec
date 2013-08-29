# -*- encoding: utf-8 -*-

require File.expand_path('../lib/realnick/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "realnick"
  gem.version       = Realnick::VERSION
  gem.summary       = %q{Get real nicknames, usables for bots}
  gem.description   = %q{Get real nicknames, usables for bots}
  gem.license       = "MIT"
  gem.authors       = ["Fernando Mumbach"]
  gem.email         = "fermuch@gmail.com"
  gem.homepage      = "https://github.com/fermuch/realnick#readme"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_development_dependency 'bundler', '~> 1.0'
  gem.add_development_dependency 'rake', '~> 0.8'
  gem.add_development_dependency 'rspec', '~> 2.4'
  gem.add_development_dependency 'rubygems-tasks', '~> 0.2'
  gem.add_development_dependency 'yard', '~> 0.8'
end
