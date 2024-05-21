# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsBootstrapUi
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w[assets tasks])

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    config.lookbook.project_name = 'Rails Bootstrap Ui'

    config.lookbook.debug_menu = true

    config.lookbook.page_nav_filter = true

    config.lookbook.preview_display_options = {
      theme: %w[light dark]
    }

    config.lookbook.ui_theme = 'green'

    config.lookbook.default_preview_layout = 'application'

    config.lookbook.preview_paths = ['app/components/previews']
  end
end
