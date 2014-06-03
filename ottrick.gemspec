$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ottrick/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ottrick"
  s.version     = Ottrick::VERSION
  s.authors     = ["Wolfgang Barth"]
  s.email       = ["wob@swobspace.net"]
  s.homepage    = "https://github.com/swobspace/ottrick"
  s.summary     = "Rails mountable engine to create OTRS tickets over the generic interface"
  s.description = "Rails mountable engine to create OTRS tickets over the generic interface"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.1.1"
  s.add_dependency "wobapphelpers"
  s.add_dependency "ottick"
  s.add_dependency "simple_form"
  s.add_dependency 'sass-rails'
  s.add_dependency 'coffee-rails'

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency 'sass-rails', '~> 4.0.3'
  s.add_development_dependency "bootstrap-sass", "~> 3.1.1"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "database_cleaner"
  s.add_development_dependency "shoulda"
  s.add_development_dependency "dotenv"


end
