# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Prelaunchr::Application.initialize!

Rails.logger = Logger.new(STDOUT)

  ActionMailer::Base.smtp_settings = {
    address:              ENV.fetch('SMTP_ADDRESS', 'smtp.sendgrid.net'),
    port:                 ENV.fetch('SMTP_PORT', '587'),
    password:             ENV.fetch('SMTP_PASSWORD', 'u2wiexgt5000'),
    user_name:            ENV.fetch('SMTP_USERNAME', 'app85500809@heroku.com'),
    authentication:       :plain,
    enable_starttls_auto: true,
  }
