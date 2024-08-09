# frozen_string_literal: true

class TooltipComponentPreview < Lookbook::Preview
  include LookbookHelper

  # Bootstrap tooltips must be initialized manually.<br>
  # In Rails, the best way to do that and be Turbo-compatible, is to attach a stimulus controller to each tooltip.
  # In this example we attach the `tooltip` controller to all elements with the `data-controller="tooltip"` attribute.
  # This makes also the attribute `data-bs-toggle="tooltip"` unnecessary.
  # @source ../../../app/views/components/tooltips/_themes.html.erb
  def themes
    render 'components/tooltips/themes'
  end
end
