# frozen_string_literal: true

class AlertComponentPreview < Lookbook::Preview
  include LookbookHelper
  # Interactive playground for experimenting with different alert styles and states.
  # @param title "Alert title"
  # @param colour select :theme_choices
  # @param alert_link toggle "Add an alert themed link"
  # @param dismissible toggle "Dismissible alert"
  # @param icon toggle "With icon"
  # @source ../../../app/views/components/alerts/_playground.html.erb

  def playground(title: 'This is an alert', colour: 'primary', alert_link: false, dismissible: false, icon: false)
    render 'components/alerts/playground', title:, colour:, alert_link:, dismissible:, icon:
  end

  # @source ../../../app/views/components/alerts/_themes.html.erb
  def themes
    render 'components/alerts/themes'
  end
end
