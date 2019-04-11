require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AwsMeetup2
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    ENV['REGION'] = "us-east-1"
    ENV['AWS_REGION'] = "us-east-1"

    config.active_job.queue_name_prefix = "aws-meetup-2_#{Rails.env}"

    config.action_mailer.smtp_settings = {
      address: "email-smtp.us-east-1.amazonaws.com",
      port: 587,
      user_name: Rails.application.credentials[:aws][:ses_smtp_username], #Your SMTP user
      password: Rails.application.credentials[:aws][:ses_smtp_password], #Your SMTP password
      authentication: :login,
      enable_starttls_auto: true
    }

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
