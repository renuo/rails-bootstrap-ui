# frozen_string_literal: true

class AccordionComponentPreview < Lookbook::Preview
  include LookbookHelper
  # Interactive playground for experimenting with different alert styles and states.
  # @param title "Accordion title"
  # @param body "Accordion body"
  # @param always_open toggle "Change accordion behavior to not collapse when clicking another"
  # @param change_style toggle "Change accordion style"
  # @source ../../../app/views/components/accordions/_playground.html.erb

  def playground(title: 'Title', body: 'Accordion body text', always_open: false, change_style: false)
    render 'components/accordions/playground', title:, body:, always_open:, change_style:
  end

  # @source ../../../app/views/components/accordions/_themes.html.erb
  def themes
    render 'components/accordions/themes'
  end
end
