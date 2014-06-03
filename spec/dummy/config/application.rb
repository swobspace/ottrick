require File.expand_path('../boot', __FILE__)

require "rails/all"
# require 'jquery-rails'
require 'bootstrap-sass'

Bundler.require(*Rails.groups)
require "ottrick"

module Dummy
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    config.i18n.default_locale = :de
    config.time_zone = 'Berlin'

    config.generators do |g|
      g.orm             :active_record
      g.template_engine :erb
      g.test_framework  false
      g.stylesheets     false
      g.javascripts     false
    end
  end
end

