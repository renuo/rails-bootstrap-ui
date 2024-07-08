# frozen_string_literal: true

class PositionUtilitiesComponentPreview < Lookbook::Preview
  # Interactive playground for experimenting with different button styles and states.
  # @source ../../../app/views/components/position_utilities/_playground.html.erb
  # @param position select { choices: [absolute] } "Bootstrap position class example"
  # @param responsive_classes select { choices: [sm, md, lg, xl, xxl] } "Bootstrap responsive classes"
  # @param arrangement select { choices: [top, start, bottom, end] } "Bootstrap arrangement classes"
  # @param arrangement_values select { choices: [0, 50, 100] } "Bootstrap arrangement values"
  def playground(position: 'absolute', responsive_classes: 'sm', arrangement: 'top', arrangement_values: '0')
    render 'components/position_utilities/playground', position:, responsive_classes:, arrangement:,
                                                        arrangement_values:
  end

  # @source ../../../app/views/components/position_utilities/_themes.html.erb

  def themes
    render 'components/position_utilities/themes'
  end
end
