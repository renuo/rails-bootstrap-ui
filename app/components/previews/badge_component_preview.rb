# frozen_string_literal: true

class BadgeComponentPreview < Lookbook::Preview
  include LookbookHelper
  # Interactive playground for experimenting with different alert styles and states.
  # @param text "Badge text"
  # @param notification "Badge notification text"
  # @param colour select :theme_choices
  # @param pill_button toggle "Add pill button class"
  # @param inline toggle "Inline badge"
  # @source ../../../app/views/components/badges/_playground.html.erb

  def playground(text: 'Badge', notification: '+99', colour: 'danger', pill_button: false, inline: false)
    render 'components/badges/playground', text:, notification:, colour:, pill_button:, inline:
  end

  # @source ../../../app/views/components/badges/_themes.html.erb
  def themes
    render 'components/badges/themes'
  end
end
