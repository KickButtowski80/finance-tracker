require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Workspace
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    # config.time_zone = 'Central Time (US & Canada)'
    config.active_record.default_timezone = :utc
    config.active_record.time_zone_aware_attributes = true
    config.beginning_of_week = :sunday
    config.active_record.time_zone_aware_types = [:datetime, :time]
  end
end
