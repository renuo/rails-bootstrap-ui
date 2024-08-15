# frozen_string_literal: true

class UiComponentGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('templates', __dir__)

  def create_assets_file
    template 'component.scss', "app/assets/stylesheets/components/_#{file_name}.scss"

    import_string = "@import 'components/#{file_name}';"
    application_stylesheet = 'app/assets/stylesheets/application.scss'
    return unless File.exist?(application_stylesheet) && File.read(application_stylesheet).exclude?(import_string)

    append_to_file application_stylesheet, "#{import_string}\n"
  end

  def create_preview_files
    template 'component_preview.rb', "app/components/previews/#{file_name}_component_preview.rb"
    template 'themes.html.erb', "app/views/components/#{plural_name}/_themes.html.erb"
  end
end
