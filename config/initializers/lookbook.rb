Rails.application.config.lookbook.project_name = 'Rails Bootstrap Ui'

Rails.application.config.lookbook.debug_menu = true

Rails.application.config.lookbook.page_nav_filter = true

Rails.application.config.lookbook.preview_display_options = {
  theme: %w[light dark]
}

Rails.application.config.lookbook.ui_theme = 'green'

Rails.application.config.lookbook.default_preview_layout = 'application'

Rails.application.config.lookbook.preview_paths = ['app/components/previews']

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
