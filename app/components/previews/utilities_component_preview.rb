# frozen_string_literal: true

class UtilitiesComponentPreview < Lookbook::Preview
  include LookbookHelper
  # Interactive playground for experimenting with different button styles and states.
  # @source ../../../app/views/components/utilities/_playground.html.erb
  # @param position select { choices: [relative, absolute, sticky, fixed, static] } "Bootstrap position classes"
  # @param responsive_classes select { choices: [sm, md, lg, xl, xxl] } "Bootsrap responsive classes"
  # @param arrangement select { choices: [top, right, bottom, left] } "Bootstrap arrangement classes"
  # @param arrangement_values select { choices: [0, 50, 100] } "Bootstrap arrangement values"
  def playground(position: 'relative', responsive_classes: 'sm', arrangement: 'top', arrangement_values: '0')
    render 'components/utilities/playground', position:, responsive_classes:, arrangement:, arrangement_values:
  end

  # @source ../../../app/views/components/utilities/_themes.html.erb

  def themes
    render 'components/utilities/themes'
  end
end
