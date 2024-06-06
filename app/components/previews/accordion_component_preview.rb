# frozen_string_literal: true

class AccordionComponentPreview < Lookbook::Preview
  include LookbookHelper
  # Interactive playground for experimenting with different alert styles and states.
  # @param title "Accordion title"
  # @param body "Accordion body"
  # @param always_open toggle "Always keep accordion open"
  # @param border toggle "Change accordion border style"
  # @source ../../../app/views/components/accordions/_playground.html.erb

  def playground(title: 'Title', body: 'Accordion body text', always_open: false, border: false)
    render 'components/accordions/playground', title:, body:, always_open:, border:
  end

  # @source ../../../app/views/components/accordions/_themes.html.erb
  def themes
    render 'components/accordions/themes'
  end
end
