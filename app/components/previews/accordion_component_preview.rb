# frozen_string_literal: true

class AccordionComponentPreview < Lookbook::Preview
  # Interactive playground for experimenting with different alert styles and states.
  # @param title "Accordion title"
  # @param body "Accordion body"
  # @param theme select :helpers.theme_choices
  # @param link toggle "With link"
  # @param dismissible toggle "Dismissible alert"
  # @param icon toggle "With icon"
  # @source ../../../app/views/components/accordions/_playground.html.erb

  def playground(title: 'Title', body: 'Accordion body text', theme: 'primary', link: false, dismissible: false, icon: false)
    render 'components/accordions/playground', title:, body:, theme:, link:, dismissible:, icon:
  end

  # @source ../../../app/views/components/accordions/_themes.html.erb
  def themes
    render 'components/accordions/themes'
  end
end

