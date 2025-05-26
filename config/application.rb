require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module HospitalApp
  class Application < Rails::Application
    config.load_defaults 8.0

    config.assets.paths << Rails.root.join("app/assets/stylesheets")
    config.assets.paths << Rails.root.join("app/assets/images")
    config.assets.paths << Rails.root.join("app/javascript")

    config.assets.compile = true
    config.i18n.default_locale = :es
  end
end
