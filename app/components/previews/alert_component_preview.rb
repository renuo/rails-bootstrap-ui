# frozen_string_literal: true

class AlertComponentPreview < Lookbook::Preview
  include LookbookHelper
  # Interactive playground for experimenting with different alert styles and states.
  # @param title "Alert title"
  # @param theme select :theme_choices
  # @param link toggle "With link"
  # @param dismissible toggle "Dismissible alert"
  # @param icon toggle "With icon"
  # @source ../../../app/views/components/alerts/_playground.html.erb

  def playground(title: 'This is a alert', theme: 'primary', link: false, dismissible: false, icon: false)
    render 'components/alerts/playground', title:, theme:, link:, dismissible:, icon:
  end

  # @source ../../../app/views/components/alerts/_themes.html.erb
  def themes
    render 'components/alerts/themes'
  end
end
