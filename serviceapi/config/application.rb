require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Serviceapi
  class Application < Rails::Application

    config.middleware.insert_before 0, "Rack::Cors" do
      allow do
        origins '*'
        resource '*', :headers => :any, :methods => [:get, :post, :delete,:options]
      end
    end

    config.active_record.raise_in_transactional_callbacks = true

    I18n.available_locales = [:en, :de, :bs]
    config.i18n.default_locale = :en

    config.autoload_paths << Rails.root.join('lib')
  end
end
