# frozen_string_literal: true

module LookbookHelper
  def theme_choices
    {
      choices: %w[primary secondary danger warning info light dark link],
      description: 'Default bootstrap themes'
    }
  end
end
