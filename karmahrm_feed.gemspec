$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'karmahrm_feed/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'karmahrm_feed'
  s.version     = KarmaHrmFeed::VERSION
  s.authors     = ['Aboobacker MK']
  s.email       = ['aboobackervyd@gmail.com']
  s.homepage    = ''
  s.summary     = 'Summary of KarmaHrmFeed.'
  s.description = 'Description of KarmaHrmFeed.'
  s.license     = 'AGPL'

  s.files = Dir['{app,config,db,lib}/**/*', 'Rakefile', 'README.md']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'rails', '~> 4.2.0'
  s.add_dependency 'public_activity'
  s.add_dependency 'autoprefixer-rails'

  s.add_development_dependency 'sqlite3'
end
