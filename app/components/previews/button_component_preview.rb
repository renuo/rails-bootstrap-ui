# frozen_string_literal: true
#
class ButtonComponentPreview < Lookbook::Preview
  # Interactive playground for experimenting with different button styles and states.
  # @param title "Button title"
  # @param theme select :helpers.theme_choices
  # @param disabled toggle "Disabled"
  # @param active toggle "Active"
  # @param outline toggle "Outline button"
  # @source ../../../app/views/components/buttons/_playground.html.erb
  def playground(title: 'Placeholder', theme: 'primary', disabled: false, outline: false, active: false)
    render 'components/buttons/playground', title:, theme:, disabled:, outline:, active:
  end

  # @source ../../../app/views/components/buttons/_themes.html.erb
  def themes
    render 'components/buttons/themes'
  end
end
