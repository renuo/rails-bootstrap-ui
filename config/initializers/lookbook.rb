# frozen_string_literal: true

Rails.application.config.lookbook.project_name = 'Rails Bootstrap Ui'

Rails.application.config.lookbook.debug_menu = true

Rails.application.config.lookbook.page_nav_filter = true

Rails.application.config.lookbook.preview_display_options = {
  theme: %w[light dark]
}

Rails.application.config.lookbook.ui_theme = 'green'

Rails.application.config.lookbook.project_logo = Rails.root.join('app/assets/images/renuo_logo.svg').read

Rails.application.config.lookbook.default_preview_layout = 'application'

Rails.application.config.lookbook.preview_paths = ['app/components/previews']

def generate_asset_panel(panel_name, label, file_patterns)
  Lookbook.add_panel(panel_name, 'panels/assets', {
                       label:,
                       locals: ->(data) { find_assets(data, file_patterns) }
                     })
end

def find_assets(data, file_patterns)
  base_name = File.basename(data.preview.lookup_path, '.rb').gsub('_preview', '')
  asset_paths = file_patterns.map { |pattern| pattern.sub('{base_name}', base_name) }

  full_paths = asset_paths.map { |path| Rails.root.join(path) }
  existing_files = full_paths.select { |path| File.exist?(path) }
  assets = existing_files.map { |path| Pathname.new(path) }

  { assets: assets }
end

generate_asset_panel('CSS', 'CSS',
                     %w[
                       app/assets/stylesheets/_{base_name}.scss
                       app/assets/stylesheets/abstracts/_{base_name}.scss
                       app/assets/stylesheets/{base_name}.css
                     ])

generate_asset_panel('JS', 'JS',
                     %w[
                       app/javascript/controllers/{base_name}_controller.js
                       app/javascript/controllers/{base_name}.js
                     ])
