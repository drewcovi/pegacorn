source 'https://rubygems.org'

#ruby '1.9.3'

gem 'rails', '~> 3.2'
gem 'pg',    '~> 0.14'
gem 'rails-api'
gem 'pg',    '~> 0.14'
gem 'thin'
#gem 'sorcery'

group :development, :test do
  gem 'debugger'
  gem 'sqlite3'
  gem 'spork'                       # speedier tests
  gem 'guard-rspec'                 # watch app files
  gem 'guard-spork'                 # spork integration
  gem 'database_cleaner'            # cleanup database in tests
  gem 'fabrication'                 # model stubber
  gem 'shoulda'                     # model spec tester
  gem 'rb-inotify', require: false  # Linux file notification
  gem 'rb-fsevent', require: false  # OSX file notification
  gem 'rb-fchange', require: false  # Windows file notification
  gem 'taps'
end

group :production do
end

group :assets do
  gem 'sass-rails', '~> 3.2'
  gem 'coffee-rails', '~> 3.2'
  gem 'compass-rails'
  gem 'bootstrap-sass', '~> 2.0.3.0'
  gem 'handlebars_assets'
  gem 'jquery-rails', '~> 2.2'
  gem 'sass-rails',   '~> 3.2'
  gem 'coffee-rails', '~> 3.2'
  gem 'uglifier',     '~> 1.3'
end

group :development do
  gem 'quiet_assets'
  gem 'rspec-rails'                 # for tests
  gem 'spork'                       # speedier tests
  gem 'guard-rspec'                 # watch app files
  gem 'guard-spork'                 # spork integration
  gem 'database_cleaner'            # cleanup database in tests
  gem 'fabrication'                 # model stubber
  gem 'shoulda'                     # model spec tester
  gem 'rb-inotify', require: false  # Linux file notification
  gem 'rb-fsevent', require: false  # OSX file notification
  gem 'rb-fchange', require: false  # Windows file notification
end

gem 'devise'                   # server-side authentication
gem 'bcrypt-ruby'              # password encryption

gem 'inherited_resources'      # for easy RESTful API controller scaffolding
gem 'active_model_serializers' # works out of the box with ember-data

gem 'ember-rails'              # ember framework
gem 'ember-auth-rails'         # client-side authentication
gem 'emblem-rails'             # easier to write templates

gem 'unicorn'                  # better server gem for heroku

gem 'newrelic_rpm'             # prevent heroku from idling
gem 'handlebars-source', '1.0.0.rc3'
