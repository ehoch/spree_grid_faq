$:.push File.expand_path("../lib", __FILE__)
require "spree_grid_faq/version"

# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_grid_faq'
  s.version     = SpreeGridFaq::VERSION
  s.summary     = 'Spree Grid FAQ adds a Frequently Asked Question section to your spree store'
  s.description = 'Spree Grid FAQ adds a Frequently Asked Question section to your spree store.  It allows questions to be attached to existing taxons and products and was designe for Alarm Grid.'
  s.required_ruby_version = '>= 1.8.7'

  s.author    = 'Eric Hochberger'
  s.email     = 'eric@alarmgrid.com'
  s.homepage  = 'http://www.alarmgrid.com'

  #s.files       = `git ls-files`.split("\n")
  #s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 1.1.0'
  s.add_dependency 'haml'

  s.add_development_dependency 'capybara', '1.0.1'
  s.add_development_dependency 'factory_girl', '~> 2.6.4'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 2.9'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'launchy'
end
