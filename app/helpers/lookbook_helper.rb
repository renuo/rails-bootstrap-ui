# frozen_string_literal: true

module LookbookHelper
  def theme_choices
    {
      choices: %w[primary secondary danger warning info light dark link],
      description: 'Default bootstrap themes'
    }
  end

  def playground_source(file_path)
    "../../../app/views/components/#{file_path}/_playground.html.erb"
  end
end
