# frozen_string_literal: true

# require 'lookbook_helper'

class ButtonComponentPreview < Lookbook::Preview
  # include LookbookHelper
  # Interactive playground for experimenting with different button styles and states.
  # @param title "Button title"
  # @param theme select :theme_choices
  # @param disabled toggle "Disabled"
  # @param active toggle "Active"
  # @param outline toggle "Outline button"
  # @source :playground_source('buttons')
  def playground(title: 'Placeholder', theme: 'primary', disabled: false, outline: false, active: false)
    render 'components/buttons/playground', title:, theme:, disabled:, outline:, active:
  end

  # @source ../../../app/views/components/buttons/_themes.html.erb
  def themes
    render 'components/buttons/themes'
  end
end
