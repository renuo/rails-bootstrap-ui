# frozen_string_literal: true

class UtilitiesComponentPreview < Lookbook::Preview
  include LookbookHelper
  # Interactive playground for experimenting with different button styles and states.
  # @source ../../../app/views/components/utilities/_playground.html.erb
  def playground
    render 'components/utilities/playground'
  end
end
