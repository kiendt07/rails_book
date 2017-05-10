require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module RailsBook
  class Application < Rails::Application
    config.i18n.load_path += Dir[Rails.root.join("config", "locales", "**", "*.{rb,yml}")]
    config.action_view.embed_authenticity_token_in_remote_forms = true
  end
end
