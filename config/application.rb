require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module MydomainNet
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :en
    config.middleware.use Rack::SslEnforcer, :only => '/admin', :ignore => %r{/assets}, :strict => true



# Don't care if the mailer can't send
config.action_mailer.raise_delivery_errors = true

# Change mail delvery to either :smtp, :sendmail, :file, :test
config.action_mailer.delivery_method = :smtp
config.action_mailer.smtp_settings = {
  address: "localhost",
  port: 25,
  domain: "domain.net",
  authentication: "plain",
  enable_starttls_auto: false,
  user_name: "user1@domain.net",
  password: "vtr512"
}

# Specify what domain to use for mailer URLs
config.action_mailer.default_url_options = {host: "www.mydomain.net"}


  end
end
