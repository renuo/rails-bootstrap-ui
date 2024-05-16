# frozen_string_literal: true

class ButtonComponentPreview < Lookbook::Preview
  # Interactive playground for experimenting with different button styles and states.
  # @param title "Button title"
  # @param theme select { choices: [primary, secondary, danger, warning, info, light, dark, link] } "Default bootstrap themes"
  # @param state select { choices: [default, active, disabled] } "Button state"
  # @param outline select { choices: [true, false] } "Outline button"
  # @param block select { choices: [true, false] } "Block button"
  def playground(title: 'Placeholder', theme: 'primary', state: 'default', outline: false, block: false)
    render 'components/buttons/playground', title: title, theme: theme, state: state, outline: outline, block: block
  end

  def themes
    render 'components/buttons/themes'
  end
end
