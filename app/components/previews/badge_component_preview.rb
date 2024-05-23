# frozen_string_literal: true

class BadgeComponentPreview < Lookbook::Preview
  include LookbookHelper
  # Interactive playground for experimenting with different alert styles and states.
  # @param title "Badge title"
  # @param body "Badge body"
  # @param theme select :theme_choices
  # @param always_open toggle "Change badge behavior to not collapse when clicking another"
  # @param change_style toggle "Change badge style"
  # @source ../../../app/views/components/badges/_playground.html.erb

  def playground(title: 'Title', body: 'Badge body text', theme: 'primary', always_open: false, change_style: false)
    render 'components/badges/playground', title:, body:, theme:, always_open:, change_style:
  end

  # @source ../../../app/views/components/badges/_themes.html.erb
  def themes
    render 'components/badges/themes'
  end
end
