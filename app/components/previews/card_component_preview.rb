# frozen_string_literal: true

class CardComponentPreview < Lookbook::Preview
  # include LookbookHelper
  # Interactive playground for experimenting with different button styles and states.
  # @param title "Card Title"
  # @param name "Name"
  # @param width  select {choices: [25, 50, 75, 100]} "Card width"
  # @param theme select { choices: theme_options } "Card Background themes"
  # @param button_theme select { choices: theme_options } "Button themes"
  def playground(title: 'Title', name: 'Max Muster', theme: 'success', width: '100', button_theme: 'white')
    render 'components/cards/playground', title:, name:, theme:, width:, button_theme:
  end

  def themes
    render 'components/cards/themes'
  end
end

private

def theme_options
  {
    choices: %i[primary secondary success danger warning info light dark],
    include_blank: true
  }
end
