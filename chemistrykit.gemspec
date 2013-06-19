Gem::Specification.new do |s|
  s.name          = "chemistrykit"
  s.version       = "1.2.0"
  s.platform      = Gem::Platform::RUBY
  s.authors       = ["Dave Haeffner"]
  s.email         = ["dave@arrgyle.com"]
  s.homepage      = "https://github.com/arrgyle/chemistrykit"
  s.summary       = "A simple and opinionated web testing framework for Selenium that follows convention over configuration."
  s.description   = "Fixing a bug with exit status codes not returning properly on failure. And bumping to a new version of selenium-connect to get better logging and access to GhostDriver/PhantomJS."
  s.license       = 'MIT'

  s.files         = `git ls-files`.split($/)
  s.test_files    = s.files.grep(%r{^(scripts|spec|features)/})
  s.executables   = s.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.required_ruby_version = '>=1.9'

  s.add_dependency "thor", "~> 0.17.0"
  s.add_dependency "rspec", "~> 2.12.0"
  s.add_dependency "selenium-webdriver", "~> 2.29.0"
  s.add_dependency "ci_reporter", "~> 1.8.3"
  s.add_dependency "rest-client", "~> 1.6.7"
  s.add_dependency "selenium-connect", "~> 1.9.0"

  s.add_development_dependency "rspec", "~> 2.12.0"
  s.add_development_dependency "aruba", "~> 0.5.1"
  s.add_development_dependency "cucumber", "~> 1.2.1"
  s.add_development_dependency "rake", "~> 10.0.3"

  s.extensions = 'ext/mkrf_conf.rb'
end
