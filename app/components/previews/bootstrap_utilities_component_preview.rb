# frozen_string_literal: true

class BootstrapUtilitiesComponentPreview < Lookbook::Preview
  # Interactive playground for experimenting with different button styles and states.
  # @source ../../../app/views/components/bootstrap_utilities/_playground.html.erb
  # @param position select { choices: [relative, absolute, sticky, fixed, static] } "Bootstrap position classes"
  # @param responsive_classes select { choices: [sm, md, lg, xl, xxl] } "Bootstrap responsive classes"
  # @param arrangement select { choices: [top, right, bottom, left] } "Bootstrap arrangement classes"
  # @param arrangement_values select { choices: [0, 50, 100] } "Bootstrap arrangement values"
  def playground(position: 'relative', responsive_classes: 'sm', arrangement: 'top', arrangement_values: '0')
    render 'components/bootstrap_utilities/playground', position:, responsive_classes:, arrangement:,
                                                        arrangement_values:
  end

  # @source ../../../app/views/components/bootstrap_utilities/_themes.html.erb

  def themes
    render 'components/bootstrap_utilities/themes'
  end
end
