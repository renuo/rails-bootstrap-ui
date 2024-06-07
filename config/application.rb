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
    config.time_zone = 'Zurich'
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

    Lookbook.add_panel('assets', 'panels/assets', {
                         label: 'Assets',
                         locals: lambda do |data|
                                   preview_path = data.preview.lookup_path
                                   preview_name = File.basename(preview_path, '.rb')
                                   base_name = preview_name.gsub('_preview', '')
                                   asset_files = [
                                     Rails.root.join("app/javascript/controllers/#{base_name}_controller.js"),
                                     Rails.root.join("app/assets/stylesheets/_#{base_name}.scss")
                                   ]
                                   existing_files = asset_files.select { |path| File.exist?(path) }
                                   assets = existing_files.map { |path| Pathname.new(path) }
                                   { assets: assets }
                                 end
                       })
  end
end
