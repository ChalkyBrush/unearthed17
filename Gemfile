source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
ruby "2.0.0"
gem 'rails', '4.2.1'
# Use sqlite3 as the database for Active Record
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'nokogiri'

gem 'geokit-rails'

gem 'httparty'
gem 'rack-cors', :require => 'rack/cors'

gem 'platform-api', git: 'https://github.com/jalada/platform-api', branch: 'master'

gem 'letsencrypt-rails-heroku', group: 'production'


# gem 'rgeo'
# gem 'dbf'
# gem 'rgeo-shapefile', '~>0.3.0'
# gem 'activerecord-postgis-adapter'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'pg'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end
# postgres://<username>:<password>@<host>:<port>/<database>
# postgres://hnybsrjtgcjfgc:d40e4bd0baf76008b738d84fca778c4b165340128211486c8b6a4120927d2a21@ec2-107-20-191-76.compute-1.amazonaws.com:5432/ddm6t801atd3r8
# heroku config:set DATABASE_URL="postgis://hnybsrjtgcjfgc:d40e4bd0baf76008b738d84fca778c4b165340128211486c8b6a4120927d2a21@ec2-107-20-191-76.compute-1.amazonaws.com:5432/ddm6t801atd3r8?postgis_extension=true&search_schema_path=public,postgis"
