SampleApp::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb.
config.gem 'delayed_paperclip'
  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false
  config.action_controller.perform_caching = true
  # Do not eager load code on boot.
  config.eager_load = false
  
  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log
  
  # Raise an error on page load if there are pending migrations
  config.active_record.migration_error = :page_load
     config.assets.digest = false
  # ActionMailer settings
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
  :user_name => 'dehinde007',
  :password => 'hallit007',
  :domain => 'gmail.com',
  :address => 'smtp.gmail.com',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
} 

  # Debug mode disables concatenation and preprocessing of assets.
  config.assets.debug = true
end
