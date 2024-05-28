# frozen_string_literal: true

class CardComponentPreview < Lookbook::Preview
  # Interactive playground for experimenting with different button styles and states.
  # @param title "Card Title"
  # @param body "Card body text"
  # @param width "Card width"
  # @param theme select { choices: theme_options } "Default bootstrap themes"
  def playground(title: 'Title', body: 'Card body text', theme: 'primary', width: '18rem')
    render 'components/cards/playground', title:, body:, theme:, width:
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
