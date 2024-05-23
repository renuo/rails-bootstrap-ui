# frozen_string_literal: true

class BadgeComponentPreview < Lookbook::Preview
  include LookbookHelper
  # Interactive playground for experimenting with different alert styles and states.
  # @param title "Badge title"
  # @param body "Badge body"
  # @param theme select :theme_choices
  # @param change_style toggle "Change badge style"
  # @param inline toggle "Inline badge"
  # @source ../../../app/views/components/badges/_playground.html.erb

  def playground(title: 'Title', body: '+99', theme: 'danger', change_style: false, inline: false)
    render 'components/badges/playground', title:, body:, theme:, change_style:, inline:
  end

  # @source ../../../app/views/components/badges/_themes.html.erb
  def themes
    render 'components/badges/themes'
  end
end
