source 'https://rubygems.org'

ruby '2.3.5'

gem 'activeadmin', '1.0.0.pre2'
gem 'delayed_job_active_record', '~> 4.0.3'
gem 'devise'
gem 'pg'
gem 'rails', '4.2.5.2'
gem 'unicorn'
gem 'social-share-button'
gem 'high_voltage', '~> 3.0.0'
gem 'redcarpet'
gem 'markdown-rails'
gem 'pry-rails'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'coffee-rails', '~> 4.1.0'
  gem 'sass-rails',   '~> 5.0.1'
  gem 'uglifier'
end

group :development, :test do
  gem 'guard-livereload'
  gem 'pry'
  gem 'rspec-rails', '3.4.2'
  gem 'rspec-mocks', '3.4.1'
  gem 'test-unit', '~> 3.0'
  gem "dotenv-rails"
  gem 'foreman'
end

group :development do
  gem 'mailcatcher'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

group :production do
  gem 'puma', '~> 3.0'
end
